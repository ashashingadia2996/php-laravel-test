<?php

namespace App\Http\Middleware;

use App\Models\AccessToken;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckAccessToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Get the token from the Authorization header
        $accessToken = $request->header('Authorization');

        if (!$accessToken || !str_starts_with($accessToken, 'Bearer ')) {
            return response()->json(['error' => 'Access Token Missing or Invalid'], 401);
        }

        // Extract the token (remove 'Bearer ')
        $accessToken = substr($accessToken, 7);

        // Check if token exists in the database and is valid
        $tokenRecord = AccessToken::where('token', hash('sha256', $accessToken))
            ->where('expires_at', '>', now())
            ->first();

        if (!$tokenRecord) {
            return response()->json(['error' => 'Unauthorized or Token Expired'], 401);
        }

        // Pass the user information to the request
        $request->merge(['user_id' => $tokenRecord->user_id]);

        return $next($request);
    }
}
