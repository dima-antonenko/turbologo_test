FactoryBot.define do
  factory :template do
    preview_image { 'http://test.ru/image.png' }
    icon_required { false }
    slogan_required { false }
  end
end
