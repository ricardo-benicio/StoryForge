class Account < ApplicationRecord
  belongs_to :supplier

  validates :account_number, presence: true
  validate :account_digit_valid?

  private
  def account_digit_valid?
    d = AccountsHelper::CheckAccountDigit.new(account_number, digit)
    errors.add(:digit, 'invalido! verificar o numero.') if d.check_digit?
  end
end
