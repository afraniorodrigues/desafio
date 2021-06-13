FactoryBot.define do
  factory :tarefa do
    nome { "MyString" }
    data { "2021-06-13" }
    hora { "2021-06-13 17:41:11" }
    user { nil }
  end
end
