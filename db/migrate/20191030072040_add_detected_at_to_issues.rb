class AddDetectedAtToIssues < ActiveRecord::Migration[4.2]
  def change
    add_column :issues, :detected_at, :datetime

    reversible do |direction|
      direction.up { Issue.update_all 'detected_at = created_at' }
    end

    change_column_null :issues, :detected_at, false
  end
end
