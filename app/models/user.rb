class User < ApplicationRecord
  before_validation :set_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  enum :role, { member: 'member', editor: 'editor', admin: 'admin', 
                default: 'member' }

  validates :name, presence: true, uniqueness: true
  validates :oracle_number, uniqueness: true, allow_nil: true
  validates :ledger_number, presence: true, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :status, 
            inclusion: { in: %w(ACTIVE STOPPED WITHDRWAN RETIRED DECEASED) ,
            message: "%{value} not a valid membership status." }
  validates :role, presence: true

  private

  def set_email
    self.email ||= "equity#{User.count}@example.com"
  end
end