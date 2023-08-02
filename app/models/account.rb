class Account < ApplicationRecord
  belongs_to :supplier
  validates :account_number, presence: true, uniqueness: true
end
