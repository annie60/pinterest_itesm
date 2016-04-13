class Pin < ActiveRecord::Base
  has_many :placements
  has_many :boards, through: :placements, inverse_of: :pins

  mount_uploader :image, ImageUploader
end
