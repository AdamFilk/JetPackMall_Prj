<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class brand extends Model
{
    //
    use SoftDeletes;
    protected $fillable=['name','logo'];

    public function items()
    {
    	# code...
    	return $this->hasMany('App\item');
    }
}
