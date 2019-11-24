FactoryBot.define do
  factory :quote do
    sequence(:content) { |n| "Content #{n}" }
    author
  end
end
