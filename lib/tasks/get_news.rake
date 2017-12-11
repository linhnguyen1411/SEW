require "rss"
require "open-uri"

desc "Get news feed"
task get_news: :environment do
  rss_feed
end

  def rss_feed
    rss_links = RssUrl.all
    rss_links.each do |rss_link|
      if rss_link.news_site_id == 1
        vnexpress_news rss_link
        @rss_results.each do |rss_result|
          if (((DateTime.now.in_time_zone.utc - rss_result[:pubDate].in_time_zone.utc).to_i)/60) <= 4
            news = News.create(rss_result)
          end
        end
      elsif rss_link.news_site_id == 2
        vnn_news rss_link
        @rss_results.each do |rss_result|
          if (((DateTime.now.in_time_zone.utc - rss_result[:pubDate].in_time_zone.utc).to_i)/60) <= 4
            news = News.create(rss_result)
          end
        end
      end
    end
  end

  def vnexpress_news rss_link
    @rss_results = []
    rss = RSS::Parser.parse(open(rss_link.url).read, false).items[0..10]
    rss.each do |result|
      index = result.description.index('</br>')
      index = index + 4
      image = result.description.to(index)
      result.description = result.description.from(index+1).to(-1)
      result = { rss_url_id: rss_link.id, news_site_id: rss_link.news_site_id,
        category_id: rss_link.category_id,title: result.title, pubDate: result.pubDate,
        link: result.link, description: result.description, image: image,
        highlight: 0 }
      @rss_results.push(result)
    end
    return @rss_results
  end

  def vnn_news rss_link
    @rss_results = []
    rss = RSS::Parser.parse(open(rss_link.url).read, false).items[0..10]
    rss.each do |result|
      index = result.description.index('<br />')
      index = index - 1
      image = result.description.from(index+7).to(-1)
      result.description = result.description.to(index)
      result = { rss_url_id: rss_link.id, news_site_id: rss_link.news_site_id,
        category_id: rss_link.category_id,title: result.title, pubDate: result.pubDate,
        link: result.link, description: result.description, image: image,
        highlight: 0}
      @rss_results.push(result)
    end
    return @rss_results
  end

