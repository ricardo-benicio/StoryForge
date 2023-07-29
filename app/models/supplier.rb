class Supplier < ApplicationRecord
  has_one :account
  has_one :part
end
