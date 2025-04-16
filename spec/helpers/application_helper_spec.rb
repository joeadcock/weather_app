require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'temp_units' do
    subject(:temp_units) { helper.temp_units(temperature, units) }
    let(:temperature) { 10.4 }

    context 'with imperial units' do
      let(:units) { "imperial" }

      it { is_expected.to eq "10℉" }
    end

    context "with metric units" do
      let(:units) { "metric" }

      it { is_expected.to eq "10℃" }
    end
  end
end
