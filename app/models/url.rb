class Url < ApplicationRecord
  validates :long_url, presence: true

  belongs_to :user

end
