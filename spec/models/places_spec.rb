require 'rails_helper'

describe Place do
  let(:paris) { Place.create!(city: 'Paris', country: 'France') }

  it { is_expected.to have_many(:getaways)}

  it { expect(paris).to be_valid }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:country) }
end
