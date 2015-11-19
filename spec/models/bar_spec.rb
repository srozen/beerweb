# == Schema Information
#
# Table name: bars
#
#  id         :integer          not null, primary key
#  name       :string
#  longitude  :float
#  latitude   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Bar, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
