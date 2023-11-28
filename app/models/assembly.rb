class Assembly < ApplicationRecord
  has_and_belongs_to_many :part
  has_one :book

  validates :name, presence: true
end
