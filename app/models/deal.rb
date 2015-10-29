

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

 validates :name, presence: true,
                   length: { maximum: 40},
                   uniqueness: { case_sensitive: false }
				   				   	
 validates :nameBeer, presence: true,
                          length: { maximum: 50}
					
 validates :description, presence: true,
                          length: { maximum: 500}
						  
 validates :categorie, presence: true,
                          length: { maximum: 20}						  
 				   				   
 validates :reference, presence: true,
					   numericality: true
						  
 validates :datedebut, presence: true,
                          
						  
 validates :datefin, presence: true,
                          
 validates :prix, presence: true,
                  numericality: true
					   
 validates :reduction, presence: true,
					   numericality: true
                          
						  					  
end






