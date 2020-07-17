# frozen_string_literal: true

# set up schema matchers

RSpec.configure do |config|
  config.include JSON::SchemaMatchers

  schema_path = 'lib/schemas/'

  # Models
  config.json_schemas[:address] = "#{schema_path}/global/apiAddress.json"
  config.json_schemas[:allocation_decision] = "#{schema_path}/global/apiAllocationDecision.json"
  config.json_schemas[:applicant_counsel] = "#{schema_path}/global/apiApplicantCounsel.json"
  config.json_schemas[:associated_defence_organisation] = "#{schema_path}/global/apiAssociatedDefenceOrganisation.json"
  config.json_schemas[:associated_person] = "#{schema_path}/global/apiAssociatedPerson.json"
  config.json_schemas[:attendance_day] = "#{schema_path}/global/apiAttendanceDay.json"
  config.json_schemas[:attendant] = "#{schema_path}/global/apiAttendant.json"
  config.json_schemas[:bail_status] = "#{schema_path}/global/apiBailStatus.json"
  config.json_schemas[:company_representative] = "#{schema_path}/global/apiCompanyRepresentative.json"
  config.json_schemas[:contact_number] = "#{schema_path}/global/apiContactNumber.json"
  config.json_schemas[:court_application] = "#{schema_path}/global/apiCourtApplication.json"
  config.json_schemas[:court_application_outcome] = "#{schema_path}/global/apiCourtApplicationOutcome.json"
  config.json_schemas[:court_application_outcome_type] = "#{schema_path}/global/apiCourtApplicationOutcomeType.json"
  config.json_schemas[:court_application_party] = "#{schema_path}/global/apiCourtApplicationParty.json"
  config.json_schemas[:court_application_party_counsel] = "#{schema_path}/global/apiCourtApplicationPartyCounsel.json"
  config.json_schemas[:court_application_party_attendance] = "#{schema_path}/global/apiCourtApplicationPartyAttendance.json"
  config.json_schemas[:court_application_payment] = "#{schema_path}/global/apiCourtApplicationPayment.json"
  config.json_schemas[:court_application_respondent] = "#{schema_path}/global/apiCourtApplicationRespondent.json"
  config.json_schemas[:court_application_response] = "#{schema_path}/global/apiCourtApplicationResponse.json"
  config.json_schemas[:court_application_response_type] = "#{schema_path}/global/apiCourtApplicationResponseType.json"
  config.json_schemas[:court_application_type] = "#{schema_path}/global/apiCourtApplicationType.json"
  config.json_schemas[:court_centre] = "#{schema_path}/global/apiCourtCentre.json"
  config.json_schemas[:court_indicated_sentence] = "#{schema_path}/global/apiCourtIndicatedSentence.json"
  config.json_schemas[:cracked_ineffective_trial] = "#{schema_path}/global/apiCrackedIneffectiveTrial.json"
  config.json_schemas[:custody_time_limit] = "#{schema_path}/global/apiCustodyTimeLimit.json"
  config.json_schemas[:defence_counsel] = "#{schema_path}/global/apiDefenceCounsel.json"
  config.json_schemas[:defence_organisation] = "#{schema_path}/global/apiDefenceOrganisation.json"
  config.json_schemas[:defendant] = "#{schema_path}/global/apiDefendant.json"
  config.json_schemas[:defendant_alias] = "#{schema_path}/global/apiDefendantAlias.json"
  config.json_schemas[:defendant_attendance] = "#{schema_path}/global/apiDefendantAttendance.json"
  config.json_schemas[:defendant_hearing_youth_marker] = "#{schema_path}/global/apiDefendantHearingYouthMarker.json"
  config.json_schemas[:defendant_judicial_result] = "#{schema_path}/global/apiDefendantJudicialResult.json"
  config.json_schemas[:delegated_powers] = "#{schema_path}/global/apiDelegatedPowers.json"
  config.json_schemas[:ethnicity] = "#{schema_path}/global/apiEthnicity.json"
  config.json_schemas[:hearing] = "#{schema_path}/global/apiHearing.json"
  config.json_schemas[:hearing_case_note] = "#{schema_path}/global/apiHearingCaseNote.json"
  config.json_schemas[:hearing_day] = "#{schema_path}/global/apiHearingDay.json"
  config.json_schemas[:hearing_event] = "#{schema_path}/global/apiHearingEvent.json"
  config.json_schemas[:hearing_type] = "#{schema_path}/global/apiHearingType.json"
  config.json_schemas[:indicated_plea] = "#{schema_path}/global/apiIndicatedPlea.json"
  config.json_schemas[:interpreter_intermediary] = "#{schema_path}/global/apiInterpreterIntermediary.json"
  config.json_schemas[:judicial_result] = "#{schema_path}/global/apiJudicialResult.json"
  config.json_schemas[:judicial_result_prompt] = "#{schema_path}/global/apiJudicialResultPrompt.json"
  config.json_schemas[:judicial_result_prompt_duration_element] = "#{schema_path}/global/apiJudicialResultPromptDurationElement.json"
  config.json_schemas[:judicial_role] = "#{schema_path}/global/apiJudicialRole.json"
  config.json_schemas[:judicial_role_type] = "#{schema_path}/global/apiJudicialRoleType.json"
  config.json_schemas[:jurors] = "#{schema_path}/global/apiJurors.json"
  config.json_schemas[:laa_reference] = "#{schema_path}/global/apiLaaReference.json"
  config.json_schemas[:legal_entity_defendant] = "#{schema_path}/global/apiLegalEntityDefendant.json"
  config.json_schemas[:lesser_or_alternative_offence] = "#{schema_path}/global/apiLesserOrAlternativeOffence.json"
  config.json_schemas[:linked_defendant] = "#{schema_path}/global/apiLinkedDefendant.json"
  config.json_schemas[:marker] = "#{schema_path}/global/apiMarker.json"
  config.json_schemas[:merged_prosecution_case] = "#{schema_path}/global/apiMergedProsecutionCase.json"
  config.json_schemas[:merged_prosecution_case_target] = "#{schema_path}/global/apiMergedProsecutionCaseTarget.json"
  config.json_schemas[:next_hearing] = "#{schema_path}/global/apiNextHearing.json"
  config.json_schemas[:next_hearing_defendant] = "#{schema_path}/global/apiNextHearingDefendant.json"
  config.json_schemas[:next_hearing_offence] = "#{schema_path}/global/apiNextHearingOffence.json"
  config.json_schemas[:next_hearing_prosecution_case] = "#{schema_path}/global/apiNextHearingProsecutionCase.json"
  config.json_schemas[:notified_plea] = "#{schema_path}/global/apiNotifiedPlea.json"
  config.json_schemas[:offence] = "#{schema_path}/global/apiOffence.json"
  config.json_schemas[:offence_facts] = "#{schema_path}/global/apiOffenceFacts.json"
  config.json_schemas[:organisation] = "#{schema_path}/global/apiOrganisation.json"
  config.json_schemas[:person] = "#{schema_path}/global/apiPerson.json"
  config.json_schemas[:person_defendant] = "#{schema_path}/global/apiPersonDefendant.json"
  config.json_schemas[:plea] = "#{schema_path}/global/apiPlea.json"
  config.json_schemas[:police_officer_in_case] = "#{schema_path}/global/apiPoliceOfficerInCase.json"
  config.json_schemas[:prosecuting_authority] = "#{schema_path}/global/apiProsecutingAuthority.json"
  config.json_schemas[:prosecution_case] = "#{schema_path}/global/apiProsecutionCase.json"
  config.json_schemas[:prosecution_case_identifier] = "#{schema_path}/global/apiProsecutionCaseIdentifier.json"
  config.json_schemas[:prosecution_counsel] = "#{schema_path}/global/apiProsecutionCounsel.json"
  config.json_schemas[:referral_reason] = "#{schema_path}/global/apiReferralReason.json"
  config.json_schemas[:respondent_counsel] = "#{schema_path}/global/apiRespondentCounsel.json"
  config.json_schemas[:verdict] = "#{schema_path}/global/apiVerdict.json"
  config.json_schemas[:verdict_type] = "#{schema_path}/global/apiVerdictType.json"

  # Search
  config.json_schemas[:defendant_name] = "#{schema_path}/global/search/apiDefendantName.json"
  config.json_schemas[:defendant_summary] = "#{schema_path}/global/search/apiDefendantSummary.json"
  config.json_schemas[:hearing_summary] = "#{schema_path}/global/search/apiHearingSummary.json"
  config.json_schemas[:offence_summary] = "#{schema_path}/global/search/apiOffenceSummary.json"
  config.json_schemas[:prosecution_case_summary] = "#{schema_path}/global/search/apiProsecutionCaseSummary.json"

  # Responses
  config.json_schemas[:search_prosecution_case_response] = "#{schema_path}/api/search-prosecutionCaseResponse.json"
  config.json_schemas[:results_hearing_event_log_response] = "#{schema_path}/api/hearing.api.hearingEventLogResponse.json"
  config.json_schemas[:results_hearing_resulted_response] = "#{schema_path}/api/results.api.hearingResultedResponse.json"
end
