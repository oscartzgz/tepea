class Scrapers::TepeapulcoCriteriohidalgoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    municipality = Municipality.find_by_name('Tepeapulco')
    news_source = NewsSource.find_by_name('Criterio Hidalgo')
    return unless municipality

    scrap_url = 'https://criteriohidalgo.com/tag/tepeapulco'
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto scrap_url
    parsed_page = Nokogiri::HTML(browser.html)
    browser.close

    articles = parsed_page.css('#posts-container .post-item')

    articles.each do |article|
      title = article.css('.post-details .post-title').text
      image_url = 'https:' + article.css('img')&.attribute('src')&.value
      url = url_join(article.css('.post-details .more-link')&.attribute('href')&.value)

      News.where(municipality_id: municipality.id, url: url).first_or_create do |news|
        news.title = title
        news.image_url = image_url
        news.news_source = news_source
      end
    end

  rescue
    Bugsnag.notify("SCRAPPER - Criterio Hidalgo") if Rails.env.production?
  end

  def url_join(path)
    ['https://criteriohidalgo.com', path].join
  end
end
