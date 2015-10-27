class Friendlist < ActiveRecord::Base
  belongs_to :user
  has_many :friends
end
