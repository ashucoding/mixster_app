class Review < ApplicationRecord
    belongs_to :user
    belongs_to :drink
validates :rating, numericality: {only_integer: true, less_than:6, greater_than:-1}
validates :comment, length: {maximum: 100}
end
