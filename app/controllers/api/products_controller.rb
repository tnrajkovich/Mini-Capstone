class Api::ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render "products.json.jb"
  end

  def one_product_method
    @product = Product.first
    render "products.json.jb"
  end
end
