class Image < ActiveRecord::Base
  belongs_to :item
  has_attached_file :picture, :styles => { :large => "x400", :medium => "x300", :thumb => "x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
