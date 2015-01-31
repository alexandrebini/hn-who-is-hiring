require 'open-uri'

module Scraper
  module Posts
    URL = 'https://news.ycombinator.com/submitted?id=whoishiring'
    PATTERN = Regexp.new('Ask HN: Who is hiring?')
    DATE_PATTERN = Regexp.new('\d+ days ago')
    class << self
      def run!
        all.each { |post| create(post) }
      end

      def all
        @all ||= document.css('td.title a').map do |link|
          link.parent.parent if link.text.match(PATTERN)
        end.compact.uniq
      end

      def create(post)
        link = post.css('td.title a')
        url = "https://news.ycombinator.com/#{ link.attr('href') }"

        record = Post.where(url: url).first_or_initialize
        record.title = link.text
        record.published_at = DateTime.parse_distance_of_time_in_words(
          post.next.text)
        record.save
      end

      def document
        @document ||= Nokogiri::HTML open(URL), nil, 'utf-8'
      end
    end
  end
end