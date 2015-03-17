require 'nokogiri'
require 'open-uri'

URLS = %w(http://www.goodreads.com/author/quotes/278.Nikola_Tesla?page=1, http://www.goodreads.com/author/quotes/278.Nikola_Tesla?page=2, http://www.goodreads.com/author/quotes/278.Nikola_Tesla?page=3)

quotes = []

URLS.each do |u|
  htm = open(u).read
  q_tmp = []
  xp_htm = Nokogiri::HTML htm
  t = xp_htm.xpath('//*[@class="quoteText"]')

  t.each {|s| q_tmp << s.text}

  q_tmp.each {|q| quotes << q.strip.scan(/([^\n]*)/)[0][0]}
end

puts quotes[rand(quotes.length)]
