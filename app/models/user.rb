class User < ApplicationRecord
  # chuyển email về dạng chữ in thường
  before_save { self.email = email.downcase }
  # trường name không được bỏ trống, tối đa 50 kí tự
  validates :name,  presence: true, length: { maximum: 50 }
  # trường email không được bỏ trống, tối đa 255 kí tự, duy nhất (không phân biệt in hoa hay in thường), phải là định dạng 1 email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
