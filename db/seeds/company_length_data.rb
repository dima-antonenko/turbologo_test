require 'csv'

def str_to_range(str)
  return str.split('-').map(&:to_i) if str.include? '-'
  [str.delete('+').to_i, 100] if str.include? '+'
end

CompanyLengthData.destroy_all
file = CSV.foreach(("public/demo/company_length_data.csv"), headers: true, col_sep: ",")

file.each do |row|
  lengths = str_to_range(row['company_name_length'])
  r = CompanyLengthData.new(company_name_length_min: lengths[0],
                            company_name_length_max: lengths[1],
                            template_id: row['template_id'].to_i,
                            sales_count: row['sales_count'])
  r.save(:validate => false)
end

puts "Added company_length_data : #{CompanyLengthData.all.size} \n \n"