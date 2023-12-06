<?php

namespace App\Http\Resources\Ecommerce\LandingProduct;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LandingProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        //es la campaña de descuento con la que sta relacionada
        $discount_g = null;

        if($this->resource->discount_c && $this->resource->discount_c_t){
            $discount_g = $this->resource->discount_c_t;
        }else{
            if($this->resource->discount_c && !$this->resource->discount_c_t){
                $discount_g = $this->resource->discount_c;
            }else{
                if(!$this->resource->discount_c && $this->resource->discount_c_t){
                    $discount_g = $this->resource->discount_c_t;
                }
            }
        }

        return[
                
            'id'=>$this->resource-> id,
            'title'=>$this->resource-> title,
            'subtitle'=>$this->resource-> subtitle,
            'slug'=>$this->resource-> slug,
            'price_usd'=>$this->resource-> price_usd,
            'price_bves'=>$this->resource-> price_bves,
            'count_class'=>$this->resource-> count_class,
            'files_count'=>$this->resource-> files_count,
            // 'count_students'=>$this->resource-> count_students,
            // 'avg_reviews'=>$this->resource-> avg_reviews ? round($this->resource-> avg_reviews,2): 0,
            // 'count_reviews'=>$this->resource-> count_reviews,
            'discount_g'=>$discount_g,
            'discount_date'=>$discount_g ? Carbon::parse($discount_g->end_date,)->format("Y-m-d"):NULL,
            'category_product_id'=>$this->resource-> category_product_id,
            'categories_product'=>[
                    'id'=> $this->resource->categories_product->id,
                    'name'=> $this->resource->categories_product->nombre
                ],
            'sub_category_id'=>$this->resource->sub_category_id,
            'sub_category'=>[
                    'id'=> $this->resource->sub_category->id,
                    'name'=> $this->resource->sub_category->nombre
                ],
            'vimeo_id'=>$this->resource-> vimeo_id ? "https://player.vimeo.com/video/".$this->resource-> vimeo_id : NULL,
            'description'=>$this->resource-> description,
                'who_is_it_for'=>json_decode($this->resource-> who_is_it_for),
                'requirements'=> json_decode($this->resource-> requirements),
            "imagen"=> $this->resource->imagen ? env("APP_URL")."storage/".$this->resource->imagen : null,
            // "imagen"=> $this->resource->imagen ? env("APP_URL").$this->resource->imagen : null,
            
                //malla curricular
                // "malla"=>$this->resource->sections->map(function($section){
                //     return[
                //         "id"=>$section->id,
                //         "name"=>$section->name,
                //         "clases"=>$section->classes->map(function($classe){
                //             return[
                //                 "id"=>$classe->id,
                //                 "name"=>$classe->name,
                //                 "vimeo"=>$classe->vimeo_id ? "https://player.vimeo.com/video/".$this->resource-> vimeo_id : NULL,
                //                 "file"=>$classe->files->map(function($file){
                //                     return [
                //                         "name"=> $file->name_file,
                //                         "url"=> env("APP_URL")."storage/".$file->file,
                //                         "size"=>$file->size,

                //                     ];
                //                 })
                //             ];
                //         })
                //     ];
                // }),
                "updated_at"=>$this->resource->updated_at->format("m/Y"),
                // "reviews"=>$this->resource->reviews->map(function($review){
                //     return[
                //         "message"=>$review->message,
                //         "rating"=>$review->rating,
                //         "user"=>[
                //             "full_name"=>$review->user->name.''.$review->user->surname,
                //             // "avatar"=> env("APP_URL")."storage/".$review->user->avatar
                //             "avatar"=> env("APP_URL").$review->user->avatar
                //         ]
                //     ];
                // })

        ];
    }
    }
