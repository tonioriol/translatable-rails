class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :header
      t.jsonb :body
      t.jsonb :footer
      t.timestamps
    end
  end
end
