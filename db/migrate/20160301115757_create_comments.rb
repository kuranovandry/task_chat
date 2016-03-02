class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :worker, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :position,  default: 0
      t.text :content

      t.timestamps
    end
  end
end
