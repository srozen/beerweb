# == Schema Information
#
# Table name: beers
#
#  id          :integer          not null, primary key
#  name        :string
#  degree      :float
#  description :text
#  story       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Beer, type: :model do

  # Entité champs valides
  before(:each) do
    @attr = { :name => "Taras Boulba", :degree => 4.5}
  end

  it "devrait créer une instance dotée des attributs valides" do
    Beer.create!(@attr)
  end

  it "exige un nom" do
    unnamed_beer = Beer.new(@attr.merge(:name => nil))
    expect(unnamed_beer).to_not be_valid
  end

  it "rejette les noms trop longs" do
    too_long_name = "b"*51
    too_long_beername = Beer.new(@attr.merge(:name => too_long_name))
    expect(too_long_beername).to_not be_valid
  end

  it "rejette un nom dupliqué sensible à la casse" do
    upcased_name = @attr[:name].upcase
    Beer.create!(@attr.merge(name: upcased_name))
    beer_duplicate_name = Beer.new(@attr)
    expect(beer_duplicate_name).to_not be_valid
  end

  # XXX : Console prompting that degree can't be blank, test not working
  it "exige un titrage en alcool" do
    no_titling_beer = Beer.new(@attr.merge(:degree => nil))
    expect(no_titling_beer).to_not be_valid
  end

  it "rejette titrage non numérique" do
    wrong_titling_beer = Beer.new(@attr.merge(:degree => "keke"))
    expect(wrong_titling_beer).to_not be_valid
  end

  it "rejette titrage négatif ou supérieur à 100" do
    out_of_rate_titling = Beer.new(@attr.merge(:degree => (-6.5)))
    expect(out_of_rate_titling).to_not be_valid
  end
end
