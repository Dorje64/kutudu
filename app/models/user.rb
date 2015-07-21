class User < ActiveRecord::Base

  #include Mongoid::Document
  belongs_to :group
  has_many  :dones
  validates_uniqueness_of :username
  validates_presence_of :username

  #
  # field :reset_password_token, type: String
  # field :reset_password_sent_at, type: String

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
