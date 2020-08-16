class Establishment < ApplicationRecord
  has_one_attached :cover
  has_one_attached :avatar

  has_many :products
  has_one :address

  has_many :establishment_categories
  has_many :category_types, through: :establishment_categories

  has_many :schedulings
  has_many :users, through: :schedulings

  has_many :favorites_establishments
  has_many :users, through: :favorites_establishments


  has_and_belongs_to_many :users

  scope :with_distance, -> (longitude, latitude) {
    joins(:address)
    .select("establishments.id, establishments.name,
          establishments.details,
          ST_Distance(addresses.geolocal, 'POINT (#{longitude} #{latitude})') as dist")
  }

  scope :order_by_distance, -> (longitude, latitude) {
    joins(:address)
    .order("ST_Distance(addresses.geolocal, 'POINT (#{longitude} #{latitude})') ASC")
  }

end
