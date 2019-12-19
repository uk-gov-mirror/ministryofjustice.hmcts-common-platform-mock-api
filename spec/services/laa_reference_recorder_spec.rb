# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe LaaReferenceRecorder do
  let(:params) { ActionController::Parameters.new(params_hash) }
  let(:defendant) { FactoryBot.create(:defendant) }
  let(:offence) { defendant.offences.first }
  let(:status_code) { 'STATUS CODE 999' }
  let(:application_reference) { 'APPLICATION REFERENCE 998' }
  let(:status_date) { '2019-12-12' }
  let(:laa_reference) { FactoryBot.create(:laa_reference, offence: offence) }

  subject { described_class.call(params) }

  context 'with invalid params' do
    let(:params_hash) do
      { random: 'value' }
    end

    it 'raises an invalid params error' do
      expect do
        subject
      end.to raise_error(Errors::InvalidParams)
    end
  end

  context 'with valid params' do
    let(:params_hash) do
      {
        id: laa_reference_id,
        prosecutionCaseId: defendant.prosecution_case.id,
        defendantId: defendant.id,
        offenceId: offence.id,
        statusCode: status_code,
        applicationReference: application_reference,
        statusDate: status_date
      }
    end

    context 'when an LaaReference does not exist' do
      let(:laa_reference_id) { SecureRandom.uuid }

      it 'creates the LaaReference' do
        expect { subject }.to change(LaaReference, :count).by(1)
      end
    end

    context 'when the LaaReference exists' do
      let(:laa_reference_id) { laa_reference.id }

      before do
        laa_reference.save!
      end

      it 'does not create a new LaaReference' do
        expect { subject }.to change(LaaReference, :count).by(0)
      end

      it 'updates the LaaReference' do
        subject
        laa_reference.reload
        expect(laa_reference.applicationReference).to eq(application_reference)
        expect(laa_reference.statusCode).to eq(status_code)
        expect(laa_reference.statusDate).to eq(status_date)
        expect(laa_reference.statusId).to eq(laa_reference_id)
        expect(laa_reference.statusDescription).to eq('FAKE NEWS')
      end

      it { is_expected.to eq laa_reference }
    end
  end
end
# rubocop:enable Metrics/BlockLength