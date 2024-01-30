class CreateOpportunities < ActiveRecord::Migration[7.0]
  def change
    create_table :opportunities do |t|
      t.string :procedure_name
      t.references :patient, null: false, foreign_key: { to_table: :members }
      t.references :doctor, null: false, foreign_key: { to_table: :members }
      t.jsonb :stage_history

      t.timestamps
    end
  end
end
