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

require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @attr  = { :login => "zyvaah", :email => "zyva@hogmail.com"}
  end

  it "devrait créer une instance possédant des attributs valides" do
    User.create!(@attr)
  end

  it "devrait exiger un nom" do
    john_snow = User.new(@attr.merge(:login => nil))
    expect(john_snow).to_not be_valid
  end

  it "devrait rejetter les noms trop courts" do
    too_short_login = "z" * 5
    too_short_login_user = User.new(@attr.merge(:login => too_short_login))
    expect(too_short_login_user).to_not be_valid
  end

  it "devrait rejetter les noms trop longs" do
    too_long_login = "z" * 26
    too_long_login_user = User.new(@attr.merge(:login => too_long_login))
    expect(too_long_login_user).to_not be_valid
  end
end
