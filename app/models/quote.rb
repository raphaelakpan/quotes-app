class Quote < ApplicationRecord
  belongs_to :author

  validates :content, presence: true, length: { minimum: 3, maximum: 1000 }
  validates :author, presence: true

  before_save :check_if_content_exists

  private

  def check_if_content_exists
    quote = Quote.where("content ~* :content", content: content.strip)
    if quote.present?
      errors.add(:content, "already exists")
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end
end
