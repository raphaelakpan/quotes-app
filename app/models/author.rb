class Author < ApplicationRecord
  has_many :quotes, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def self.find_or_build_author(name)
    existing_author = where("LOWER(name) = :name", name: name.downcase).first

    return existing_author if existing_author.present?

    new(name: name)
  end
end
