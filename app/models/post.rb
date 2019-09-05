class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {within: %w(Fiction Non-Fiction)}
  validate :clickbaity
end

def clickbaity
  bait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
  if bait.none? { |post| post.match title }
    errors.add(:title, "not enough baityness")
  end
end
