class Snap < ActiveRecord::Base
  validates :image, presence: true
  belongs_to :user
  has_attached_file :image, styles: { :medium => "640px", :small => "320px" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
