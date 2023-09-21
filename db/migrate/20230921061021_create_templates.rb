class CreateTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :templates do |t|
      t.string :preview_image, index: true
      t.boolean :icon_required, index: true, null: false,   default: false
      t.boolean :slogan_required, index: true, null: false, default: false
      t.timestamps
    end
  end
end
