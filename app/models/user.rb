class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :movies, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  def already_favorited?(movie)
    self.favorites.exists?(movie_id: movie.id)
  end
end
