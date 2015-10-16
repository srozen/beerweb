# == Schema Information
#
# Table name: beers
#
#  id          :integer          not null, primary key
#  name        :string
#  degree      :integer
#  description :text
#  story       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Beer, type: :model do

  before(:each) do
    @attr = { :name => "Taras Boulba", :degree => 4.5}
  end

  it "devrait créer une instance dotée des attributs valides" do
    Beer.create!(@attr)
  end

  it "exige un nom" do
    unnamed_beer = Beer.new(@attr.merge(:name => ""))
    expect(unnamed_beer).to_not be_valid
  end

  it "rejette les noms trop longs" do
    too_long_name = "b"*51
    too_long_beername = Beer.new(@attr.merge(:name => too_long_name))
    expect(too_long_beername).to_not be_valid
  end

  it "exige un titrage en alcool" do
    no_titling_beer = Beer.new(@attr.merge(:degree => nil))
    expect(no_titling_beer).to_not be_valid
  end
end
