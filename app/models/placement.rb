class Placement < ActiveRecord::Base
  belongs_to :board, inverse_of: :placements
  belongs_to :pin, inverse_of: :placements
end
