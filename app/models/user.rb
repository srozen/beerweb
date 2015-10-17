# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  login      :string
#  password   :string
#  email      :string
#  firstName  :string
#  lastName   :string
#  birthday   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
end
