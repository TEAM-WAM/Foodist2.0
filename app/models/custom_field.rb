class CustomField < ApplicationRecord

  belongs_to :customable_field, polymorphic: true
  has_many :custom_values

  validates :field_name, :customable_field_type, :customable_field_id, presence: true
  validates :field_name, length: { maximum: 100 }

end
