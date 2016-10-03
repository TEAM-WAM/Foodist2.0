class Profile < ApplicationRecord

  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path("medium/profile_apple.jpg")

  validates :user_id, presence: true
  validates :zipcode, length: { maximum: 10 }
  validates :phone_number, length: { maximum: 16 }
  validates :gender, length: { maximum: 50 }
  validates :bio, length: { maximum: 300 }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
