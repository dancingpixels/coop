class User < ApplicationRecord
  before_validation :set_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, uniqueness: true
  validates :oracle_number, uniqueness: true, allow_nil: true
  validates :ledger_number, presence: true, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  enum :status, { active: 1, stopped: 2, withdrawn: 3, retired: 4,
                 deceased: 5}   
  enum :role, { member: 1, editor: 2, admin: 3 }

  private

  def set_email
    self.email ||= "equity#{User.count}@example.com"
  end
end
