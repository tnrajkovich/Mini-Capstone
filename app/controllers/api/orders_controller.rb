class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: @order.quantity * @order.price,
      tax: subtotal * 0.10,
      total: subtotal + tax,
    )
    @order.save
    render "show_orders.json.jb"
  end

  def index
    @orders = Order.find_by(id: current_user.id)
    render "index_orders.json.jb"
  end

  def show
    @order = Order.find_by(id: params["id"].to_i)
    render "show_orders.json.jb"
  end
end
