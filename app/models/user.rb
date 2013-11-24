class User < ActiveRecord::Base
  has_secure_password

  has_many :decks

  validates :username, presence: true,
            length: {maximum: 16}

  validates :email, presence: true,
            format: {with: /\w+@\w+\.\w{2,}/},
            uniqueness: {case_sensitive: false}

  validates :password, presence: true,
            length: {minimum: 6}
end
