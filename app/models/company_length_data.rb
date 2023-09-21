class CompanyLengthData < ApplicationRecord
  self.table_name = 'company_length_datas'

  belongs_to :template
end
