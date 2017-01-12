class Post < ApplicationRecord
  belongs_to :user
  validates :title, :content, precence: true
end
