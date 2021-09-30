<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Category;

use App\Subcategory;

class SubcategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $subcategories = Subcategory::all();
         return view('backend.subcategory.list',compact('subcategories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $categories = Category::all();
         return view('backend.subcategory.new',compact('categories'));
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
            'name'=> ['required','string','max:255','unique:subcategories'],
            'category_id' => 'required|numeric|min:0|not_in:0'
        ]);
         if($validator){
        $name=$request->name;
        $category_id= $request->category_id;
        //data insert
        $subcategory=new Subcategory();
            $subcategory->name =$name;
            $subcategory->category_id = $category_id;
            $subcategory->save();
            return redirect()->route('backside.subcategory.index')->with("successMsg",'New subcategory has been added');
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
        $categories = Category::all();
        $subcategory = Subcategory::find($id);
        return view('backend.subcategory.edit',compact('subcategory','categories'));

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
            'category_id' => 'required|numeric|min:0|not_in:0'
        ]);
         if($validator){
        $name=$request->name;
        $category_id= $request->category_id;
        //data insert
        $subcategory=Subcategory::find($id);
            $subcategory->name =$name;
            $subcategory->category_id = $category_id;
            $subcategory->save();
            return redirect()->route('backside.subcategory.index')->with("successMsg",'A subcategory has been updated');
         }
         else{
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
        $subcategory = Subcategory::find($id);
        $subcategory->delete();

        return redirect()->route('backside.subcategory.index')->with('successMsg','A Subcategory has been deleted');
    }
}
