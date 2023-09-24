FactoryBot.define do
  factory :company_length_data do
    template
    company_name_length_min { 1 }
    company_name_length_max { 3 }
    sales_count { 1 }
  end
end
