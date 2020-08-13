require 'rails_helper'

RSpec.describe Test, type: :model do
  it 'test data is valid' do
    test = create(:test)
    expect(test).to be_valid
  end

  it 'test data with an arg is valid' do
    test = build(:test, name: 'テストタスク')
    expect(test.name).to eq 'テストタスク'
  end
end
