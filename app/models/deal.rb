

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
				   				   	
					
 validates :description, presence: true,
                          length: { maximum: 500}
						  						  
 				   				   
 validates :reference, presence: true,
					   numericality: true
						  
 validates :start_date, presence: true
                          
						  
 validates :end_date, presence: true
                                                   
						  					  
end






