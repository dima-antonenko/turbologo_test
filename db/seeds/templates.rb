require 'csv'

Template.destroy_all
file = CSV.foreach(("public/demo/templates.csv"), headers: true, col_sep: ",").to_a

file.each do |row|
  r = Template.new(id: row['id'],
                   preview_image: row['preview_image'],
                   icon_required: row['icon_required'] == 'true',
                   slogan_required: row['slogan_required'] == 'true')
  r.save
end

puts "Added templates: #{Template.all.size} \n \n"