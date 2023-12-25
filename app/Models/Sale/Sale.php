<?php

namespace App\Models\Sale;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Sale\SaleDetail;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Sale extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        "user_id",
        "method_payment",
        "currency_total",
        "currency_payment",
        "product_id",
        "course_id",
        "total",
        "price_dolar",
        "n_transaccion",
        "month",
        "day",
        "year",
        "estado",
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
        return $this->belongsTo(User::class, "user_id");
    }

    public function sale_details(){
        return $this->hasMany(SaleDetail::class);
    }

    // buscar 

    public function scopeSaleFilterAdvance($query, $search, $status)
    {
        if($search){
            $query->where('method_payment', 'like', '%'.$search.'%')
            ->orWhere('total', 'like', '%'.$search.'%')
            ->orWhere('price_dolar', 'like', '%'.$search.'%')
            ->orWhere('N_TRANSACCION', 'like', '%'.$search.'%');
        }
        
        if($status){
            $query->where('status', $status);
        }
        return $query;
    }
}
