# frozen_string_literal: true

RSpec.describe HearingsController, type: :controller do
  let(:hearing) { FactoryBot.create(:hearing) }

  describe 'GET #show' do
    it 'returns unauthorized' do
      get :show, params: { hearingId: hearing.id }
      expect(response).to be_unauthorized
    end

    context 'with the correct auth header' do
      before do
        request.headers['Ocp-Apim-Subscription-Key'] = ENV.fetch('SHARED_SECRET_KEY')
      end

      context 'the hearing exists' do
        it 'returns an empty success response' do
          get :show, params: { hearingId: hearing.id }
          expect(response).to be_successful
          expect(response.body).to eq('{}')
        end
      end

      context 'the hearing does not exist' do
        it 'returns an empty success response' do
          get :show, params: { hearingId: 'c748bfa0-925a-450b-b4d5-a031c0ee3440' }
          expect(response).to be_successful
          expect(response.body).to eq('{}')
        end
      end

      context 'when the hearing has resulted' do
        before { hearing.update!(resulted: true) }

        it 'returns a success response' do
          get :show, params: { hearingId: hearing.id }
          expect(response).to be_successful
          expect(response).not_to be_empty
        end
      end
    end
  end

  describe 'GET #log' do
    let(:hearing_day) { hearing.hearing_days.first }

    before { FactoryBot.create(:hearing_event, hearing_day: hearing_day) }

    it 'returns unauthorized' do
      get :log, params: { hearingId: hearing.id, date: '2019-10-23' }
      expect(response).to be_unauthorized
    end

    context 'with the correct auth header' do
      it 'returns a success response' do
        request.headers['Ocp-Apim-Subscription-Key'] = ENV.fetch('SHARED_SECRET_KEY')
        get :log, params: { hearingId: hearing.id, date: '2019-10-23' }
        expect(response).to be_successful
      end
    end
  end
end
