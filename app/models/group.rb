class group < ActiveRecord::Base
  has_many   :wishlist
  belongs_to :user
end
