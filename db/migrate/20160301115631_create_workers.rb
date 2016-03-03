class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
