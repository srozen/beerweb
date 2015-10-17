# == Schema Information
#
# Table name: beers
#
#  id          :integer          not null, primary key
#  name        :string
#  degree      :float
#  description :text
#  story       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Beer < ActiveRecord::Base

  #===================#
  #=== Validations ===#
  #===================#

  validates :name, presence: true,
                   length: { maximum: 40},
                   uniqueness: { case_sensitive: false }

  validates :degree, presence: true,
                     numericality: true,
                     inclusion: { in: 0.0..100 }

  # TODO : Compléter validations sur autres champs
  validates :description, length: { maximum: 300}

  validates :story, length: { maximum: 400}
end
