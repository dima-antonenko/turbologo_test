FactoryBot.define do
  factory :advanced_data do
    template
    industry
    slogan_exists { true }
    icon_selected { true }
    sales_count { 1 }
  end
end
