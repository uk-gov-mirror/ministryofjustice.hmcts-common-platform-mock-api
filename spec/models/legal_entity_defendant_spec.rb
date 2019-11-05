# frozen_string_literal: true

RSpec.describe LegalEntityDefendant, type: :model do
  let(:legal_entity_defendant) { FactoryBot.create(:legal_entity_defendant) }

  let(:json_schema) { :legal_entity_defendant }

  subject { legal_entity_defendant }

  describe 'associations' do
    it { should belong_to(:organisation).class_name('Organisation') }
  end
  describe 'validations' do
    it { should validate_presence_of(:organisation) }
  end

  it_has_a 'realistic factory'

  context 'hmcts schema' do
    it_has_behaviour 'conforming to valid schema'
  end
end
