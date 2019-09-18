class ClickbaitValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        #binding.pry
        unless value.to_s.include? "Won't Believe"|| "Secret" ||"Top [number]" || "Guess"
            record.errors[attribute] << false
        end
    end

end
