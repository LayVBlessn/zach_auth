class User < ApplicationRecord
  has_secure_password
  validates :login, presence: true
  
  has_many :urls

  def my_urls(user)
    urls.where(user_id: user)
  end

  
end
