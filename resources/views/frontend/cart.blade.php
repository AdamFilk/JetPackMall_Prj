 <x-frontend>
 <!-- Breadcrumb Section Begin -->
      <section class="breadcrumb-section set-bg subtitle">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2> Shopping Cart </h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
  
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th char="" class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th></th>
                                    <th>Quantity</th>
                                   <th></th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="shoppingcart_table">
                                
                            </tbody>
                            <tfoot>
                                <tr> 
                                    <td>
                                        <h4>Notes:</h4>
                                    </td>
                            <td colspan="5"> 
                                <textarea class="form-control mt-3" id="notes" placeholder="Any Request..."></textarea>
                            </td>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn primary-btn">CONTINUE SHOPPING</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                        
                            <li>Total <span class="cartTotal"></span></li>
                        </ul>
                        @if(Auth::check())
                        <a href="javascript:void(0)" class="primary-btn checkoutBtn">PROCEED TO CHECKOUT</a>
                        @else
                        <a href="{{route('login')}}" class="primary-btn">PROCEED TO CHECKOUT</a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
</x-frontend>