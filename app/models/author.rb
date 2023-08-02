class Author < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :cpf, presence: true, uniqueness: true
  before_validation :cpf_is_valid

  private
  def cpf_is_valid
    errors.add(:cpf, 'invalido!') unless CPF::VerifierDigit.tap
    #self.cpf = CPF.valid?(cpf, strict: false) if cpf.present?
  end
end
