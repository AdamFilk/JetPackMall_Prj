<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestOneController extends Controller
{
    public function index()
    {
    	return view('hello');
    }

    public function user($name,$position,$city){
    	// dd($name,$position,$city);
    	$data=array(
    		'name'=> $name,
    		'position'=> $position,
    		'city'=> $city
    	);
    	// dd($data);
    	return view('user',$data);
    }
}