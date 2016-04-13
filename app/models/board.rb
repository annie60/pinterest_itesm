class Board < ActiveRecord::Base
  attr_accessor :tags_list
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :pins, through: :placements, inverse_of: :boards
  has_many :tags

  validates :name, presence: true

  before_save :sanitize_tags_list!

  private

    def sanitize_tags_list!
      # "comics, anime, fun"
      splitted_tags = tags_list.split(",") # => ["comics", " anime", " fun"]
      splitted_tags.each do |tag_title|
        # Create the tags
        self.tags.build(title: tag_title)
      end
    end
end
