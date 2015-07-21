class Post < ActiveRecord::Base


  paginates_per 7
  before_destroy :no_referenced_done
  has_many :comments
  has_many :dones
  # attr_accessor :title, :no, :course, :deadline, :details, :user_id , :group_id
  #  validates_presence_of :title, :no, :course, :deadline

  validates_presence_of :course
  validates_presence_of :no
  validates_presence_of :title
  def no_referenced_done
    return if dones.empty?

   # errors.add_to_root("This post is referenced by order(s): #{dones.map(&:id).to_sentence}")
    false # If you return anything else, the callback will not stop the destroy from happening
  end

end
