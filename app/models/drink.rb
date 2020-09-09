class Drink < ApplicationRecord
  searchkick
    belongs_to :user
    has_many :reviews
    has_many :review_users, through: :reviews, source: :user
    
    has_attached_file :image, styles: { medium: "400x600#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :name, :ingredients, :taste, :bar_name, :bar_location, presence: true 
end
