def dictionary
  dict = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter (tweet)
  tweet = tweet.split
  new_tweet = []
  compare_words = dictionary
  i = 0

  while i < tweet.length
    current_word = tweet[i]
    current_word = compare_words[current_word.downcase] if compare_words.keys.include?(current_word.downcase)
    new_tweet << current_word
    i += 1
  end

  new_tweet.join(" ")
end

def bulk_tweet_shortener (tweets)
  tweets.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener (tweet)
  return word_substituter(tweet) if tweet.length >= 140
  tweet
end

def shortened_tweet_truncator (tweet)
  return word_substituter(tweet) if word_substituter(tweet).length <= 140

  tweet = tweet[0..136] + "..."
  tweet
end
