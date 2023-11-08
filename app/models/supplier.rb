require 'cpf_cnpj'
class Supplier < ApplicationRecord
  has_one :account
  has_one :part

  validates :name, presence: true, length: { maximum: 60 }
  validates :cnpj, presence: true, uniqueness: true
  before_validation :cnpj_is_valid?

  private
  def cnpj_is_valid?
    self.cnpj = CNPJ.new(cnpj, strict = false).formatted if cnpj.present?
  end
end
