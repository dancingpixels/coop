class Transaction < ApplicationRecord
  belongs_to :user

  validates :ledger_number, presence: true
  validates :date, presence: true
  validates :savings_balance, presence: true
end
