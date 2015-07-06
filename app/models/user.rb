class User < ActiveRecord::Base
  belongs_to :group
  has_many  :dones
  validates_uniqueness_of :username
  validates_presence_of :username


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
