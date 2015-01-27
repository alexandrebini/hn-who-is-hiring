require 'open-uri'

module Scrapper
  module Jobs
    class << self
      def run!
        Post.all.each do |post|
          self.all(post).each do |comment|
            create(post: post, comment: comment)
          end
        end
      end

      # <tr>
      #   <td><img src="s.gif" height="1" width="40"></td>
      #   <p></p>
      def all(post)
        document = Nokogiri::HTML open(post.url)
        document.css('td > img[width="0"]').map do |img|
          img.parent.parent
        end.compact.uniq
      end

      def create(post:, comment:)
        href = comment.css('.comhead > a:last').attr('href')
        url = "https://news.ycombinator.com/#{ href }"

        job = Job.where(url: url).first_or_initialize
        job.post = post
        job.description = comment.css('p').to_s
        job.user = comment.css('.comhead > a:first').text
        job.save
      end

    end
  end
end