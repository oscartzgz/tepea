class Scrapers::TepeapulcoElReporteroJob < ApplicationJob
  queue_as :default

  def perform(*args)
    municipality = Municipality.find_by_name('Tepeapulco')
    news_source = NewsSource.find_by_name('El Reportero')
    return unless municipality

    keywords = %w[tepeapulco sahagun tlanalapa apan irolo zapata]

    scrap_url = 'http://elreporterohgo.com/noticias/'
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto scrap_url
    parsed_page = Nokogiri::HTML(browser.html)

    articles = parsed_page.css('.post-title a')
    urls = articles.map{ |link| link.attributes['href'].value }

    urls.each do |url|
      browser.goto url
      page = Nokogiri::HTML(browser.html)
      title = page.css('.post-inner .post-title').text
      image_url = page.css('.post-inner .wp-block-image:first img')&.attribute('src')&.value
      article_text = page.css('.post-inner .entry-inner').text.downcase

      next unless keywords.any? { |keyword| keyword.in?(article_text) }

      News.where(municipality_id: municipality.id, url: url).first_or_create do |news|
        news.title = title
        news.image_url = image_url
        news.news_source = news_source
      end
    end

    browser.close
  end
end
