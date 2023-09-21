require 'csv'

AdvancedData.destroy_all

def string_to_bool(str)
  return true if str == 't' || 'true'
  true if str == 'f' || 'false'
end

# with industry
file = CSV.foreach(("public/demo/advanced_data_with_industry.csv"), headers: true, col_sep: ",").to_a
file.each do |row|

  r = AdvancedData.new({ industry_id: row['industry_id'],
                         template_id: row['template_id'],
                         sales_count: row['sales_count'] })

  r.slogan_exists = string_to_bool(row['slogan_exists'])
  r.icon_selected = string_to_bool(row['icon_selected'])


  r.save if r.valid?
end

puts "Added advanced_data with industry: #{AdvancedData.all.size} \n \n"

# no industry
file = CSV.foreach(("public/demo/advanced_data_no_industry.csv"), headers: true, col_sep: ",")
file.each do |row|

  r = AdvancedData.new({ template_id: row['template_id'],
                         sales_count: row['sales_count'] })

  r.slogan_exists = true if row['slogan_exists'] == 't'
  r.slogan_exists = false if row['slogan_exists'] == 'f'

  r.icon_selected = true if row['icon_selected'] == 't'
  r.icon_selected = false if row['icon_selected'] == 'f'

  r.save if r.valid?
end

puts "Added advanced_data without industry: #{AdvancedData.all.size} \n \n"