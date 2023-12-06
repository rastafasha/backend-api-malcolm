<?php

namespace App\Models;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Product\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Direccion extends Model
{
    use HasFactory;
    protected $fillable = [

        'id',
        'title',
        'user_id',
        'direccion',
        'referencia',
        'ciudad',
        'zip',
        'googlemaps',

    ];

    public function setCreateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['created_at']= Carbon::now();
    }

    public function setUpdateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['updated_at']= Carbon::now();
    }

    public function user(){
        return $this->belongsTo(User::class);

    }

    public function product(){
        return $this->belongsTo(Product::class);

    }
}
