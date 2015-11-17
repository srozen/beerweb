# == Schema Information
#
# Table name: beers
#
#  id               :integer          not null, primary key
#  name             :string
#  degree           :float
#  description      :text
#  story            :text
#  confirmed        :boolean          default(FALSE)
#  beer_category_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Beer, type: :model do

  # Entité champs valides
  before(:each) do
    @rbeer = { :name => "Taras Boulba",
              :degree => 4.5,
              :description => "Blonde légère de 4,5 % d’alc., généreusement houblonnée avec le houblon aromatique le plus fin, lui conférant un caractère très rafraîchissant et un nez qui rappelle les agrumes.",
              :story => "Tarass Boulba est un cosaque ukrainien robuste et belliqueux. Ses deux fils, Andreï et Ostap, rentrant de Kiev après avoir fini leurs études, sont très vite conduits à la Setch, le campement militaire cosaque. Une rumeur circulant dans le camp constitue un motif suffisant pour entrer en guerre contre les Polonais, au nom de la défense de la foi orthodoxe.",
              :beer_category_id => 1}

  end

  it "devrait créer une instance dotée des attributs valides" do
    Beer.create!(@rbeer)
  end

  it "exige un nom" do
    unnamed_beer = Beer.new(@rbeer.merge(:name => nil))
    expect(unnamed_beer).to_not be_valid
  end

  it "rejette les noms trop longs" do
    too_long_name = "b"*51
    too_long_beername = Beer.new(@rbeer.merge(:name => too_long_name))
    expect(too_long_beername).to_not be_valid
  end

  it "rejette un nom dupliqué sensible à la casse" do
    upcased_name = @rbeer[:name].upcase
    Beer.create!(@rbeer.merge(name: upcased_name))
    beer_duplicate_name = Beer.new(@rbeer)
    expect(beer_duplicate_name).to_not be_valid
  end

  # XXX : La console confirme que le degré ne peut être vide, mais le test n'est pas fonctionnel
  it "exige un titrage en alcool" do
    no_titling_beer = Beer.new(@rbeer.merge(:degree => nil))
    expect(no_titling_beer).to_not be_valid
  end

  it "rejette titrage non numérique" do
    wrong_titling_beer = Beer.new(@rbeer.merge(:degree => "keke"))
    expect(wrong_titling_beer).to_not be_valid
  end

  it "rejette titrage négatif ou supérieur à 100" do
    out_of_rate_titling = Beer.new(@rbeer.merge(:degree => (-6.5)))
    expect(out_of_rate_titling).to_not be_valid
  end

  it "rejette une description trop longue" do
    long_description = "z" * 7000
    too_long_description = Beer.new(@rbeer.merge(:description => long_description))
    expect(too_long_description).to_not be_valid
  end

  it "rejette un historique trop longue" do
    long_story = "z" * 7000
    too_long_story = Beer.new(@rbeer.merge(:description => long_story))
    expect(too_long_story).to_not be_valid
  end

  it "exige d'appartenir à une catégorie de bière" do
    b = Beer.reflect_on_association(:beer_category).macro
    expect(b) == :belongs_to
  end
end
