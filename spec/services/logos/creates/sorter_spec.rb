require 'rails_helper'
RSpec.describe Logos::Creates::Sorter, type: :service do
  let!(:template_sales_5_clicks_5) { create(:template) }
  let!(:template_sales_4_clicks_20) { create(:template) }
  let!(:template_sales_4_clicks_10) { create(:template) }
  let!(:template_sales_1_clicks_1) { create(:template) }
end