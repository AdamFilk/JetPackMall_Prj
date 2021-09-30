        <?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class item extends Model
{
    //
     use SoftDeletes;
    protected $fillable=['codeno','name','photo', 'price','discount','description','subcategory_id','brand_id' ];

    public function brand()
    {
    	# code...
    	return $this->belongsTo('App\brand');
    }
    public function subcategory()
    {
    	# code...
    	return $this->belongsTo('App\Subcategory');
    }
    public function orders()
    {
    	return $this->belongsToMany('App\order','order_details','order_id','item_id')
    	->withPivot('qty')
    	->withTimestamps();;
    }
     
}
