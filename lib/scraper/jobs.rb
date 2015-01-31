require 'open-uri'

module Scraper
  module Jobs
    class << self
      def run!(posts = Post.all)
        posts.each do |post|
          self.all(post).each do |comment|
            create(post, comment)
          end
        end
      end

      # <tr>
      #   <td><img src="s.gif" height="1" width="40"></td>
      #   <p></p>
      def all(post)
        document = Nokogiri::HTML open(post.url), nil, 'utf-8'
        document.css('td > img[width="0"][height="1"]').map do |img|
          comment = img.parent.parent

          if comment.css('.comhead > a:last') &&
            comment.css('span.comment').text != '[deleted]'
            comment
          end
        end.compact.uniq
      end

      def create(post, comment)
        href = comment.css('.comhead > a:last').attr('href')
        url = "https://news.ycombinator.com/#{ href }"

        record = Job.where(url: url).first_or_initialize
        record.post = post
        record.description = comment.css('p').to_s
        record.user = comment.css('.comhead > a:first').text
        record.published_at = DateTime.parse_distance_of_time_in_words(
          comment.css('.comhead').text)
        record.save
      end
    end
  end
end