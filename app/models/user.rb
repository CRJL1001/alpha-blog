class User < ApplicationRecord
  has_many :articles
  validates :username, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false } 
  VALIDE_EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALIDE_EMAIL_REGEX }
end