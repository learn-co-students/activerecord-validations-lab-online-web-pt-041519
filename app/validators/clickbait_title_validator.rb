class ClickbaitTitleValidator < ActiveModel::EachValidator

  def validate_each(post, attribute, value)
    valid_cb = ["Won't Believe", "Secret", "Guess"]

    unless !post.title.nil? && (valid_cb.any? { |cb| post.title.include?(cb) } || !!(post.title =~ /Top [1-9]/))
      post.errors[:title] << 'Not clickbait-y enough!'
    end
  end

end

# post.title.include?(cb)
