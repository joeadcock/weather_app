require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to validate_presence_of(:zip) }

  it 'has a default country of US' do
    expect(described_class.new.country).to eq "US"
  end
end
