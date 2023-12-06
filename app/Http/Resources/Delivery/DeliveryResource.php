<?php

namespace App\Http\Resources\Delivery;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DeliveryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return[
            "id"=>$this->resource->id,
            'titulo' => $this->resource-> titulo,
            'precio' => $this->resource->precio,
            'dias' => $this->resource->dias,
            'tiempo' => $this->resource->tiempo,
            
        ];
    }
}
