class CreateCompanyLengthData < ActiveRecord::Migration[7.0]
  def change
    create_table :company_length_datas do |t|
      t.integer :template_id, index: true, null: false
      t.integer :company_name_length_min, index: true, null: false, default: 0
      t.integer :company_name_length_max, index: true, null: false, default: 0
      t.integer :sales_count, index: true, null: false, default: 0
      t.timestamps
    end
  end
end
