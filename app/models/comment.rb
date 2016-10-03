class Comment < ApplicationRecord

  belongs_to :user
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true

  validates :body, :commentable_type, :user_id, :commentable_id, presence: true
  validates :body, length: { maximum: 1000 }

  def comment_vote_count
    comment = Comment.find(self.id)
    vote_item = comment.votes.where(voteable_id: self.id, voteable_type: "Comment")
    neg_votes = vote_item.where(up: false)
    pos_votes = vote_item.where(up: true)
    vote_number = pos_votes.length - neg_votes.length
  end

end
