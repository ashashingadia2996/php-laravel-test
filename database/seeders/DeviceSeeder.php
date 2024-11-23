<?php

namespace Database\Seeders;

use App\Models\Access;
use App\Models\Device;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DeviceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get all users
        $users = User::all();

        // Check if users exist
        if ($users->isEmpty()) {
            $this->command->info('No users found. Please seed the Users table first.');
            return;
        }

        // Loop through users to create devices and assign access
        foreach ($users as $user) {
            // Create 5 devices per user
            $devices = Device::factory()->count(5)->create();

            // Assign the devices to the user through the access table
            foreach ($devices as $device) {
                Access::create([
                    'user_id' => $user->id,
                    'device_id' => $device->id,
                ]);
            }
        }

        $this->command->info('Devices and access records have been seeded successfully.');
    }
}
