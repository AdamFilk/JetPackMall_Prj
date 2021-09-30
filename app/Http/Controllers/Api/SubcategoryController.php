<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Subcategory;
use App\Http\Resources\SubcategoryResource;

use Validator;
class SubcategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $subcategories = Subcategory::all();
            $result = SubcategoryResource::collection($subcategories);
            $message = 'Subcategory retrieved successful';
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
        $validator = Validator::make($request->all(),[
            'name'=> 'required|string|max:255|unique:categories',
            'category_id' => 'required|numeric|min:0|not_in:0'
        ]);
        if($validator->fails()){
        $status=400;
            $message = 'Validation Error';
            $response =[
                'status'=> $status,
                'success'=>false,
                'message'=>$message,
                'data' =>$validator->errors(),
            ];
            return response()->json($response);
         }
         else{
             $name=$request->name;
        $category_id= $request->category_id;
        //data insert
        $subcategory=new Subcategory();
            $subcategory->name =$name;
            $subcategory->category_id = $category_id;
            $subcategory->save();
            $status= 200;
            $message = 'Subcategory Created Successfully';
            $result = new SubcategoryResource($subcategory);
            $response=[
                'success'=>true,
                'status'=>$status,
                'message'=>$message,
                'data'=>$result,
            ];
            return response()->json($response);
         }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $subcategory= Subcategory::find($id);
        if (is_null($subcategory)){
            #404
            $status= 404;
            $message = 'Subcategory not found';

            $response = [
                'status' => $status,
                'succcess'=>false,
                'message' =>$message
            ];
            return response()->json($response);
        }else{
            #200
            $status=200;
            $message = "Subategory Retrieved Successfully";
            $result = new SubcategoryResource($subcategory);
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
