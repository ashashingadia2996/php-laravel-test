<?php

namespace Database\Factories;

use App\Models\Device;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Device>
 */
class DeviceFactory extends Factory
{
    protected $model = Device::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $this->faker->word() . ' Device',
            'model' => strtoupper($this->faker->bothify('???-###')), // e.g., "ABC-123"
            'serial_number' => strtoupper($this->faker->bothify('SN-######')), // e.g., "SN-123456"
        ];
    }
}
