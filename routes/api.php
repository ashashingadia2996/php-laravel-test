<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\AuthController;
use \App\Http\Controllers\UserController;
use \App\Http\Controllers\DeviceController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);
Route::post('refresh', [AuthController::class, 'refresh']);

Route::middleware('checkAccessToken')->group(function () {
    Route::get('ping', [AuthController::class, 'ping']);
    Route::get('/user/{id}', [UserController::class, 'getUserInfo']);
    Route::get('/device/{id}', [DeviceController::class, 'getDeviceInfo']);
    Route::get('/devices', [DeviceController::class, 'getUserDevices']);
});