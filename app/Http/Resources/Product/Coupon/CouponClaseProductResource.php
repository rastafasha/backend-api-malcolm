<?php

namespace App\Http\Resources\Curso\Coupon;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CouponClaseProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return[
            'id'=>$this->resource-> id,
            'code'=>$this->resource->code,
            'state'=>$this->resource->state ?? 1, 
            'type_coupon'=>$this->resource-> type_coupon,
            'type_discount'=>$this->resource->type_discount,//porcentaje o entero
            'discount'=>$this->resource->discount,//monto del descuento
            'type_count'=>$this->resource->type_count,//1 es ilimitado 2 limitado 
            'num_use'=>$this->resource->num_use,//numero de usos permitidos
            
            'products'=>$this->resource->products->map(function($product_aux){
                return[
                    'id'=>$product_aux->product?->id,
                    'title'=>$product_aux->product?->title,
                    'imagen'=>env("APP_URL")."storage/".$product_aux->product?->imagen,
                    'aux_id'=>$product_aux->id
                ];
            }),

            'categories'=> $this->resource->categories->map(function($categorie_aux){
                return[
                    'id'=>$categorie_aux->category?->id,
                    'nombre'=>$categorie_aux->category?->nombre,
                    'imagen'=>env("APP_URL")."storage/".$categorie_aux->category?->imagen,
                    // 'imagen'=>env("APP_URL").$categorie_aux->category?->imagen,
                    'aux_id'=>$categorie_aux->id
                ];
            }),
            
        ];
    }
}
