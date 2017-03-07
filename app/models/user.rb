class User < ApplicationRecord
  has_many :books, -> { where('give_back= ? ', false) }, through: :borrow_books
  has_many :borrow_books

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data[:email]).first

    unless user
        user = User.create(name: data[:name],
           email: data[:email],
           password: Devise.friendly_token[0,20],
           image_url: data[:image],
           uid: data[:uid]
        )
    end
    user
  end

  validates :name, presence: true
end
