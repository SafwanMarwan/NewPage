class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :setup_default_role_for_new_users
  
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: 'invalid format' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pages
  has_one :role

  ROLES = %w[admin general]

  private
  def setup_default_role_for_new_users
    if self.role.blank?
      self.role = "general"
    end
  end
end
