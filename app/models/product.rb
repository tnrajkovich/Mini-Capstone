class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  # end

  has_many :images
  # def images
  #   Image.where(product_id: self.id)
  # end

  has_many :orders, through: :carted_product

  belongs_to :category

  has_many :carted_products

  def is_discounted?
    if price < 500000
      return true
    else
      return false
    end
  end

  def tax
    tax = price * 0.09
    return tax
  end

  def total
    total = price + tax
    return total
  end

  def image_url
    if images.length > 0 && images[0].url
      images[0].url
    else
      "https://www.hutchinsontires.com/helpers/img/no_image.jpg"
    end
  end
end
