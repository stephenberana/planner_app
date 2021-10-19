class Task < ApplicationRecord
   belongs_to :category
   belongs_to :user

   validates :task_title, length: { minimum: 1, maximum: 280 }
   validates :description, length: { minimum: 1, maximum: 1000 }
end
