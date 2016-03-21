class Picture < ActiveRecord::Base
	has_attached_file :image, styles: { large: "1000x1000#", medium: "600x600#", thumb: "200x200#" }, default_url: ""

	
	do_not_validate_attachment_file_type :image

	belongs_to :gallery
end
