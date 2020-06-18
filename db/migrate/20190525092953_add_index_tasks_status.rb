# frozen_string_literal: true

class AddIndexTasksStatus < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, :status
  end
end
