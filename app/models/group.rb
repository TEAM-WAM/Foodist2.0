class Group < ApplicationRecord

  has_many :lists, as: :listable
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :members, class_name: "User"

  validates :name, :description, :creator_id, presence: true
  validates :name, length: { maximum: 50 }
  validates :description, length: { maximum: 300 }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path("berries.jpg")

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
