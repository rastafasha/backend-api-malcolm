<?php

namespace App\Models\Sale;

use App\Models\Sale\Sale;
use App\Models\Course\Course;
use App\Models\Product\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CategoriaVentas extends Model
{
    use HasFactory;
    protected $fillable = [
        "name",

    ];

    public function courses()
    {
        return $this->hasMany(Course::class, "course_id");
    }

    public function products()
    {
        return $this->hasMany(Product::class, "product_id");
    }

    public function sales()
    {
        return $this->hasMany(Sale::class);
    }
}
