class CustomValue < ApplicationRecord

  belongs_to :custom_field
  belongs_to :customable_value, polymorphic: true

  validates :field_value, :custom_field_id, :customable_value_type, :customable_value_id, presence: true
  validates :field_value, length: { maximum: 100 }

end
