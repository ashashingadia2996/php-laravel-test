<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Access extends Model
{
    use HasFactory;

    // Specify the table name (optional, Laravel will infer it automatically)
    protected $table = 'access';

    // Specify the attributes that can be mass-assigned
    protected $fillable = [
        'user_id',
        'device_id',
    ];

    /**
     * Get the user that owns the access.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the device that is associated with the access.
     */
    public function device()
    {
        return $this->belongsTo(Device::class);
    }
}
