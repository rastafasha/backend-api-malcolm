<?php

namespace App\Http\Resources\Direccion;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DireccionResource extends JsonResource
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
            'direccion' => $this->resource->direccion,
            'referencia' => $this->resource->referencia,
            'ciudad' => $this->resource->ciudad,
            'title' => $this->resource->title,
            'zip' => $this->resource->zip,
            // 'googlemap' => $this->resource->googlemap,
            'user_id'=>$this->resource-> user_id,
            'user_id'=>$this->resource-> user_id,
            'user'=>[
                'id'=>$this->resource->user->id,
                    "name"=>$this->resource->user->name,
                    "surname"=>$this->resource->user->surname ?? '',
                    "role"=>$this->resource->user->role,
                    "phone"=>$this->resource->user->phone,
                    'email'=>$this->resource->user->email,
                    // "avatar"=> $user->avatar ? env("APP_URL")."storage/".$user->avatar : null,
                ],
            'googlemaps'=> json_decode($this->resource-> googlemaps),

            
        ];
    }
}
