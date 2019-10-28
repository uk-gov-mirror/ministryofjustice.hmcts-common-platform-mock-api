# frozen_string_literal: true

FactoryBot.define do
  factory :verdict do
    originatingHearingId { SecureRandom.uuid }
    offenceId { SecureRandom.uuid }
    verdictDate { '2019-10-14 16:18:56' }
    verdict_type
  end
end
