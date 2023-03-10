class Movie < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :image
   
  with_options presence: true do
    validates :title
    validates :body
  end
  
end
