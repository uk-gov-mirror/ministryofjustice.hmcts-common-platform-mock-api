# frozen_string_literal: true

require "faker/cracked_ineffective_trial"

FactoryBot.define do
  factory :cracked_ineffective_trial do
    code { "String" }
    description { "String" }
    reason_type { "String" }

    factory :realistic_cracked_ineffective_trial do
      transient do
        cit_struct { Faker::CrackedIneffectiveTrial.any }
      end

      code { cit_struct.code }
      description { cit_struct.description }
      reason_type { cit_struct.reason_type }
    end
  end
end
