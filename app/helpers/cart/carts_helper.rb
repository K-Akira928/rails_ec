module Cart::CartsHelper
  def require_cart
    session[:cart_id] ||= Cart.create.id
  end
end
