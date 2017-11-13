require 'rails_admin/config/actions'
  require 'rails_admin/config/actions/base'
  module RailsAdmin
    module Config
      module Actions
        class GetNews < RailsAdmin::Config::Actions::Base
          register_instance_option :news do  #  this is for specific record
            true
          end
          register_instance_option :pjax? do
            false
          end
          register_instance_option :visible? do
            authorized?     # This ensures the action only shows up for the right class
          end
        end
        class LoadNews < GetNews
          RailsAdmin::Config::Actions.register(self)
          register_instance_option :only do
            News
          end
          register_instance_option :link_icon do
            'fa fa-paper-plane' # use any of font-awesome icons
          end
          register_instance_option :http_methods do
            [:get, :post]
          end
          register_instance_option :controller do
            Proc.new do
              binding.pry
              rss_links = RssUrl.all
              rss_links.each do |rss_link|
                @rss_results = []
                rss = RSS::Parser.parse(open(rss_link.url).read, false).items[0..10]
                rss.each do |result|
                  index = result.description.index('</br>')
                  index = index + 4
                  image = result.description.to(index)
                  result.description = result.description.from(index+1).to(-1)
                  result = { category_group_id: rss_link.category_group_id,title: result.title, pubDate: result.pubDate,
                    link: result.link, description: result.description, image: image,
                    site: rss_link.news_site.name, highlight: 0 }
                  @rss_results.push(result)
                end
                @rss_results.each do |rss_result|
                  news = News.create(rss_result)
                end
              end
              flash[:notice] = "Load News successful"
            end
        end
        class Collection < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
          register_instance_option :collection do
            true  # this is for all records in specific model
          end
        end
        class Root < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
          register_instance_option :root do
            true  # this is for all records in all models
          end
        end
      end
    end
  end
end
