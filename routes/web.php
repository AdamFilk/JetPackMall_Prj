<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'FrontendController@index')->name('index');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
// Basic route
// get method
Route::get('hello','TestOneController@index');

//for all method
//get,post,put,patch, delete, option
Route::resource('test','TestTwoController');

//Route Parameters
//GET method
Route::get('user/{id}','TestThreeController@show');

//Multiple Route Parameters
Route::get('hellouser/{name}/{position}/{city}','TestOneController@user');


Route::group(['middleware'=>'role:admin','prefix'=> 'backside', 'as' => 'backside.'],function(){
	Route::resource('/category','CategoryController');
	Route::resource('/subcategory','SubcategoryController');
	Route::resource('/brand','BrandController');
	Route::resource('/item','ItemController');
	Route::resource('/township','TownshipController');
});

Route::get('brand/{id}','FrontendController@brand')->name('brand');
Route::get('promotion','FrontendController@promotion')->name('promotion');
Route::get('cart','FrontendController@cart')->name('cart');
Route::post('order','FrontendController@order')->name('order');
Route::get('ordersuccess','FrontendController@ordersuccess')->name('ordersuccess');
Route::get('detailitem/{id}','FrontendController@detailitem')->name('dexailitem');



