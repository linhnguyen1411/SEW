RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  RailsAdmin.config do |config|
    config.authenticate_with do
      warden.authenticate! scope: :admin
    end
    config.current_user_method(&:current_admin)
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['News']
    end
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  RailsAdmin.config do |config|
    config.model 'CategoryGroup' do
      edit do
        field :name
      end
    end

    config.model 'Category' do
      edit do
        field :category_group
        field :name
      end
    end

    config.model 'Admin' do
      edit do
        field :name
        field :email
        field :password
        field :password_confirmation
      end
    end

     config.model 'News' do
      edit do
        field :category
        field :rss_url
        field :news_site_id
        field :title
        field :description
        field :link
        field :highlight
        field :image
      end
      create do
      end
    end
  end
end
