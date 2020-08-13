require 'rails_helper'

RSpec.describe 'Tests', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:test) { create(:test) }

  it 'タスク(test)を追加' do
    visit tests_path
    find("[data-testid='add']").click
    expect do
      find("[data-testid='name']").set('ジムに行く')
      find("[data-testid='submit']").click
    end.to change(Test.all, :count).by(1)
  end

  it 'タスク(test)を編集' do
    visit tests_path
    expect(page).to_not have_content 'タスク名を編集した'
    find("[data-testid='edit0']").click
    find("[data-testid='name']").set('タスク名を編集した')
    find("[data-testid='submit']").click
    expect(page).to have_content 'タスク名を編集した'
  end

  it 'タスク(test)を削除' do
    visit tests_path
    expect do
      find("[data-testid='delete0']").click
    end.to change(Test.all, :count).by(-1)
  end
end
