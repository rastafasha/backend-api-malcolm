<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    use HasFactory;

    protected $fillable = [

        'lastname',
        'phone',
        'whatsapp',
         'email',
         'subject',
         'comment',
        'name',
        'status'
    ];

    const PENDING = 'PENDING';
    const RESOLVED = 'RESOLVED';

    /*
    |--------------------------------------------------------------------------
    | functions
    |--------------------------------------------------------------------------
    */

    public static function statusTypes()
    {
        return [
            self::PENDING, self::RESOLVED
        ];
    }
}
