<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Device;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
        // Call the UserSeeder
//        $this->call([
//            UserSeeder::class,
//        ]);

        // Create Users
        User::factory(10)->create();

        // Create Devices
        Device::factory(20)->create();

        // Call the DeviceSeeder
        $this->call([
            DeviceSeeder::class
        ]);
    }
}
