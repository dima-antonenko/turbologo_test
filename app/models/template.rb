class Template < ApplicationRecord
  has_many :advanced_datas
  has_many :template_stats
  has_many :company_length_datas
end
