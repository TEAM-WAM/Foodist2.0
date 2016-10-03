class ListRestaurant < ApplicationRecord

  before_save :add_restaurant_name

  belongs_to :list
  belongs_to :restaurant
  has_many :list_experiences
  has_many :custom_fields, as: :customable_field
  has_many :custom_values, as: :customable_value

  validates :name, :cuisine, :fav_dish, :restaurant_type, length: { maximum: 100 }

  def add_restaurant_name
    restaurant = Restaurant.find(self.restaurant_id)
    self.name = restaurant.name
  end

end
