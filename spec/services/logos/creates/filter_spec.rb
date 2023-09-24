require 'rails_helper'
RSpec.describe Logos::Creates::Filter, type: :service do

  describe 'filter by company name' do
    let!(:short_company_name_template) { create(:template) }
    let!(:company_length_data) { create(:company_length_data,
                                        template_id: short_company_name_template.id,
                                        company_name_length_min: 5,
                                        company_name_length_max: 7) }

    let!(:long_company_name_template) { create(:template) }
    let!(:company_length_data) { create(:company_length_data,
                                        template_id: short_company_name_template.id,
                                        company_name_length_min: 10,
                                        company_name_length_max: 12) }

    it 'short company must be result in filer by short companies' do
      res =  Logos::Creates::Filter.new(Template.all, '123456', nil, nil, []).call

      expect(res.size).to eq(1)
      expect(res.firt.id).to eq(short_company_name_template.id)
    end

    it 'long company must be result in filter by long companies' do
      res =  Logos::Creates::Filter.new(Template.all, '12345678901', nil, nil, []).call

      expect(res.size).to eq(1)
      expect(res.firt.id).to eq(long_company_name_template.id)
    end
  end

  describe 'filter by slogan' do
    let!(:template_with_slogan) { create(:template, slogan_required: true) }
    let!(:template_without_slogan) { create(:template, slogan_required: false) }


    it 'Template with slogan required must be return' do
      res =  Logos::Creates::Filter.new(Template.all, '123', nil, 'slogan', []).call

      expect(res.size).to eq(1)
      expect(res.first.id).to eq(template_with_slogan.id)
    end

    it 'All templates must be return' do
      res =  Logos::Creates::Filter.new(Template.all, '123', nil, nil, []).call

      expect(res.size).to eq(2)
    end
  end


  describe 'filter by icon' do
    let!(:template_with_icon) { create(:template, icon_required: true) }
    let!(:template_without_icon) { create(:template, icon_required: false) }


    it 'Template with icon required must be return' do
      res =  Logos::Creates::Filter.new(Template.all, '123', nil, nil, [1, 2, 3]).call

      expect(res.size).to eq(1)
      expect(res.first.id).to eq(template_with_icon.id)
    end

    it 'Template with slogan required must be return' do
      res =  Logos::Creates::Filter.new(Template.all, '123', nil, nil, []).call

      expect(res.size).to eq(2)
    end
  end

  describe 'filter by industry' do
    let!(:template_valid_industry) { create(:template) }
    let!(:valid_industry) { create(:industry) }
    let!(:advanced_data_valid_template) { create(:advanced_data,
                                                 template_id: template_valid_industry.id,
                                                 industry_id: valid_industry.id) }

    let!(:template_invalid_industry) { create(:template) }
    let!(:invalid_industry) { create(:industry) }
    let!(:advanced_data_invalid_template) { create(:advanced_data,
                                                 template_id: template_invalid_industry.id,
                                                 industry_id: invalid_industry.id) }


    it 'Template with valid industry must be return' do
      res =  Logos::Creates::Filter.new(Template.all, '123', valid_industry.id, nil, []).call

      expect(res.size).to eq(1)
      expect(res.first.id).to eq(template_valid_industry.id)
    end
  end
end