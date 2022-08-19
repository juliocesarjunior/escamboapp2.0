class Admin < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates_presence_of :name

  #Todo usuario cadastrado no sistema role de Administrador
  after_create :assing_default_role

  def assing_default_role
    self.add_role(:NewUser) if self.roles.blank?
  end
end
