class Post < ActiveRecord::Base
  self.per_page = 6
  validates :title, presence: true, length: { minimum: 5, maximum: 20 }
  validates :content, presence: true, length: { minimum: 10 }
end
