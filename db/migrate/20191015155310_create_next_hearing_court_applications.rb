class CreateNextHearingCourtApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :next_hearing_court_applications, id: :uuid do |t|

      t.timestamps
    end
  end
end
