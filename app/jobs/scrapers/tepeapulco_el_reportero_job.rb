class Scrapers::TepeapulcoElReporteroJob < ApplicationJob
  queue_as :default

  
  def perform(*args)
    scrap_url = 'http://elreporterohgo.com/noticias/?s=tepeapulco'
    municipality = Municipality.find_by_name("Tepeapulco")
    return unless municipality

    browser = Watir::Browser.new :chrome, headless: true
    browser.goto scrap_url
    parsed_page = Nokogiri::HTML(browser.html)
    browser.close

    articles = parsed_page.css(".post-list.group .post-row article")

    articles.each do |article|
      title = article.css("h2.post-title a").text
      description = article.css(".entry.excerpt p").text
      url = article.css("h2.post-title a").attribute("href").value
      image_url = article.css(".post-thumbnail img").attribute("src").value

      News.where(municipality_id: municipality.id, url: url).first_or_create do |news|
        news.title = title
        news.description = description
        news.image_url = image_url
      end
    end
  end
end
