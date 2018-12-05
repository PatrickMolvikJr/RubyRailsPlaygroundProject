class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  paginates_per 5
end
