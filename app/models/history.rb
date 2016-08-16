class History < ActiveRecord::Base
  has_many   :course
  belongs_to :user
end
