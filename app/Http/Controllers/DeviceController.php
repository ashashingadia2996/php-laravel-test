<?php

namespace App\Http\Controllers;

use App\Models\Access;
use App\Models\Device;
use Illuminate\Http\Request;
use \Illuminate\Database\Eloquent\ModelNotFoundException;
class DeviceController extends Controller
{
    public function getDeviceInfo($id)
    {
        try {
            // Fetch the device by ID
            $device = Device::findOrFail($id);

            return response()->json([
                'success' => true,
                'data' => $device
            ], 200);

        } catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Device not found'
            ], 404);
        }
    }

    public function getUserDevices(Request $request)
    {
        // Get the user_id from the query parameters
        $userId = $request->get('user_id');

        // Validate the user_id
        if (!$userId) {
            return response()->json([
                'success' => false,
                'message' => 'User ID is required.',
            ], 400);
        }

        $accessRecords = Access::where('user_id', $userId)->get();

        // Check if access records exist
        if ($accessRecords->isEmpty()) {
            return response()->json([
                'success' => false,
                'message' => 'No devices found for this user.',
            ], 404);
        }

        // Get the device IDs from the access records
        $deviceIds = $accessRecords->pluck('device_id');

        // Fetch the devices based on the device_ids
        $devices = Device::whereIn('id', $deviceIds)->get();

        // Return the devices in the response
        return response()->json([
            'success' => true,
            'data' => $devices,
            'count' => $devices->count(),
        ]);
    }

}
