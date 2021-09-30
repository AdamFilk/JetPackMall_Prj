<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider; 
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Schema;
use App\brand;
use App\Subcategory;
use App\Township;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {

        Schema::defaultStringLength(191);

        $brands= brand::all();

        $subcategories= Subcategory::all()->random(5);
        $townships= Township::all();

        View::Share('data',[$brands,$subcategories,$townships]);
    }
}
