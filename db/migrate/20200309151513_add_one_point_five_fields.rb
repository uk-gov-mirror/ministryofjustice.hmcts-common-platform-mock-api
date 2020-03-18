class AddOnePointFiveFields < ActiveRecord::Migration[6.0]
  def change
    add_column :court_centres, :ouCode, :string
    add_column :judicial_results, :judicialResultTypeId, :uuid
    add_column :judicial_result_prompts, :judicialResultPromptTypeId, :uuid
  end
end
