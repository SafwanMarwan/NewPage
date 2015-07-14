class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: 'invalid format' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pages

  enum access_level: [:visitor, :member, :admin]
end
