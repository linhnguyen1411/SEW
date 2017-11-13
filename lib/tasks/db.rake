namespace :db do
  desc "TODO"
  task make_data: [:create_admin, :create_users, :create_news_sites, :create_category_groups,
    :create_rss_urls] do
  end
  task create_admin: :environment do
      Admin.create!(
      name: "Admin",
      email: "sew.info.2017@gmail.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )
  end
  task create_users: :environment do
    User.create!(
      name: "Thanh Nguyễn",
      email: "nguyentrongthanh1111@gmail.com",
      roles: 0,
      password: "Aa@123",
      password_confirmation: "Aa@123",
    )
    User.create!(
      name: "Linh Nguyễn",
      email: "linhnguyencmu@gmail.com",
      roles: 0,
      password: "Aa@123",
      password_confirmation: "Aa@123",
    )
    User.create!(
      name: "Trung Mai",
      email: "maivantrung@gmail.com",
      roles: 1,
      password: "Aa@123",
      password_confirmation: "Aa@123",
    )
  end
  task create_news_sites: :environment do
    NewsSite.create!(
      name: "Vn Express",
      url: "https://vnexpress.net",
      rating: 5
      )
    NewsSite.create!(
      name: "VietNamNet",
      url: "http://vietnamnet.vn",
      rating: 5
      )
    NewsSite.create!(
      name: "Thanh Niên",
      url: "https://thanhnien.vn",
      rating: 5
      )
    NewsSite.create!(
      name: "Bóng Đá",
      url: "http://www.bongda.com.vn",
      rating: 5
      )
  end
  task create_category_groups: :environment do
    CategoryGroup.create!(
      name: "Xã Hội"
      )
    CategoryGroup.create!(
      name: "Thế Giới"
      )
    CategoryGroup.create!(
      name: "Văn Hóa"
      )
    CategoryGroup.create!(
      name: "Kinh Tế"
      )
    CategoryGroup.create!(
      name: "Giáo Dục"
      )
    CategoryGroup.create!(
      name: "Thể thao"
      )
    CategoryGroup.create!(
      name: "Giải trí"
      )
    CategoryGroup.create!(
      name: "Pháp Luật"
      )
    CategoryGroup.create!(
      name: "KH-CN"
      )
    CategoryGroup.create!(
      name: "VLog"
      )
  end
  task create_rss_urls: :environment do
    RssUrl.create!(
      news_site_id: 1,
      category_group_id: 1,
      url: "https://vnexpress.net/rss/thoi-su.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_group_id: 2,
      url: "https://vnexpress.net/rss/the-gioi.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_group_id: 4,
      url: "https://vnexpress.net/rss/kinh-doanh.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_group_id: 5,
      url: "https://vnexpress.net/rss/giao-duc.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_group_id: 6,
      url: "https://vnexpress.net/rss/the-thao.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_group_id: 7,
      url: "https://vnexpress.net/rss/giai-tri.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_group_id: 9,
      url: "https://vnexpress.net/rss/khoa-hoc.rss"
      )
  end
end
