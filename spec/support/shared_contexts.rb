# frozen_string_literal: true

RSpec.shared_examples 'conforming to valid schema' do
  it 'matches the given schema' do
    schema_contents = File.read(Rails.root.join(RSpec.configuration.json_schemas[json_schema]))
    JSON::Validator.validate!(schema_contents, subject.to_builder.target!, strict: true)
    # expect(subject.to_builder.target!).to match_json_schema(json_schema)
  end
end
