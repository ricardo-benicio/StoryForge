class Assembly < ApplicationRecord
  has_many :part, through: :assembly_parts
  belongs_to :book
  has_many :assembly_parts
end
