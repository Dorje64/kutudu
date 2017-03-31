class Image < ActiveRecord::Base
  has_attached_file :image
  #validates_attachment :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  validates_attachment :image, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

  validates_presence_of :image_content_type  ,:image_file_name ,:image_file_size
end
