class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :tipo
      t.string :materiale
      t.decimal :diametro
      t.decimal :lunghezza
      t.decimal :larghezza
      t.decimal :spessore
      t.string :descrizione
      t.integer :stato
      t.string :desc_stato
      t.string :created_by_user
      t.datetime :created_by_time
      t.string :deleted_by_user
      t.datetime :deleted_by_time
      t.string :img_path
      t.string :from_commessa
      t.string :from_disegno

      t.timestamps
    end
  end
end
