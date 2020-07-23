# frozen_string_literal: true

class ProsecutionCaseIdentifier < ApplicationRecord
  include PgSearch::Model

  validates :prosecutionAuthorityId, presence: true
  validates :prosecutionAuthorityCode, presence: true
  validates :prosecutionAuthorityReference, presence: true, if: -> { caseURN.blank? }
  validates :caseURN, presence: true, if: -> { prosecutionAuthorityReference.blank? }

  pg_search_scope :by_reference, against: %i[caseURN prosecutionAuthorityReference], using: { tsearch: { any_word: true } }

  def to_builder
    Jbuilder.new do |prosecution_case_identifier|
      prosecution_case_identifier.caseURN caseURN if caseURN.present?
      prosecution_case_identifier.prosecutionAuthorityReference prosecutionAuthorityReference if prosecutionAuthorityReference.present?
      prosecution_case_identifier.prosecutionAuthorityId prosecutionAuthorityId
      prosecution_case_identifier.prosecutionAuthorityCode prosecutionAuthorityCode
    end
  end
end
