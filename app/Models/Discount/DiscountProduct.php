<?php

namespace App\Models\Discount;

use Carbon\Carbon;
use App\Models\Product\Product;
use App\Models\Discount\Discount;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class DiscountProduct extends Model
{
    use HasFactory;
    protected $fillable =[
        'discount_id',
        'product_id',

    ];

    public function setCreateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['created_at']= Carbon::now();
    }

    public function setUpdateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['updated_at']= Carbon::now();
    }

    // relaciones

    public function product(){
        return $this->belongsTo(Product::class);
    }

    public function discount(){
        return $this->belongsTo(Discount::class);
    }
}
