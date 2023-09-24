FactoryBot.define do
  factory :template_name do
    template
    industry
    impression_count { 1 }
    clicks_count { 1 }
    sales_count { 1 }
  end
end
