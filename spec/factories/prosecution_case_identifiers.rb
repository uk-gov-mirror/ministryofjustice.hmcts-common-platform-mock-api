# frozen_string_literal: true

FactoryBot.define do
  factory :prosecution_case_identifier do
    caseURN { "INHRBICZKQ" }
    prosecutionAuthorityId { "91c0e6c7-4a4f-415b-a3e1-aea9883f6065" }
    prosecutionAuthorityCode { "S5589083J" }
    factory :prosecution_case_identifier_with_reference do
      caseURN { nil }
      prosecutionAuthorityReference { "S5589083J" }
    end

    factory :realistic_prosecution_case_identifier do
      prosecutionAuthorityId { SecureRandom.uuid }
      prosecutionAuthorityCode { Faker::Alphanumeric.alpha(number: 10).upcase }
      caseURN { Faker::Alphanumeric.alpha(number: 10).upcase }
      prosecutionAuthorityReference { nil }
    end
  end
end
