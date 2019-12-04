class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # 下記はここにだけあれば良い
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :users,  dependent: :destroy  usersはおかしい--あっても意味がない
  attachment :profile_image
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: { in: 2..20}
  validates :introduction, length: {maximum: 50}
end
