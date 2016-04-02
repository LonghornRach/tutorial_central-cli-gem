class TutorialCentral::Scraper

  def self.scrape_categories(url)
    site = Nokogiri::HTML(open(url))
    categories = {}
    rows = site.css("tr.search_blocks")
    rows.each do |row|
      title = row.css("a").text.strip
      url = row.css("a @href").text
      categories[title] = url
    end
    categories      
  end

  def self.scrape_tutorials(url)
    site = Nokogiri::HTML(open(url))
    tutorials = {}
    rows = site.css("div.date div.day")
    count = 0
    last = rows.to_a.rindex(rows.last) #refactor?
    rows.each do |row| 
      if count < last
        title = row.css("a.js-tutorial").first.attr("title")
        url = row.css("a.js-tutorial").first.attr("href")
        tutorials[title] = url
        count += 1
      end
    end
    tutorials
  end

end
