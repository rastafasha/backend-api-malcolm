<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Todo extends Model
{
    use HasFactory;
    protected $fillable = [

        'titulo',
        'description',
        'status',
    ];

    const activo = 'activo';
    const pending = 'pending';
    const terminado = 'terminado';
    const urgente = 'urgente';

    /*
    |--------------------------------------------------------------------------
    | functions
    |--------------------------------------------------------------------------
    */

    public function scopeForPublic(Builder $builder)
    {
        $builder->where("status", Todo::activo);
        return $builder->get();
    }

    public function setCreateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['created_at']= Carbon::now();
    }

    public function setUpdateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['updated_at']= Carbon::now();
    }
}
