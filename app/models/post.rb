class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
    validate :is_clickbait

    def is_clickbait
        included = false
        @@phrases.each { |phrase| included = true if self.title && self.title.downcase =~ phrase }
        if not included
            errors.add(:title, "You need a more exciting title")
        end
    end

    @@phrases = [/won't believe/, /secret/, /top \d/, /guess/]
end
