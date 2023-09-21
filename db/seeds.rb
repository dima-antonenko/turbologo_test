Rake::Task["db:seed:templates"].invoke
Rake::Task["db:seed:template_stats"].invoke
Rake::Task["db:seed:industries"].invoke
Rake::Task["db:seed:advanced_data"].invoke
Rake::Task["db:seed:company_length_data"].invoke

puts "Seeds added \n \n"