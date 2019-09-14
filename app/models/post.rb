class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: {maximum: 250}
  validates :category, inclusion:{in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if title && title.exclude?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
      errors.add(:title, "Insufficent level of Clickbait-yness")
    end 
  end 
end
