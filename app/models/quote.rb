class Quote < ApplicationRecord
  belongs_to :author

  validates :content, presence: true, length: { minimum: 3, maximum: 1000 }
end
