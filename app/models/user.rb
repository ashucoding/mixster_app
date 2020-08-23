class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :drinks
  has_many :reviews, dependent: :destroy
  has_many :drink_reviews, through: :drinks, source: :reviews
  has_many :reviewed_drinks, through: :reviews, source: :drink
  scope :five_star_drinks, -> {joins(drinks: [:reviews]).where("reviews.rating=5")}
end
