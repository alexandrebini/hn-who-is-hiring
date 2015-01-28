require 'open-uri'

module Scrapper
  module Jobs
    class << self
      def run!
        Post.all.each do |post|
          self.all(post).each do |comment|
            create(post, comment)
          end
        end
      end

      # <tr>
      #   <td><img src="s.gif" height="1" width="40"></td>
      #   <p></p>
      def all(post)
        document = Nokogiri::HTML open(post.url)
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

        job = Job.where(url: url).first_or_initialize
        job.post = post
        job.description = comment.css('p').to_s
        job.user = comment.css('.comhead > a:first').text
        job.published_at = DateTime.parse_distance_of_time_in_words(
          comment.css('.comhead').text)
        job.save
      end
    end
  end
end