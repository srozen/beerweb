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

require 'rails_helper'

RSpec.describe BeerCategory, type: :model do

  # Entité champs valides
  before(:each) do

    @category = {
                  :name => "Noire",
                  :description => "Les bières noires sont des bières brassées avec une forte proportion de froment malté ou non."
                }
  end

  ### Check du nom

  it "exige de posséder un nom" do
    unnamed = BeerCategory.new(@category.merge(:name => nil))
    expect(unnamed).to_not be_valid
  end

  it "exige un nom plus petit que 40 caractères" do
    overnamed = BeerCategory.new(@category.merge(:name => ("a" * 50)))
    expect(overnamed).to_not be_valid
  end

  it "exige un nom unique non case_sensitive" do
    upcased_name = @category[:name].upcase
    BeerCategory.create!(@category.merge(name: upcased_name))
    category_duplicate_name = BeerCategory.new(@category)
    expect(category_duplicate_name).to_not be_valid
  end

  ### Check de la description

  it "exige de posséder une description" do
    blank_description = BeerCategory.new(@category.merge(:description => nil))
    expect(blank_description).to_not be_valid
  end

  it "rejette une description trop longue" do
    over_description = "aa" * 600
    overdescripted = BeerCategory.new(@category.merge(:description => over_description))
    expect(overdescripted).to_not be_valid
  end

  ### Check de la relation d'association

  it "exige de posséder une ou plusieurs bières" do
    c = BeerCategory.reflect_on_association(:beers).macro
    expect(c) == :has_many
  end
end
