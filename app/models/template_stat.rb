class TemplateStat < ApplicationRecord
  self.table_name = 'template_stats'

  belongs_to :template
end
