class Api::CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: "carted",
    )
    @carted_product.save
    render "show.json.jb"
  end

  def index
    @carted_products = CartedProduct.where(id: current_user.id, status: "carted")
    render "index.json.jb"
  end

  def destroy
    @carted_products = CartedProduct.where(id: current_user.id, status: "carted")
    @carted_products.status = "removed"
    render json: { message: "This product has been removed from your shopping cart." }
  end
end
