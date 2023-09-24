module Logos
  module Creates
    class Sorter
      attr_accessor :templates

      def initialize(templates)
        @templates = templates
      end

      def call
        sort_by_sales_count
        templates
      end

      private

      def sort_by_sales_count
        self.templates = templates.joins(:advanced_datas)
                                  .order('advanced_datas.sales_count ASC')
                                  .order('advanced_datas.clicks_count ASC')
      end
    end
  end
end