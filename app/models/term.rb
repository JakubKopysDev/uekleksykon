class Term < ActiveRecord::Base
  self.per_page = 20
    validates :phrase, presence: true, length: { minimum: 2 }
    validates :explanation, presence: true, length: { minimum: 5 }
end
