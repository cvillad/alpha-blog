class User < ApplicationRecord
    has_many :articles
    validates :username, presence: true, uniqueness: {case_sensitive: false}, 
                                        length: { minimum: 3, maximum: 26}
    validates :email, presence: true, uniqueness: {case_sensitive: false}, 
                                    length: { maximum: 40},
                                    format: { with: URI::MailTo::EMAIL_REGEXP }
end