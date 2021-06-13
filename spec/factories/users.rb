FactoryBot.define do
  factory :user do
    email { 'afranio.rodrigues@live.com' }
    password { '123456' }
    cpf { '09630985780' }
    telefone { '(27) 99645-3556' }
  end
end
