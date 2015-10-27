

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



class Deal < ActiveRecord::Base

 validates :nameShop, presence: true,
                   length: { maximum: 40},
                   uniqueness: { case_sensitive: false }
				   				   	
 validates :titre, presence: true,
                          length: { maximum: 50}
					
 validates :description, presence: true,
                          length: { maximum: 500}
						  
 validates :categorie, presence: true,
                          length: { maximum: 50}						  
 				   				   
 validates :reference, presence: true,
                          length: { maximum: 40}
						  
 validates :datedebut, presence: true,
                          length: { maximum: 50}
						  
 validates :datefin, presence: true,
                          length: { maximum: 50}
						  
 validates :prix, presence: true,
                          length: { maximum: 50}

 validates :reduction, presence: true,
                          length: { maximum: 50}
						  

						  

end
