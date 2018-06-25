class User < ActiveRecord::Base
  has_secure_password
  has_many :shoes
  has_many :buyers
  has_many :shows_bought, through: :buyers, source: :shows
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, format:{with: EMAIL_REGEX}
  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

end
