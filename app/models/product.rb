class Product < ApplicationRecord
  has_many_attached :images
  has_many :schedulings

  belongs_to :establishment

  has_many :product_categories
  has_many :category_types, through: :product_categories

  belongs_to :subcategory, optional: true

  scope :with_distance, -> (longitude, latitude) {
    joins(:establishment => :address)
    .select("products.*, ST_Distance(addresses.geolocal, 'POINT (#{longitude} #{latitude})') as dist")
    .order("ST_Distance(addresses.geolocal, 'POINT (#{longitude} #{latitude})') ASC")
  }
end
