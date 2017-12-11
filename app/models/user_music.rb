class UserMusic < ApplicationRecord
  belongs_to :user

  scope :get_active,-> {where active: true}
end
