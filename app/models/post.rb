class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /Won't Believe|Secret|Top \d*|Guess/
      record.errors[attribute] << (options[:message] || "is not a title")
    end
  end
end

class Post < ActiveRecord::Base

  validates :title, presence: true, title: true
  validates :content, length: { minimum: 250 } 
  validates :summary, length: { maximum: 250 } 
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

end