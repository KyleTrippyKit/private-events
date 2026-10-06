class SetEventsPrivateDefault < ActiveRecord::Migration[8.1]
  def change
    change_column_default :events, :private, from: nil, to: true
    change_column_null :events, :private, false, true
  end
end