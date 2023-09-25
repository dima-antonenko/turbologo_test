FactoryBot.define do
  factory :template_stat do
    template
    industry
    impressions_count { 1 }
    clicks_count { 1 }
    sales_count { 1 }
  end
end
