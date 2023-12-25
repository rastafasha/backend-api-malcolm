<?php

namespace App\Http\Resources\Ecommerce\Sale;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SaleResource extends JsonResource
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
            "method_payment" => $this->resource->method_payment,
            "currency_payment" => $this->resource->currency_payment,
            "total" => $this->resource->total,
            "price_dolar" => $this->resource->price_dolar,
            "n_transaccion" => $this->resource->n_transaccion,
            "tipo_envio" => $this->resource->tipo_envio,
            "status" => $this->resource->status,
            "precio_envio" => $this->resource->precio_envio,
            "tracking_number" => $this->resource->tracking_number,
            "tiempo_estimado" => $this->resource->tiempo_estimado,
            
            "tiempo_estimado" => $this->resource->tiempo_estimado,
            'user'=>$this->resource-> user ? [
                "id"=>$this->resource->user->id,
                "profesion"=>$this->resource->user->profesion,
                "full_name"=>$this->resource->user->name.' '.$this->resource->user->surname,
                "avatar"=>env("APP_URL")."storage/".$this->resource->user->avatar,
                // "avatar"=>env("APP_URL").$this->resource->instructor->avatar,

            ] : NULL,
            "sale_details" => $this->resource->sale_details->map(function($sale_detail){
                return [
                    "id"=> $sale_detail->id,
                    
                    "course_id" => $sale_detail->course->id ?? null,
                    "course" => $sale_detail->course ?
                        [
                            "id"=>$sale_detail->course->id,
                            "title"=>$sale_detail->course->title,
                            "slug"=>$sale_detail->course->slug,
                            "category_sale_id"=>$sale_detail->course->category_sale_id,
                            "sale_category" =>$sale_detail->course->sale_category ?
                                [
                                    'id'=> $sale_detail->course->sale_category->id,
                                    'name'=> $sale_detail->course->sale_category->name
                                ]: NUll,
                            "imagen"=>env("APP_URL")."storage/".$sale_detail->course->imagen,
                        ]:NULL,
                    "product_id" => $sale_detail->product->id ?? null,
                    "product" => $sale_detail->product ?
                        [
                            "id"=>$sale_detail->product->id,
                            "title"=>$sale_detail->product->title,
                            "category_sale_id"=>$sale_detail->product->category_sale_id,
                            "imagen"=>env("APP_URL")."storage/".$sale_detail->product->imagen,
                        ]: NUll,
                    
                    "type_discount"=>$sale_detail->type_discount,
                    "discount"=>$sale_detail->discount,
                    "type_campaing"=>$sale_detail->type_campaing,
                    "code_discount"=>$sale_detail->code_discount,
                    "code_cupon"=>$sale_detail->code_cupon,
                    "precio_unitario"=>$sale_detail->precio_unitario,
                    "total"=>$sale_detail->total,
                    "created_at"=>$sale_detail->created_at->format("Y-m-d h:i:s")
                ];
            }),
            "created_at"=>$this->resource->created_at->format("Y-m-d h:i:s"),
            
            
        ];
    }
}
