class User < ApplicationRecord
  before_validation :set_email

  has_secure_password
  has_many :sessions, dependent: :destroy 
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  enum :role, { member: 'member', editor: 'editor', admin: 'admin', 
                default: 'member' }

  validates :name, presence: true, uniqueness: true
  validates :oracle_number, uniqueness: true, allow_nil: true
  validates :ledger_number, presence: true, uniqueness: true
  validates :email_address, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :status, 
            inclusion: { in: %w(ACTIVE STOPPED WITHDRWAN RETIRED DECEASED) }
  validates :role, presence: true

  private

  def set_email
    self.email_address = "equity#{User.count}@example.com" if email_address.blank?
  end
end