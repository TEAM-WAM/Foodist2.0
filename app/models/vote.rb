class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true

  validates :voteable_type, :voteable_id, presence: true

  def self.vote_count(vote)
    vote_item = Vote.where(voteable_id: vote.voteable_id, voteable_type: vote.voteable_type)
    neg_votes = vote_item.where(up: false)
    pos_votes = vote_item.where(up: true)
    vote_number = pos_votes.length - neg_votes.length
  end

end
