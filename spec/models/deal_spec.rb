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

require 'rails_helper'

RSpec.describe Deal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
