class AdvancedData < ApplicationRecord
  self.table_name = 'advanced_datas'

  belongs_to :template
  belongs_to :industry
end
