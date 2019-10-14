require 'rails_helper'

RSpec.describe AllocationDecision, type: :model do
    it { should validate_presence_of(:originatingHearingId) }
    it { should validate_presence_of(:offenceId) }
    it { should validate_presence_of(:motReasonId) }
    it { should validate_presence_of(:motReasonDescription) }
    it { should validate_presence_of(:motReasonCode) }
    it { should validate_presence_of(:allocationDecisionDate) }
    it { should validate_inclusion_of(:isSection22ALowValueShoplifting).in_array([true, false]) }
    it { should validate_inclusion_of(:isDamageValueUnder5000).in_array([true, false]) }
    it { should validate_inclusion_of(:isTreatedAsIndictableOnly).in_array([true, false]) }
    it { should validate_inclusion_of(:sentencingIndicationRequested).in_array([true, false]) }

    let(:allocation_decision) { FactoryBot.create(:allocation_decision) }

    it 'matches the given schema' do
      expect(allocation_decision.to_builder.target!).to match_json_schema(:allocation_decision)
    end
end
