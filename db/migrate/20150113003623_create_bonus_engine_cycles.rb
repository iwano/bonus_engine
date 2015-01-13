class CreateBonusEngineCycles < ActiveRecord::Migration
  def change
    create_table :bonus_engine_cycles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
