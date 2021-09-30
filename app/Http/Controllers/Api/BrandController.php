<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\brand;
use App\Http\Resources\BrandResource;
use Validator;
class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $brands = brand::all();
            $result = BrandResource::collection($brands);
            $message = 'Brand retrieved successful';
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
            'logo' => 'required|mimes:jpeg,bmp,png,jpg|'
        ]);
        if ($validator->fails()){
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
            $logo = $request->logo;
            //fileupload
            $imageName= time().'.'.$logo->extension();
            $logo->move(public_path('images/logo'),$imageName);
            $filepath = 'images/logo/'.$imageName;

            //data insert
            $brand=new brand;
            $brand->name =$name;
            $brand->logo = $filepath;
            $brand->save();

            $status= 200;
            $message = 'Brand Created Successfully';
            $result = new BrandResource($brand);
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
        $brand= brand::find($id);
        if (is_null($brand)){
            #404
            $status= 404;
            $message = 'Brand not found';

            $response = [
                'status' => $status,
                'succcess'=>false,
                'message' =>$message
            ];
            return response()->json($response);
        }else{
            #200
            $status=200;
            $message = "Brand Retrieved Successfully";
            $result = new BrandResource($brand);
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
        $brand = brand::find($id);
        $name=$request->name;
        $newLogo = $request->logo;
        $oldLogo = $brand->logo;
        
           if($request->hasFile('photo')){
            //file upload
            $imageName= time().'.'.$newLogo->extension();
            $newLogo->move(public_path('images/logo'),$imageName);
            $filepath = 'images/logo/'.$imageName;

            if(\File::exists(public_path($oldLogo))){
                \File::delete(public_path($oldLogo));
            }
           }else{
            $filepath = $oldLogo;
           }
       
           $brand->name = $name;
           $brand->logo = $filepath;
           $brand->save();
           $status=200;
            $result = new BrandResource($brand);
            $message = "Brand updated Successfully";
            $response=[
                'status' => $status,
                'succcess'=>true,
                'message' =>$message,
                'data' => $result
            ];
            return response()->json($response); 
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $brand = brand::find($id);
        
         if (is_null($brand)){
            #404
            $status= 404;
            $message = 'Brand not found';

            $response = [
                'status' => $status,
                'succcess'=>false,
                'message' =>$message
            ];
            return response()->json($response);
        }else{
        $oldLogo=$brand->photo;
           if(\File::exists(public_path($oldLogo))) {
                \File::delete(public_path($oldLogo));
            }
        $brand->delete();
         $status = 200;
         $message = 'Brand is deleted successfully';
         $response=[
            'success'=>true,
            'status' => $status,
            'message'=>$message
         ];
         return response()->json($response);
    }
    }
}
