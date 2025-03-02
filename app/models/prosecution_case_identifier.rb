# frozen_string_literal: true

class ProsecutionCaseIdentifier < ApplicationRecord
  validates :prosecutionAuthorityId, presence: true
  validates :prosecutionAuthorityCode, presence: true
  validates :prosecutionAuthorityReference, presence: true, if: -> { caseURN.blank? }
  validates :caseURN, presence: true, if: -> { prosecutionAuthorityReference.blank? }

  scope :by_reference, lambda { |reference|
    where('LOWER("caseURN") = :reference OR LOWER("prosecution_case_identifiers"."prosecutionAuthorityReference") = :reference',
          reference: reference.downcase)
  }

  def to_builder
    Jbuilder.new do |prosecution_case_identifier|
      prosecution_case_identifier.caseURN caseURN if caseURN.present?
      prosecution_case_identifier.prosecutionAuthorityReference prosecutionAuthorityReference if prosecutionAuthorityReference.present?
      prosecution_case_identifier.prosecutionAuthorityId prosecutionAuthorityId
      prosecution_case_identifier.prosecutionAuthorityCode prosecutionAuthorityCode
    end
  end
end
