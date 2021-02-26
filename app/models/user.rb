class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password
  has_many :articles, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 26 }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    length: { maximum: 40 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
    
end
