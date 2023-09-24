module Logos
  module Creates
    class Filter
      attr_accessor  :company_name, :industry_id, :slogan, :icon_ids, :templates

      def initialize(templates, company_name, industry_id, slogan, icon_ids = [])
        @company_name = company_name
        @industry_id = industry_id
        @slogan = slogan
        @icon_ids = icon_ids
        @templates = templates
      end

      def call
        # by_company_name
        by_slogan
        by_icon
        by_industry

        templates
      end

      private

      def by_company_name
        # self.templates = templates.joins(:company_length_datas)
        #                          .where({ company_length_datas: { 'company_name_length_min >= ? ' => company_name.size } })
        #                          .where({ company_length_datas: { 'company_name_length_max <= ? ' => company_name.size } })

        self.templates = templates.joins(:company_length_datas)
                                  .where('company_length_datas.company_name_length_min >= ?' => company_name.size)
                                  .where('company_length_datas.company_name_length_max <= ?' => company_name.size)
      end

      def by_slogan
        self.templates = templates.where(slogan_required: true) if slogan
      end

      def by_icon
        self.templates = templates.where(icon_required: true) if icon_ids && !icon_ids.empty?
      end

      def by_industry
        self.templates = templates.joins(:advanced_datas)
                                  .where(advanced_datas: { industry_id: industry_id }) if industry_id
      end
    end
  end
end