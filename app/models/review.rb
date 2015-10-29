# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  note          :float
#  comment       :text
#  collection_id :integer
#  beer_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

# TODO : Assurer les tests et les validations
# Une review est une entrée de la collection d'un utilisateur et porte sur une bière.
class Review < ActiveRecord::Base
  belongs_to :collection
  belongs_to :beer

  validates :note, presence: true,
                   numericality: true,
                   inclusion: { in: 0.0..10.0 }

  validates :comment, presence: true,
                      length: { maximum: 400 }
end
