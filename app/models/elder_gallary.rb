class ElderGallary < ApplicationRecord
  belongs_to :user	
  has_attached_file :photo
                    
  #validates_attachment_size :photo, :less_than => 2.megabytes
  #validates_attachment :photo, :content_type => {:content_type => %w(image/jpeg image/png image/gif image/jpg)}

  has_attached_file :photo, 
                    :styles => { :thumb => "120x120", :medium =>"418x240" }
    validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment :photo, :content_type => {:content_type => %w(image/jpeg image/png image/gif image/jpg)}
  
end
