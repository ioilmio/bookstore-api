class Book < ApplicationRecord
  belongs_to :user
  # validates :title, presence: true
  # validates :author
  # validates :category, presence: true
end
