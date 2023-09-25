module Logos
  module Creates
    class Sorter
      attr_accessor :templates

      def initialize(templates)
        @templates = templates
      end

      def call
        sort_by_sales_count
        self.templates
      end

      private

      def sort_by_sales_count
        self.templates = templates.joins(:template_stats)
                                  .order('template_stats.sales_count DESC')
                                  .order('template_stats.clicks_count DESC')
      end
    end
  end
end