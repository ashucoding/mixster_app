class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2]
  has_many :drinks
  has_many :reviews, dependent: :destroy
  has_many :drink_reviews, through: :drinks, source: :reviews
  has_many :reviewed_drinks, through: :reviews, source: :drink
  scope :five_star_drinks, -> {joins(drinks: [:reviews]).where("reviews.rating=5")}

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
