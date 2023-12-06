<?php

namespace App\Http\Resources\Pickup;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PickupResource extends JsonResource
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
            'nombreCompleto' => $this->resource-> nombreCompleto,
            'idNumber' => $this->resource->idNumber,
            'phone' => $this->resource->phone,
            'email' => $this->resource->email,
            'user_id'=>$this->resource-> user_id,
            'user_id'=>$this->resource-> user_id,
                'user'=>[
                    'id'=>$this->resource->user->id,
                    'full_name'=>$this->resource->user->name.' '.$this->resource->user->surname,
                    'email'=>$this->resource->user->email,
                ],
            
        ];
    }
}
