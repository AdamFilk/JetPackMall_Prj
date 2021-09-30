<x-frontend>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg subtitle">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2> Promotion </h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0"> A - Z </option>
                                        <option value="0"> Z - A </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>{{$count_promoitems}}</span> Products found</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	@foreach($promoitems as $promoitem)
                    	@php
                    	$id=$promoitem->id;
                    	$codeno=$promoitem->codeno;
                    	$name=$promoitem->name;
                    	$photos=json_decode($promoitem->photo);
                    	$photo=$photos[0];
                    	$unitprice=$promoitem->price;
           				$discountprice=$promoitem->discount;
                    	@endphp
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="{{asset($photo)}}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="{{route('detailitem',$id)}}"><i class="fa fa-eye"></i></a></li>
                                        
                                        <li><a href="{{route('cart')}}"
                                        	data-id="{{$id}}"
                                            data-name="{{$name}}"
                                            data-codeno="{{$codeno}}"
                                            data-unitprice="{{$unitprice}}"
                                            data-discount="{{$discountprice}}"
                                            data-photo="{{$photo}}"
                                        	class="addtocartBtn"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__discount__item__text">
                                    <h5><a href="#">{{$name}}</a></h5>
                                    <div class="product__item__price">{{$unitprice}} Ks<span>{{$discountprice}} Ks</span></div>
                                </div>  
                            </div>
                        </div>
                        @endforeach
                    </div>
                    <div>
                             {!! $promoitems->links() !!}
                    </div>
                
                  
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
</x-frontend>