class CreateBonusEnginePoints < ActiveRecord::Migration
  def change
    create_table :bonus_engine_points do |t|
      t.integer :receiver_id
      t.integer :giver_id
      t.integer :event_id
      t.integer :quantity
      t.text :message
    end
  end
end
