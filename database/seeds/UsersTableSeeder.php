<?php

use Illuminate\Database\Seeder;
use App\User;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       $admin=User::create([
       	'name'=>'admin',
       	'profile'=>'images/user/admin.jpg',
       	'email'=>'admin@gmail.com',
       	'password'=>Hash::make('123456789'),
       	'phone'=> '0987654321',
       	'address'=>'Yangon'
       ]); 
       $admin->assignRole('admin');

       $customer=User::create([
       	'name'=>'Aung Chan',
       	'profile'=>'images/user/customer.png',
       	'email'=>'customer@gmail.com',
       	'password'=>Hash::make('123456789'),
       	'phone'=> '0987654321',
       	'address'=>'Yangon'
       ]); 
         $customer->assignRole('customer');
    }
}
