class CreateClocks < ActiveRecord::Migration[5.2]
  def change
    create_table :clocks do |t|
      t.datetime :clock_in
      t.datetime :clock_out
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
