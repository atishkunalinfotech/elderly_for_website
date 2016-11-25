class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_friendship
  has_many :groups
  has_many :group_memberships

  has_many :conversations
  has_many :messages
  has_many :elder_gallaries
  has_many :elder_videos
  has_attached_file :photo

                    
  #validates_attachment_size :photo, :less_than => 2.megabytes
  #validates_attachment :photo, :content_type => {:content_type => %w(image/jpeg image/png image/gif image/jpg)}

  has_attached_file :photo, 
                    :styles => { :thumb => "120x120", :medium =>"418x240" }
  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment :photo, :content_type => {:content_type => %w(image/jpeg image/png image/gif image/jpg)}

  def is?( requested_role )
    self.role == requested_role.to_s
  end
end
