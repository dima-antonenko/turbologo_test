class CreateTemplateNames < ActiveRecord::Migration[7.0]
  def change
    create_table :template_stats do |t|
      t.string  :template_id, index: true
      t.integer :industry_id, index: true
      t.integer :impressions_count, index: true
      t.integer :clicks_count, index: true
      t.integer :sales_count, index: true
      t.timestamps
    end
  end
end
