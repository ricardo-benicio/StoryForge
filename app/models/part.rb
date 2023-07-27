class Part < ApplicationRecord
  has_and_belongs_to_many :assemblies
  belongs_to :supplier
end
