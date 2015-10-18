# == Schema Information
#
# Table name: beer_categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BeerCategory < ActiveRecord::Base
  has_many :beers

  validates :name, presence: true,
                   length: { maximum: 40},
                   uniqueness: { case_sensitive: false }

  validates :description, presence: true,
                          length: { maximum: 500}
end
