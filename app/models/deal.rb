
# == Schema Information
#
# Table name: deals
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  start_date  :string
#  end_date    :string
#  reference   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Deal < ActiveRecord::Base

  belongs_to :beer_place, :polymorphic => true
  has_one :beer


  validates :name, presence: true,
                   length: { maximum: 40},
                   uniqueness: { case_sensitive: false }


  validates :description, presence: true,
                          length: { maximum: 500}


  validates :reference, presence: true,
  				   numericality: true

  validates :start_date, presence: true


  validates :end_date, presence: true


end
