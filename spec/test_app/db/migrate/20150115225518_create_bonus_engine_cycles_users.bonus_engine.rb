# This migration comes from bonus_engine (originally 20150114195231)
class CreateBonusEngineCyclesUsers < ActiveRecord::Migration
  def change
    create_table :bonus_engine_cycles_users do |t|
      t.integer :cycle_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
