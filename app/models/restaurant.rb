class Restaurant < ApplicationRecord

  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :name, :address, :city, presence: true
  validates :average_cost_for_two, :zipcode, length: { maximum: 10 }
  validates :name, :locality, :city, :cuisines, length: { maximum: 100 }
  validates :address, length: { maximum: 200 }
  validates :restaurant_url, :menu_url, format: { with: URI.regexp }

  def restaurant_vote_count
    restaurant = Restaurant.find(self.id)
    vote_item = restaurant.votes.where(voteable_id: self.id, voteable_type: "Restaurant")
    neg_votes = vote_item.where(up: false)
    pos_votes = vote_item.where(up: true)
    vote_number = pos_votes.length - neg_votes.length
  end
end
