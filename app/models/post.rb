class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbaitey

    def clickbaitey
        return if self.title.nil?
        # binding.pry
        possible_titles = ["Won't Believe", "Secret", "Top", "Guess"]
        possible_titles.each do |t|
            if self.title.include?(t)
                return 
            end
        end
        errors.add(:title, "Not Clickbaitey")
    end


end

# class ClickBaiter < ActiveModel::Validator
    
#     def validate(title)
#         if title.include? "Won\'t Believe" || 
#             title.include? "Secret" || 
#             title.include? "Top" || 
#             title.include? "Guess"
#         return true
#         else
#             return false
#         end
#     end
#   end

#       unless title.name.include?("Won\'t Believe") || title.name.include?("Secret") ||title.name.include?("Top") || title.name.include?("Guess")
#         title.errors[:name] << 'Not Click Bait!'
#       end