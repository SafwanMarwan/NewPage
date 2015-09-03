class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  before_create :setup_default_role_for_new_users
  
  # validates :name, presence: true
  # validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: 'invalid format' } :ereoeiroersoo "adskjghjsdh"

  has_many :pages


  ROLES = %w[admin general]

  private
  def setup_default_role_for_new_users
    self.role ||= "general"
  end
end
