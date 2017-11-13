namespace :db do
  desc "TODO"
  task make_data: [:create_admin, :create_users, :create_news_sites, :create_category_groups,
    :create_categories, :create_rss_urls] do
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
      name: "Thành Nguyễn",
      email: "nguyentrongthanh1111@gmail.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
    )
    User.create!(
      name: "Linh Nguyễn",
      email: "linhnguyencmu@gmail.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
    )
    User.create!(
      name: "Trung Mai",
      email: "maivantrung@gmail.com",
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
      name: "Thời Sự"
      )
    CategoryGroup.create!(
      name: "Kinh Tế"
      )
    CategoryGroup.create!(
      name: "Giáo Dục"
      )
    CategoryGroup.create!(
      name: "KH & CN"
      )
    CategoryGroup.create!(
      name: "Thể Thao"
      )
    CategoryGroup.create!(
      name: "Giải Trí"
      )
    CategoryGroup.create!(
      name: "Đời Sống"
      )
    CategoryGroup.create!(
      name: "BLog"
      )
  end

  task create_categories: :environment do
    Category.create!(
      category_group_id: 1,
      name: "Tin nóng"
      )
    Category.create!(
      category_group_id: 1,
      name: "Tin trong nước"
      )
    Category.create!(
      category_group_id: 1,
      name: "Tin quốc tế"
      )
    Category.create!(
      category_group_id: 1,
      name: "Pháp luật"
      )
    Category.create!(
      category_group_id: 2,
      name: "Tài chính kinh doanh"
      )
    Category.create!(
      category_group_id: 2,
      name: "Chứng khoán"
      )
    Category.create!(
      category_group_id: 2,
      name: "Bất động sản"
      )
    Category.create!(
      category_group_id: 3,
      name: "Giáo dục"
      )
    Category.create!(
      category_group_id: 3,
      name: "Giáo dục ĐH"
      )
    Category.create!(
      category_group_id: 3,
      name: "Giáo dục THPT"
      )
    Category.create!(
      category_group_id: 4,
      name: "CNTT - Viễn thông"
      )
    Category.create!(
      category_group_id: 4,
      name: "Khoa học"
      )
    Category.create!(
      category_group_id: 4,
      name: "CNTT - Viễn thông"
      )
    Category.create!(
      category_group_id: 5,
      name: "Thể thao"
      )
    Category.create!(
      category_group_id: 5,
      name: "Bóng đá"
      )
    Category.create!(
      category_group_id: 5,
      name: "ESport"
      )
    Category.create!(
      category_group_id: 6,
      name: "Giải trí"
      )
    Category.create!(
      category_group_id: 6,
      name: "Âm nhạc"
      )
    Category.create!(
      category_group_id: 6,
      name: "Thời trang"
      )
    Category.create!(
      category_group_id: 6,
      name: "Điện ảnh"
      )
    Category.create!(
      category_group_id: 7,
      name: "Gia đình"
      )
    Category.create!(
      category_group_id: 7,
      name: "Sức khỏe"
      )
    Category.create!(
      category_group_id: 7,
      name: "Ẩm thực"
      )
    Category.create!(
      category_group_id: 7,
      name: "Du lịch"
      )
    Category.create!(
      category_group_id: 8,
      name: "Tâm sự"
      )
    Category.create!(
      category_group_id: 8,
      name: "Thủ thuật - mẹo vặt"
      )
  end

  task create_rss_urls: :environment do
    RssUrl.create!(
      news_site_id: 1,
      category_id: 1,
      url: "https://vnexpress.net/rss/thoi-su.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_id: 3,
      url: "https://vnexpress.net/rss/the-gioi.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_id: 5,
      url: "https://vnexpress.net/rss/kinh-doanh.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_id: 8,
      url: "https://vnexpress.net/rss/giao-duc.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_id: 14,
      url: "https://vnexpress.net/rss/the-thao.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_id: 17,
      url: "https://vnexpress.net/rss/giai-tri.rss"
      )
    RssUrl.create!(
      news_site_id: 1,
      category_id: 12,
      url: "https://vnexpress.net/rss/khoa-hoc.rss"
      )
  end
end
