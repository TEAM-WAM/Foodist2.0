class List < ApplicationRecord

  belongs_to :listable, polymorphic: true
  has_many :list_restaurants
  has_many :custom_fields, as: :customable_field
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :restaurants, through: :list_restaurants

  validates :title, :listable_id, :listable_type, presence: true
  validates :title, length: { maximum: 100 }

  def list_vote_count
    list = List.find(self.id)
    vote_item = list.votes.where(voteable_id: self.id, voteable_type: "List")
    neg_votes = vote_item.where(up: false)
    pos_votes = vote_item.where(up: true)
    vote_number = pos_votes.length - neg_votes.length 
  end

end
