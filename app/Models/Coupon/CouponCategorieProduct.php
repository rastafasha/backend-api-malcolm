<?php

namespace App\Models\Coupon;

use Carbon\Carbon;

use App\Models\Product\CategoryProduct;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CouponCategorie extends Model
{
    use HasFactory;
    protected $fillable =[
        'coupon_id',
        'category_id',

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

    public function category_product(){
        return $this->belongsTo(CategoryProduct::class);
    }
}
