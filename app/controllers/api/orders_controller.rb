class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_product = CartedProduct.where(id: current_user.id, status: "carted")

    calculated_subtotal = carted_product.first.product.price * carted_product.first.quantity.to_i
    calculated_tax = carted_product.first.product.tax * carted_product.first.quantity.to_i
    calculated_total = carted_product.first.product.total * carted_product.first.quantity.to_i

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    @order.save
    render "show.json.jb"
  end

  def index
    @orders = Order.find_by(id: current_user.id)
    render "index.json.jb"
  end

  def show
    @order = Order.find_by(id: params["id"].to_i)
    render "show.json.jb"
  end
end
