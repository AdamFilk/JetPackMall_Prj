$(document).ready(function() {
	showTable();
	cartNoti();
	$('#shoppingcart_table').on('click','.plus_btn',function(){
				
				var id= $(this).data('id');
				var itemString=localStorage.getItem('cart');
				var itemArray=JSON.parse(itemString);
					$.each(itemArray,function(i,v){
						console.log(id)
						if(i==id){
							v.qty++;
						}
					})
				cart=JSON.stringify(itemArray);
				localStorage.setItem('cart',cart);
				showTable();
				cartNoti();
			})
	$('#shoppingcart_table').on('click','.minus_btn',function(){

				
				var id= $(this).data('id');

				var itemString=localStorage.getItem('cart');
				var itemArray=JSON.parse(itemString);
					$.each(itemArray,function(i,v){
						
						if(i==id){
							console.log(v.qty);
							v.qty--;
							if (v.qty==0) {
								
								itemArray.splice(id,1);
							}
						}
					})
					cart=JSON.stringify(itemArray);

				localStorage.setItem('cart',cart);
				showTable();
				cartNoti();
			})
	$('#shoppingcart_table').on('click','.remove',function(){
				
				var id= $(this).data('id');
				var itemString=localStorage.getItem('cart');
				var itemArray=JSON.parse(itemString);
					$.each(itemArray,function(i,v){
						
						if(i==id){
							itemArray.splice(id,1);
						}
					})
					cart=JSON.stringify(itemArray);

				localStorage.setItem('cart',cart);
				showTable();
				cartNoti();
			})
	$('.checkoutBtn').click(function () {
		var cart=localStorage.getItem('cart');
		var note = $("#notes").val();
		console.log(cart);
		console.log(note);

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN' : $('meta[name="csrf-token"]').attr('content')
			}
		})
		$.post('/order',{data:cart,note:note},function(response){
			localStorage.clear();
			location.href="ordersuccess";
		});
	});

	$('.addtocartBtn').on('click',function(){
		var id=$(this).data('id');
		var name=$(this).data('name');
		var codeno=$(this).data('codeno');
		var photo=$(this).data('photo');
		var price=$(this).data('unitprice');
		var discount=$(this).data('discount');
		console.log(discount);
		var qty=1;
		var mylist={id:id,codeno:codeno,name:name,photo:photo,price:price,discount:discount,qty:qty};
		console.log(mylist);
		var cart = localStorage.getItem('cart');
		var cartArray;

		if(cart==null){
			cartArray=Array();
		}else {
			cartArray = JSON.parse(cart);
		}
		var status=false;

		$.each(cartArray, function(i,v){
			if(id == v.id){
				v.qty++;
				status = true;
			}
		})
		if(!status){
			cartArray.push(mylist);
		}
		var cartData = JSON.stringify(cartArray);
		localStorage.setItem('cart',cartData);
		cartNoti();
})
	function cartNoti(){
		var cart = localStorage.getItem('cart');
		if(cart){
			var cartArray = JSON.parse(cart);
			var total=0;
			var noti= 0;
			$.each(cartArray, function(i,v){
				var unitprice = v.price;
				var discount = v.discount;
				var  qty = v.qty;
				if(discount){
					var price=  discount;
				}
				else{
					var price= unitprice;
				}
				var subtotal = parseInt(price) * qty;


				noti += qty ++;
				total += subtotal ++;
			})
			$('.cartNoti').html(noti);
			$('.cartTotal').html(total+'MMK');
		}else{
			$('.cartNoti').html(0);
			$('.cartTotal').html(0+'MMK');
		}

	}
	function showTable(){

		var  cart= localStorage.getItem('cart');

		if(cart){
			$('.shoppingcart_div').show();
			$('.noneshoppingcart_div ').hide();

			var cartArray =JSON.parse(cart);
			var shoppingcartData='';

			if (cartArray.length > 0) {
				var total=0;
				$.each(cartArray,function(i,v){
					var id= v.id;
					var codeno= v.codeno;
					var name = v.name;
					var unitprice = v.price;
					var discount = v.discount;
					var photo = v.photo;
					var qty = v.qty;

					if(discount){
						var price = discount;
					}else{
						var price = unitprice;
					}
					var subtotal = price * qty;
					shoppingcartData += `  <tr>
                                    <td class="shoping__cart__item">

                                        <img src="${photo}" alt="" class="img-fluid w-25">
                                        <h5>${name}<br>${codeno}</h5>
                                    </td>

                                    <td class="shoping__cart__price">`
                                    if(discount){
																shoppingcartData += `<p class="text-danger">${discount}MMK</p>
																<p class="font-weight-lighter"> 
																<del> ${unitprice} MMK </del> </p>	`
															}else {
																shoppingcartData += `<p class="font-weight-lighter"> 
																<del>  ${unitprice}MMK</del> </p>`
															}
									shoppingcartData +=`
                                        
				                                    </td>

				                                    <td class="shoping__cart__quantity">
												<button class="btn btn-outline-secondary plus_btn" data-id=${i}> 
													<i class="icofont-plus"></i> 
												</button>
											</td>	
											<td>
												${qty}
											</td>	
											<td class="shoping__cart__quantity">
												<button class="btn btn-outline-secondary minus_btn" data-id=${i}> 
													<i class="icofont-minus"></i>
												</button>
											</td>

				                                    <td class="shoping__cart__total">
				                                        ${subtotal} MMK
				                                    </td>
				                                    <td class="shoping__cart__item__close">
				                                        <span class="icon_close remove" data-id=${i}></span>
				                                    </td>
				                                </tr>`
														;




					total += subtotal ++;
					$('.total').html(total+" Ks");
				});
				$('#shoppingcart_table').html(shoppingcartData);
			}else {
			$('.shoping-cart').hide();
	
			}
		}else{
			$('.shoping-cart').hide();
		}
	}


})