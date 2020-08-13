require 'rails_helper'

RSpec.describe 'Tests', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:test) { create(:test) }

  it 'タスク(test)を追加' do
    visit tests_path
    find(:test_id, 'add').click
    expect do
      find(:test_id, 'name').set('ジムに行く')
      find(:test_id, 'submit').click
    end.to change(Test.all, :count).by(1)
  end

  it 'タスク(test)を編集' do
    visit tests_path
    expect(page).to_not have_content 'タスク名を編集した'
    find(:test_id, 'edit0').click
    find(:test_id, 'name').set('タスク名を編集した')
    find(:test_id, 'submit').click
    expect(page).to have_content 'タスク名を編集した'
  end

  it 'タスク(test)を削除' do
    visit tests_path
    expect do
      find(:test_id, 'delete0').click
    end.to change(Test.all, :count).by(-1)
  end
end
