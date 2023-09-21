require 'csv'

Industry.destroy_all

file = CSV.foreach(("public/demo/industries.csv"), headers: true, col_sep: ",")
file.each do |row|
  r =  Industry.new( id: row['id'], name: row['name'] )
  r.save
end

puts "Added industries: #{Industry.all.size} \n \n"