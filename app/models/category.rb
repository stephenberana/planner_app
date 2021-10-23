class Category < ApplicationRecord
    has_many :tasks
    belongs_to :user

    validates :category_title, length: { minimum: 1, maximum: 25 }, uniqueness: true
    validates :category_description, length: { minimum: 1, maximum: 280 }
end
