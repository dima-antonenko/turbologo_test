require 'csv'

TemplateStat.destroy_all

file = CSV.foreach(("public/demo/template_stats.csv"), headers: true, col_sep: ",")
file.each do |row|
  TemplateStat.create(template_id: row['template_id'],
                      industry_id: row['industry_id'],
                      impressions_count: row['impressions_count'],
                      clicks_count: row['clicks_count'],
                      sales_count: row['sales_count'])
end


puts "Added template_stats: #{TemplateStat.all.size} \n \n"