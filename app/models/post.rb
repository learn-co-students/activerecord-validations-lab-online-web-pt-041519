class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid option" } 
  validate :clickbaity
    def clickbaity
      if title && title.exclude?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
        errors.add(:title, "Not Clickbait-y enough")
      end
    end
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
end
