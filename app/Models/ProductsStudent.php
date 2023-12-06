<?php

namespace App\Models;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Course\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProductsStudent extends Model
{
    use HasFactory;
    protected $fillable =[
        "product_id",
        "user_id",
        "clases_checkeds",
        "state" // 1 iniciado 2 terminado
    ];

    public function setCreateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['created_at']= Carbon::now();
    }

    public function setUpdateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['updated_at']= Carbon::now();
    }

    public function product(){
        return $this->belongsTo(Product::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }
}
