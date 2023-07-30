class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
end
