# frozen_string_literal: true

RSpec.describe Hearing, type: :model do
  let(:hearing) { FactoryBot.create(:hearing) }
  let(:json_schema) { :hearing }

  subject { hearing }

  describe 'associations' do
    it { should belong_to(:court_centre).class_name('CourtCentre') }
    it { should belong_to(:hearing_type).class_name('HearingType') }
    it { should belong_to(:cracked_ineffective_trial).class_name('CrackedIneffectiveTrial').optional }
    it { should have_many(:prosecution_case_hearings).class_name('ProsecutionCaseHearing') }
    it { should have_many(:prosecution_cases).class_name('ProsecutionCase').through(:prosecution_case_hearings) }
    it { should have_many(:court_applications).class_name('CourtApplication') }
    it { should have_many(:referral_reasons).class_name('ReferralReason') }
    it { should have_many(:hearing_case_notes).class_name('HearingCaseNote') }
    it { should have_many(:hearing_days).class_name('HearingDay') }
    it { should have_many(:judicial_roles).class_name('JudicialRole') }
    it { should have_many(:applicant_counsels).class_name('ApplicantCounsel') }
    it { should have_many(:respondent_counsels).class_name('RespondentCounsel') }
    it { should have_many(:prosecution_counsels).class_name('ProsecutionCounsel') }
    it { should have_many(:defence_counsels).class_name('DefenceCounsel') }
    it { should have_many(:court_application_party_counsels).class_name('CourtApplicationPartyCounsel') }
    it { should have_many(:defendant_attendances).class_name('DefendantAttendance') }
    it { should have_many(:defendant_judicial_results).class_name('DefendantJudicialResult') }
    it { should have_many(:interpreter_intermediaries).class_name('InterpreterIntermediary') }
    it { should have_many(:company_representatives).class_name('CompanyRepresentative') }
    it { should have_many(:court_application_party_attendances).class_name('CourtApplicationPartyAttendance') }
    it { should have_many(:defendant_hearing_youth_markers).class_name('DefendantHearingYouthMarker') }
    it { should have_many(:events).class_name('HearingEvent') }
  end
  describe 'validations' do
    it { should validate_presence_of(:jurisdictionType) }
    it { should validate_presence_of(:court_centre) }
    it { should validate_presence_of(:hearing_type) }
    it { should validate_presence_of(:hearing_days) }
    it { should validate_inclusion_of(:jurisdictionType).in_array(%w[MAGISTRATES CROWN]) }
    it { should validate_inclusion_of(:hearingLanguage).in_array(%w[ENGLISH WELSH]) }
  end

  it_has_behaviour 'conforming to valid schema'

  context 'with optional relationships' do
    before do
      hearing.cracked_ineffective_trial = FactoryBot.create(:cracked_ineffective_trial)
      hearing.prosecution_cases << FactoryBot.create(:prosecution_case)
      hearing.court_applications << FactoryBot.create(:court_application)
      hearing.referral_reasons << FactoryBot.create(:referral_reason)
      hearing.hearing_case_notes << FactoryBot.create(:hearing_case_note)
      hearing.judicial_roles << FactoryBot.create(:judicial_role)
      hearing.applicant_counsels << FactoryBot.create(:applicant_counsel)
      hearing.respondent_counsels << FactoryBot.create(:respondent_counsel)
      hearing.prosecution_counsels << FactoryBot.create(:prosecution_counsel)
      hearing.defence_counsels << FactoryBot.create(:defence_counsel)
      hearing.court_application_party_counsels << FactoryBot.create(:court_application_party_counsel)
      hearing.defendant_attendances << FactoryBot.create(:defendant_attendance)
      hearing.defendant_judicial_results << FactoryBot.create(:defendant_judicial_result)
      hearing.interpreter_intermediaries << FactoryBot.create(:interpreter_intermediary)
      hearing.company_representatives << FactoryBot.create(:company_representative)
      hearing.court_application_party_attendances << FactoryBot.create(:court_application_party_attendance)
      hearing.defendant_hearing_youth_markers << FactoryBot.create(:defendant_hearing_youth_marker)
      hearing.save!
    end
    it_has_behaviour 'conforming to valid schema'
  end
end
