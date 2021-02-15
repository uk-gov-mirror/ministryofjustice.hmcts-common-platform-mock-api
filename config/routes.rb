# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :prosecution_cases, shallow: true do
      member do
        post "result/:hearing_id(/:publish_to)" => "prosecution_cases#result", as: :result_hearing
      end

      resources :defendants do
        resources :offences
      end

      resources :hearings, except: [:index] do
        member do
          post ":offence_id/add_plea" => "hearings#add_plea", as: :add_plea
          post ":offence_id/add_allocation_decision" => "hearings#add_allocation_decision", as: :add_allocation_decision
        end
      end
    end
  end
  resources :status, only: [:index]

  resources :prosecution_cases, path: "/prosecutionCases", only: [:index]

  post "/prosecutionCases/laaReference" \
    "/cases/:prosecutionCaseId" \
    "/defendant/:defendantId" \
    "/offences/:offenceId" => "laa_references#record_reference", as: :laa_reference
  post "/prosecutionCases/representationOrder" \
    "/cases/:prosecutionCaseId" \
    "/defendants/:defendantId" \
    "/offences/:offenceId" => "laa_references#record_representation_order", as: :representation_order
  get "/hearing/results" => "hearings#show", as: :hearing
  get "/hearing/hearingLog" => "hearings#log", as: :hearing_log
end
