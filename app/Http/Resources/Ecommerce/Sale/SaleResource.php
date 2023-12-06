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
            "n_transaccion" => $this->resource->n_transaccion,
            "tipo_envio" => $this->resource->tipo_envio,
            "precio_envio" => $this->resource->precio_envio,
            "tracking_number" => $this->resource->tracking_number,
            "tiempo_estimado" => $this->resource->tiempo_estimado,
            "sale_details" => $this->resource->sale_details->map(function($sale_detail){
                return [
                    "id"=> $sale_detail->id,
                    "course"=> [
                        "id"=>$sale_detail->course->id,
                        "title"=>$sale_detail->course->title,
                        "imagen"=>env("APP_URL")."storage/".$sale_detail->course->imagen,
                        // "imagen"=>env("APP_URL").$sale_detail->course->imagen,
                    ],
                    // "product"=> [
                    //     "id"=>$sale_detail->product->id,
                    //     "title"=>$sale_detail->product->title,
                    //     "imagen"=>env("APP_URL")."storage/".$sale_detail->product->imagen,
                    // ],
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
            "created_at"=>$this->resource->created_at->format("Y-m-d h:i:s")
            
        ];
    }
}
