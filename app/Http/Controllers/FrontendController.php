<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\item;
use App\brand;
use App\order;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class FrontendController extends Controller
{
    public function index()
    {
    	$categories= Category::all();
    	$topitems= item::all()->random(3);
    	$reviewitems= item::all()->random(3);
    	$latestitems=item::latest()->take(3)->get();
    	$discountitems=item::whereNotNull('discount')->take(3)->get();
    	// $discountitems=item::where('discount','>','0')->take(3)->get();
    	return view('frontend.index',compact('categories','topitems','reviewitems','latestitems','discountitems'));
    }
    public function brand($id)
    {
    	
    	$branditems= item::where('brand_id',$id)->get();
    	$brand = brand::find($id);

    	return view('frontend.brand',compact('branditems','brand'));

    }
    public function promotion()
    {
    	
    	$promoitems= item::whereNotNull('discount')->paginate(3);
        $count_promoitems= item::whereNotNull('discount')->count();
    	
    	
    	return view('frontend.promotion',compact('promoitems','count_promoitems'));

    }
    public function cart()
    {
        
        return view('frontend.cart');

    }
    public function order(Request $request){
        $carts= json_decode($request->data);
        $note= $request->note;
        $orderdate=Carbon::now();
        $voucherno= uniqid();

        $total=0;
        foreach($carts as $cart){
            $unitprice = $cart->price;
            $discount=$cart->discount;
            if($discount){
                $price=$discount;
            }else{
                $price= $unitprice;
            }
            $total += $price*$cart->qty;
        }
        $status = 'order';
        $auth= Auth::user();
        $userid=$auth->id;

        $order=new order;
        $order->orderdate=$orderdate;
        $order->voucherno=$voucherno;
        $order->total=$total;
        $order->note= $note;
        $order->status=$status;
        $order->user_id=$userid;
        $order->save();

        foreach ($carts as $value){
            $itemid=$value->id;
            $qty = $value->qty;

            $order->items()->attach($itemid,['qty'=>$qty]);
        }
        return response()->json([
            'status' => 'Order Successfully Created!'
        ]);
    }
    public function ordersuccess()
    {
    
        return view('frontend.ordersuccess');

    }
    public function detailitem($id)
    {
        $item=item::find($id);
        return view('frontend.detailitem',compact('item'));

    }

}
