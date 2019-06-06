require 'rails_helper'
describe 'タスク' do
  let(:task_name) { 'テスト' }
  let(:details) { 'テストテストテスト' }
  let(:task_edit) { 'タスク変更タスク変更' }
  let!(:user) { create(:user) }
	before do
    visit login_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
	end
	context 'タスクの作成' do
		it 'タスクの作成ができること' do
			visit new_task_path

			fill_in 'タスク', with: task_name
			fill_in '詳細', with: details
			select '2020', from: 'task[deadline_at(1i)]'
			select '1月', from: 'task[deadline_at(2i)]'
			select '1', from: 'task[deadline_at(3i)]'
			click_button 'タスク作成'
			expect(page).to have_content task_name
		end
	end

  context 'タスクの編集' do
		let(:task) { FactoryBot.create(:task, user_id: user.id) }
		it 'タスクの編集ができること' do
			 visit edit_task_path(task.id)

			 fill_in 'タスク', with: task_edit
			 click_button '編集'
			 expect(page).to have_content task_edit
		end
	end

  context 'タスクの削除' do
    let!(:task) { create(:task, user_id: user.id) }
    it 'タスクを削除できること' do
      visit root_path

      click_link 'destory'
      expect(page).not_to have_content task_name
    end
	end

	context 'タスク一覧が作成日時の順番で並んでいること' do
    let!(:new_task) { create(:task, user_id: user.id) }
    let!(:old_task) { create(:task, user_id: user.id) }
    it '作成日時の降順で並んでいること' do
    	visit root_path

    	expect(page.all('tbody tr')[0]).to have_content new_task.task_name
      expect(page.all('tbody tr')[1]).to have_content old_task.task_name
    end
	end

	context '終了期限' do
    let!(:new_task) { create(:task, user_id: user.id) }
    let!(:old_task) { create(:task, user_id: user.id) }
    it '終了期限でソートができること' do
    	visit root_path

			select '期限：古い順', from: 'deadline'
			click_button 'sort'
      expect(page.all('tbody tr')[0]).to have_content old_task.task_name
    	expect(page.all('tbody tr')[1]).to have_content new_task.task_name
    end
  end

end

