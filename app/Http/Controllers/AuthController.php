<?php
namespace App\Http\Controllers;

use App\Models\AccessToken;
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
            return response()->json(['error' => 'Validation Error', 'messages' => $validator->errors()], 422);
        }

        // Create the new user
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password), // Hash the password
        ]);

        // Return the new user's details along with the access token
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
            'email' => 'required|email',
            'password' => 'required|string|min:6',
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

        // Generate access token
        $accessToken = Str::random(64);
        AccessToken::updateOrCreate(
            ['user_id' => $user->id], // Ensure one access token per user
            [
                'token' => hash('sha256', $accessToken),
                'expires_at' => now()->addMinutes(15), // Short-lived token (e.g., 15 minutes)
            ]
        );

        // Delete all existing refresh tokens for the user
        RefreshToken::where('user_id', $user->id)->delete();

        // Generate refresh token
        $refreshToken = Str::random(64);
        RefreshToken::create([
            'user_id' => $user->id,
            'token' => hash('sha256', $refreshToken),
            'expires_at' => now()->addDays(30), // Long-lived token (e.g., 30 days)
        ]);

        // Return tokens and additional metadata
        return response()->json([
            'access_token' => $accessToken,
            'refresh_token' => $refreshToken,
            'token_type' => 'Bearer',
            'expires_in' => 15 * 60, // 15 minutes in seconds
        ]);
    }


    public function ping()
    {
        return response()->json(['message' => 'available'], 200);
    }

    public function refresh(Request $request)
    {
        $refreshToken = $request->input('refresh_token');

        if (!$refreshToken) {
            return response()->json(['error' => 'Refresh token is required'], 400);
        }

        $hashedToken = hash('sha256', $refreshToken);

        // Find the refresh token
        $refreshToken = RefreshToken::where('token', $hashedToken)->first();

        if (!$refreshToken || $refreshToken->expires_at < now()) {
            return response()->json(['message' => 'Invalid or expired refresh token'], 401);
        }

        // Get the user associated with the token
        $user = $refreshToken->user;

        // Revoke the old refresh token (optional: implement a single-use policy)
        $refreshToken->delete();

        // Find the access token
        $accessToken = AccessToken::where('user_id', $user->id);

        if($accessToken) {
            $accessToken->delete();
        }


        // Generate a new refresh token
        $newRefreshToken = Str::random(64);
        RefreshToken::create([
            'user_id' => $user->id,
            'token' => hash('sha256', $newRefreshToken),
            'expires_at' => now()->addDays(30),
        ]);

        $accessToken = Str::random(64);
        AccessToken::create([
            'user_id' => $user->id,
            'token' => hash('sha256', $accessToken),
            'expires_at' => now()->addDays(30),
        ]);

        return response()->json([
            'access_token' => $accessToken,
            'refresh_token' => $newRefreshToken,
            'token_type' => 'Bearer',
            'expires_in' => 60 * 60, // 1 hour for access token
        ]);
    }

}

