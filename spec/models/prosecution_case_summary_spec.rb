# frozen_string_literal: true

RSpec.describe ProsecutionCaseSummary, type: :model do
  let(:prosecution_case) { FactoryBot.create(:prosecution_case) }
  let(:prosecution_case_summary) { described_class.new(prosecution_case_id: prosecution_case.id) }

  let(:json_schema) { :prosecution_case_summary }

  subject { prosecution_case_summary }

  it_has_behaviour 'conforming to valid schema'

  fcontext 'search_prosecution_case_response' do
    let(:json_schema) { :search_prosecution_case_response }
    let(:body) { JSON.parse(File.open(Rails.root.join('search.json')).read) }

    it 'matches the given schema' do
      expect(body).to match_json_schema(json_schema)
    end
  end

  fcontext 'results_hearing_resulted_response' do
    let(:json_schema) { :results_hearing_resulted_response }
    let(:body) { JSON.parse(File.open(Rails.root.join('hearing.json')).read) }

    it 'matches the given schema' do
      expect(body).to match_json_schema(json_schema)
    end
  end

  fcontext 'hearing' do
    let(:json_schema) { :hearing }
    let(:body) { JSON.parse(File.open(Rails.root.join('hearing.json')).read) }

    it 'matches the given schema' do
      expect(body).to match_json_schema(json_schema)
    end
  end

  context 'with a hearing relationship' do
    before do
      prosecution_case.hearing = FactoryBot.create(:hearing)
      prosecution_case.save!
    end

    it_has_behaviour 'conforming to valid schema'
  end
end
