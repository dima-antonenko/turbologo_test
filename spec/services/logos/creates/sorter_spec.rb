require 'rails_helper'
RSpec.describe Logos::Creates::Sorter, type: :service do

  let!(:ind) { create(:industry) }

  let!(:template_sales_5_clicks_5_sales) { create(:template, preview_image: '5_5') }
  let!(:template_stat_5_clicks_5_sales) { create(:template_stat,
                                                 industry_id: ind.id,
                                                 template_id: template_sales_5_clicks_5_sales.id,
                                                 clicks_count: 5,
                                                 sales_count: 5) }

  let!(:template_4_sales_20_clicks) { create(:template, preview_image: '20_4') }
  let!(:template_stat_20_clicks_4_sales) { create(:template_stat,
                                                  industry_id: ind.id,
                                                  template_id: template_4_sales_20_clicks.id,
                                                  clicks_count: 20,
                                                  sales_count: 4) }

  let!(:template_sales_10_clicks_4_sales) { create(:template, preview_image: '10_4') }
  let!(:template_stat_10_clicks_4_sales) { create(:template_stat,
                                                  industry_id: ind.id,
                                                  template_id: template_sales_10_clicks_4_sales.id,
                                                  clicks_count: 10,
                                                  sales_count: 4) }

  let!(:template_sales_1_click_1_sales) { create(:template, preview_image: '1_1') }
  let!(:template_stat_1_click_1_sales) { create(:template_stat,
                                                 industry_id: ind.id,
                                                 template_id: template_sales_1_click_1_sales.id,
                                                 clicks_count: 1,
                                                 sales_count: 1) }

  context 'Sort by sales_count' do
    it 'result must be relevant' do
      res = Logos::Creates::Sorter.new(Template.all).call
      res_keys =  res.pluck(:id)

      expect(res_keys[0]).to eq(template_sales_5_clicks_5_sales.id)
      expect(res_keys[1]).to eq(template_4_sales_20_clicks.id)
      expect(res_keys[2]).to eq(template_sales_10_clicks_4_sales.id)
      expect(res_keys[3]).to eq(template_sales_1_click_1_sales.id)
    end
  end
end