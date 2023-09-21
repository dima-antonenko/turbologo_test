class CreateAdvancedData < ActiveRecord::Migration[7.0]
  def change
    create_table :advanced_datas do |t|
      t.integer :industry_id, index: true
      t.boolean :slogan_exists, index: true
      t.boolean :icon_selected, index: true
      t.integer :template_id, index: true
      t.integer :sales_count, default: 0
      t.timestamps
    end
  end
end
