<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\brand;
use App\Http\Resources\BrandResource;
use App\Subcategory;
use App\Http\Resources\SubcategoryResource;

class ItemResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        $baseurl= URL('/');
        $photos= json_decode($this->photo);
        $photo = $baseurl.'/'.$photos[0];
        return  [
        'item_id' => $this->id,
        'item_name' => $this->name,
        'codeno' => $this->codeno,
        'description' => $this->description,
        'brand_id'=> $this->brand_id,
        'price'=> $this->price,
        'discount'=> $this->discount,
        'item_photo'=> $photo,
        'item_photos'=> $photos,
        'brand' => new BrandResource(brand::find($this->brand_id)),
        'subcategory_id'=> $this->subcategory_id,
        'subcategory' => new SubcategoryResource(Subcategory::find($this->subcategory_id)),
        'created_at' =>$this->created_at->format('d-m-y'),
        'updated_at' =>$this->updated_at ->format('d-m-y'),
        ];
    }
}
