<?php
namespace App\Http\Controllers;

use App\Models\AccessToken;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Models\RefreshToken;

class AuthController extends Controller
{
    // Register new user
    public function register(Request $request)
    {
        // Validate the incoming request
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        // If validation fails, return error response
        if ($validator->fails()) {
            return response()->json([
                'error' => 'Validation Error',
                'messages' => $validator->errors()
            ], 422);
        }

        // Create the new user
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password), // Hash the password
        ]);

        // Return the new user's details
        return response()->json([
            'message' => 'User registered successfully.',
            'user' => $user,
        ]);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        // Validate the credentials
        $validator = Validator::make($credentials, [
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'error' => 'Validation Error',
                'messages' => $validator->errors()
            ], 422);
        }

        // Check if user exists and password is correct
        $user = User::where('email', $credentials['email'])->first();
        if (!$user || !Hash::check($credentials['password'], $user->password)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $accessToken = $this->createNewAccessToken($user->id);
        $refreshToken = $this->createNewRefreshToken($user->id);

        // Return tokens and additional metadata
        return response()->json([
            'access_token' => $accessToken,
            'refresh_token' => $refreshToken,
            'token_type' => 'Bearer',
            'expires_in' => 15 * 60, // 15 minutes in seconds
        ]);
    }

    public function createNewRefreshToken($userId)
    {
        try {
            // Delete all existing refresh tokens for the user
            RefreshToken::where('user_id', $userId)->delete();
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'User not found'
            ], 404);
        }

        // Generate refresh token
        $refreshToken = Str::random(64);
        RefreshToken::create([
            'user_id' => $userId,
            'token' => hash('sha256', $refreshToken),
            'expires_at' => now()->addDays(30), // Long-lived token (e.g., 30 days)
        ]);

        return $refreshToken;
    }
    public function createNewAccessToken($userId)
    {
        try {
            // Find the access token and delete it
            AccessToken::where('user_id', $userId)->delete();
        }  catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'User not found'
            ], 404);
        }

        // Generate access token
        $accessToken = Str::random(64);
        AccessToken::create([
            'user_id' => $userId,
            'token' => hash('sha256', $accessToken),
            'expires_at' => now()->addMinutes(15), // Token valid for 15 minutes
        ]);

        return $accessToken;
    }

    public function ping()
    {
        return response()->json(['message' => 'I\'m available'], 200);
    }

    public function refresh(Request $request)
    {
        $refresh_token = $request->input('refresh_token');

        if (!$refresh_token) {
            return response()->json(['error' => 'Refresh token is required'], 400);
        }

        $currenrRefreshToken = $this->findRefreshTokenFromRequestParam($refresh_token);
        $userId = $currenrRefreshToken->user_id;

        $accessToken = $this->createNewAccessToken($userId);
        $newRefreshToken = $this->createNewRefreshToken($userId);

        return response()->json([
            'access_token' => $accessToken,
            'refresh_token' => $newRefreshToken,
            'token_type' => 'Bearer',
            'expires_in' => 60 * 60, // 1 hour for access token
        ]);
    }

    public function findRefreshTokenFromRequestParam($refreshToken)
    {
        $hashedToken = hash('sha256', $refreshToken);

        // Find the refresh token
        $refreshToken = RefreshToken::where('token', $hashedToken)->first();

        if (!$refreshToken || $refreshToken->expires_at < now()) {
            return response()->json(['message' => 'Invalid or expired refresh token'], 401);
        }

        return $refreshToken;
    }
}

