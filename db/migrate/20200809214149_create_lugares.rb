class CreateLugares < ActiveRecord::Migration[6.0]
  def change
    create_table :lugares do |t|
      t.string :nombre
      t.float :latitud
      t.float :longitud
      t.string :urlmapa

      t.timestamps
    end
  end
end
