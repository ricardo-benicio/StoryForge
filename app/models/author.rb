require 'cpf_cnpj'
class Author < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :cpf, presence: true, uniqueness: true
  before_validation :cpf_is_valid?

  private
  def cpf_is_valid?
    self.cpf = CPF.new(cpf, strict: false).formatted if cpf.present?
  end
end
