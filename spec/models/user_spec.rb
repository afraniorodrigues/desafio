require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { FactoryBot.build(:user) }

  it { expect(user.email).to eq('afranio.rodrigues@live.com') }
  it { expect(user.password).to eq('123456') }
  it { expect(user).to be_valid }
end
