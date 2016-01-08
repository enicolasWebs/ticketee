class AddPreviousStateToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :previous_state_id, index: true, foreign_key: true
  end

  add_foreign_key :comments, :states, column: :previous_state_id
end
