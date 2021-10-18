class Task < ApplicationRecord
   belongs_to :category
   belongs_to :user
   belongs_to :current

   validates :task_title, length: { minimum: 1, maximum: 15 }
   validates :description, length: { minimum: 1, maximum: 280 }
end
