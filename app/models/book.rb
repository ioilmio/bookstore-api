class Book < ApplicationRecord
  # validates :title, presence: true
  # validates :category, presence: true
  # validates :author
  belongs_to :user
end
