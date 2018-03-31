require 'sidekiq-scheduler'

class ScrapWorker

  include Sidekiq::Worker

  def perform(*args)

    require 'open-uri'
    require 'nokogiri'

    doc = Nokogiri::HTML(open("http://elreporterohgo.com/noticias/"))

    # Getting for post in current page
    posts = doc.css(".pad.group article.post")

    posts.each do |post|

      title = post.at_css(".post-title a") ? post.css(".post-title a").text : nil
      url = post.at_css(".post-title a") ? post.css(".post-title a").attr("href") : nil
      image_url = post.at_css(".post-thumbnail img.wp-post-image") ? post.css(".post-thumbnail img.wp-post-image").attr("src") : nil
      description = post.at_css(".entry.excerpt") ? post.css(".entry.excerpt p").text : nil
      notice = News.new(
        title: title,
        url: url,
        image: image_url,
        description: description,
        published_at: Date.today,
        editor: 'El reportero'
      )

      notice.save! unless News.where(url: notice.url).present?
    end
    
  end

end
