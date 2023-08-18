class Part < ApplicationRecord
  has_many :assembly#, through: :assembly_part
  belongs_to :supplier
  has_many :assembly_part
end
