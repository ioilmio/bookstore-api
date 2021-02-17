FactoryBot.define do
  factory :comment do
    user_id { 1 }
    body { 'comment body' }
  end
end
