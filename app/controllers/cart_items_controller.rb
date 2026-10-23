class CartItemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new
  end

  def create
    @cart_item = current_cart.cart_items.build(cart_item_params)
    if @cart_item.save
      redirect_to current_cart
    else
      render :new
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to current_cart
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :qty)
  end
end