class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :non_clickbait

    
    def non_clickbait
        if title && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors[:title] << "Title is not clickbaity enough!"
        end
    end

end

