class Wishlist < ActiveRecord::Base
  belongs_to :group
  has_many   :course
end
