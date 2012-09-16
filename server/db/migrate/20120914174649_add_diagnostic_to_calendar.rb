class AddDiagnosticToCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :diagnostic, :text

  end
end
