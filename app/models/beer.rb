# == Schema Information
#
# Table name: beers
#
#  id               :integer          not null, primary key
#  name             :string
#  degree           :float
#  description      :text
#  story            :text
#  confirmed        :boolean          default(FALSE)
#  beer_category_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Beer < ActiveRecord::Base

  belongs_to :beer_category
  has_many :reviews

  #===================#
  #=== Validations ===#
  #===================#

  validates :name, presence: true,
                   length: { maximum: 40 },
                   uniqueness: { case_sensitive: false }

  validates :degree, presence: true,
                     numericality: true,
                     inclusion: { in: 0.0..100 }

  # TODO : Compléter validations sur autres champs
  validates :description, length: { maximum: 2000 }

  validates :story, length: { maximum: 2000 }



  ## Recherche des bières sur base du nom
  # => XXX La méthode devra peut-être être renomée si complexification
  #
  def self.search(name)
    if name
      self.where('name LIKE ?', "%#{name}%")
    else
      self.all
    end
  end


end
