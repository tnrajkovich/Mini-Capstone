class Api::ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render "products.json.jb"
  end

  def first_product_method
    @product = Product.first
    render "first_product.json.jb"
  end
end
