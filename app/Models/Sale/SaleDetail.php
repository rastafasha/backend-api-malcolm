<?php

namespace App\Models\Sale;

use Carbon\Carbon;
use App\Models\Sale\Sale;
use App\Models\Sale\Review;
use App\Models\Course\Course;
use App\Models\Product\Product;
use App\Models\Sale\ReviewProducts;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class SaleDetail extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        "sale_id",
        "course_id",
        "product_id",
        "type_discount",
        "discount",
        "type_campaing",
        "code_discount",
        "code_cupon",
        "precio_unitario",
        "total",
        "tipo_envio",
        "precio_envio",
        "tracking_number",
        "tiempo_estimado",
    ];

    public function setCreateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['created_at']= Carbon::now();
    }

    public function setUpdateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['updated_at']= Carbon::now();
    }

    public function course(){
        return $this->belongsTo(Course::class,"course_id");

    }
    public function product(){
        return $this->belongsTo(Product::class,"product_id");

    }

    public function sale(){
        return $this->belongsTo(Sale::class);

    }

    public function review(){
        return $this->hasOne(Review::class);

    }
    public function review_products(){
        return $this->hasOne(ReviewProducts::class);

    }

   

    public function sale_category(){
        return $this->belongsTo(Categoria_ventas::class);
    }
}
