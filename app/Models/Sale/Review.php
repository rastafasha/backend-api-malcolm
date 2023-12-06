<?php

namespace App\Models\Sale;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Course\Course;
use App\Models\Sale\SaleDetail;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Review extends Model
{
    use HasFactory;
    protected $fillable =[
        "course_id",
        "user_id",
        "sale_detail_id",
        "message",
        "rating"
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
        return $this->belongsTo(Course::class);

    }
    public function user(){
        return $this->belongsTo(User::class);

    }
    public function sale_detail(){
        return $this->belongsTo(SaleDetail::class);

    }
}
