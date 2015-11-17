# == Schema Information
#
# Table name: contact_details
#
#  id              :integer          not null, primary key
#  telephone       :string
#  website         :string
#  street          :string
#  number          :string
#  zipcode         :string
#  city            :string
#  country         :string
#  beer_place_id   :integer
#  beer_place_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ContactDetail < ActiveRecord::Base
  belongs_to :beer_place, :polymorphic => true
end
