# == Schema Information
#
# Table name: contact_details
#
#  id         :integer          not null, primary key
#  telephone  :string
#  website    :string
#  street     :string
#  number     :string
#  zipcode    :string
#  city       :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ContactDetail, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
