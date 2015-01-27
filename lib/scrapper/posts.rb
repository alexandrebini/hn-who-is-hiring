require 'open-uri'

module Scrapper
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
        days_ago = post.next.text.scan(DATE_PATTERN).join.scan(/\d+/).first.to_i

        post = Post.where(url: url).first_or_initialize
        post.title = link.text
        post.published_at = days_ago.days.ago
        post.save
      end

      def document
        @document ||= Nokogiri::HTML open(URL)
      end
    end
  end
end