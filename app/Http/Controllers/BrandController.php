<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\brand;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
         $brands = brand::all();

         return view('backend.brand.list',compact('brands'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
         return view('backend.brand.new');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = $request->validate([
            'name'=> ['required','string','max:255','unique:brands'],
            'logo' => 'required|mimes:jpeg,bmp,png,jpg'
        ]);

        //
        if($validator){
            $name=$request->name;
            $logo= $request->logo;

            //fileupload
            $imageName= time().'.'.$logo->extension();
            $logo->move(public_path('images/brand'),$imageName);
            $filepath = 'images/brand/'.$imageName;

            //data insert
            $brand=new brand;
            $brand->name =$name;
            $brand->logo = $filepath;
            $brand->save();

            return redirect()->route('backside.brand.index')->with("successMsg",'New Category has been added');
        }
        else{
            return redirect::back()->withErrors($validator);
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
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $brand = brand::find($id);
        return view('backend.brand.edit',compact('brand'));
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
        $validator = $request->validate([
            'name'=> ['required','string','max:255'],
            'logo' => 'mimes:jpeg,bmp,png,jpg'
        ]);
        if($validator){
            $name=$request->name;
           $newLogo= $request->logo;
           $oldLogo=$request->oldLogo;
           if($request->hasFile('logo')){
            //file upload
            $imageName= time().'.'.$newLogo->extension();
            $newLogo->move(public_path('images/brand'),$imageName);
            $filepath = 'images/brand/'.$imageName;

            if(\File::exists(public_path($oldLogo))){
                \File::delete(public_path($oldLogo));
            }
           }else{
            $filepath = $oldLogo;
           }
            //Data Update
           $brand= brand::find($id);
           $brand->name = $name;
           $brand->logo = $filepath;
           $brand->save();

           return redirect()->route('backside.brand.index')->with('successMsg','An Existing Brand has been Updated');    
        }else{
            return redirect::back()->withErrors($validator);
        }
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
        $brand->delete();

        return redirect()->route('backside.brand.index')->with('successMsg','A Brand has been deleted');
    }
}
