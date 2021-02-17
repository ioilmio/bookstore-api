class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github google-oauth2]

  has_many :books, dependent: :destroy
  # has_many :comments, dependent: :destroy

  #   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/

  # validates :email, presence: true, length: { maximum: 50 },
  #                   format: { with: VALID_EMAIL_REGEX },
  #                   uniqueness: { case_insensitive: true }

  # validates :password, presence: true, length: { minimum: 8 }

  # validates :password_confirmation, presence: true, length: { minimum: 8 }

  # def self.from_omniauth(access_token)
  #   data = access_token.info
  #   User.where(email: data['email']).first

  #   # Uncomment the section below if you want users to be created if they don't exist
  #   # unless user
  #   #     user = User.create(name: data['name'],
  #   #        email: data['email'],
  #   #        password: Devise.friendly_token[0,20]
  #   #     )
  #   # end
  # end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.name = auth.info.name # assuming the user model has a name
  #     # user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails,
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #   end
  # end

  def self.from_omniauth(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.skip_confirmation!
    end
  end
end
