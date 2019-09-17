class User < ApplicationRecord
  # trường name không được bỏ trống
  validates :name, presence: true
  # trường email không được bỏ trống
  validates :email, presence: true
  # Quan hệ 1- N : 1 user có nhiều micropost
  has_many :microposts
end
