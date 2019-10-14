require 'rails_helper'

RSpec.describe PoliceOfficerInCase, type: :model do
  describe 'associations' do
    it { should belong_to(:person).class_name('Person').required }
  end
  describe 'validations' do
    it { should validate_presence_of(:person) }
    it { should validate_presence_of(:policeOfficerRank) }
    it { should validate_presence_of(:policeWorkerReferenceNumber) }
    it { should validate_presence_of(:policeWorkerLocationCode) }
  end

  let(:police_officer_in_case) { FactoryBot.create(:police_officer_in_case) }

  it 'matches the given schema' do
    expect(police_officer_in_case.to_builder.target!).to match_json_schema(:police_officer_in_case)
  end
end