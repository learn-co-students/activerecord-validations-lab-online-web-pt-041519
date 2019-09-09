class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /(Won't Believe|Secret|Top \d|Guess)/
      record.errors[attribute] << ("Not a clickbait title")
    end
    
  end
end