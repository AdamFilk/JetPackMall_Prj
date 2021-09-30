<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class order extends Model
{
    //orderdate
    protected $fillable=['voucherno', 'total','note' ,'status','user_id'];
    public function user()
    {
    	# code...
    	return $this->belongsTo('App\User');
    }
    public function items()
    {
    	return $this->belongsToMany('App\item','order_details','order_id','item_id')
    	->withPivot('qty')
    	->withTimestamps();;
    }
}
