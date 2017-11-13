class User < ApplicationRecord
  include BCrypt

  validates :username, :name, presence: true
  validates :username, uniqueness: true

  validate :validate_password

  def password
    @password ||= Password.new(password_type_thing)
  end

  def password=(plain_text_password)
    @raw_password = plain_text_password
    @password = Password.create(plain_text_password)
    self.password_type_thing = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

  def validate_password
    if @raw_password.length < 6
      errors.add(:password, "must be 6 characters or more")
    end
  end
end
