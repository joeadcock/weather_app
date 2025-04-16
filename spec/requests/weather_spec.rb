require 'rails_helper'

RSpec.describe "Weathers", type: :request do
  describe "GET /show" do
    subject(:resp) do
      get '/'
      response
    end

    it { expect(resp).to have_http_status(:ok) }

    context 'without search params' do
      it 'renders successfully' do
        get '/'

        expect(response).to have_http_status :ok
      end
    end

    context 'with zip and country params' do
      before { WebmockHelper.stub_open_weather_map }

      it 'renders with a forecast' do
        get '/?zip=11222&country=US'

        expect(response).to have_http_status :ok
        expect(response.body).to include "11222 Weather"
      end
    end
  end
end
