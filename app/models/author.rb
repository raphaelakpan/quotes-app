class Author < ApplicationRecord
  has_many :quotes

  validates :name, presence: true, uniqueness: true

  def self.find_or_build_author(author)
    existing_author = where("LOWER(name) = :name", name: author.downcase).first

    return existing_author if existing_author.present?

    new(name: author)
  end
end
