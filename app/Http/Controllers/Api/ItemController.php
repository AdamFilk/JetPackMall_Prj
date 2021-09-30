<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\item;
use App\Http\Resources\ItemResource;

class ItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $items = item::all();
            $result = ItemResource::collection($items);
            $message = 'Items retrieved successful';
            $status =200;

            $response=[
                'status'=> $status,
                'success'=>true,
                'message'=>$message,
                'data'=>$result,
            ];
        return response()->json($response);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
         $item= item::find($id);
        if (is_null($item)){
            #404
            $status= 404;
            $message = 'item not found';

            $response = [
                'status' => $status,
                'succcess'=>false,
                'message' =>$message
            ];
            return response()->json($response);
        }else{
            #200
            $status=200;
            $message = "Item Retrieved Successfully";
            $result = new ItemResource($item);
            $response=[
                'status' => $status,
                'succcess'=>true,
                'message' =>$message,
                'data' => $result
            ];
            return response()->json($response); 
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
