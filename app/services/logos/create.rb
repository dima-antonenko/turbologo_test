module Logos
  class Create
    attr_accessor :company_name, :industry_id, :slogan, :icon_ids, :templates

    def initialize(company_name, industry_id, slogan, icon_ids = [])
      @company_name = company_name
      @industry_id = industry_id
      @slogan = slogan
      @icon_ids = icon_ids
      @templates = Template.all
    end

    def call
      filter!
      sorter!
      paginate

      templates
    end

    private

    def filter!
      self.templates = Logos::Creates::Filter.new(templates, company_name, industry_id, slogan, icon_ids).call
    end

    def sorter!
      self.templates = Logos::Creates::Sorter.new(templates).call
    end

    def paginate!
      self.templates = templates.paginate(page: current_page, per_page: per_page)
    end
  end
end