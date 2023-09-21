require 'csv'

file = CSV.foreach(("public/demo/company_length_data.csv"), headers: true, col_sep: ",")

file.each do |row|
  r = CompanyLengthData.new(company_name_length: row['company_name_length'],
                            template_id: row['template_id'].to_i,
                            sales_count: row['sales_count'])
  r.save if r.valid?
end

puts "Added company_length_data : #{CompanyLengthData.all.size} \n \n"