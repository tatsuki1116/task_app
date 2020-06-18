# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
  	@user = FactoryBot.create(:user)
  	@task = FactoryBot.create(:task, user_id: @user.id)
  	expect(@task).to be_valid
  end


	describe 'バリデーション' do
		it '全て値が設定されていれば、OK' do
      expect(@task.valid?).to eq(true)
    end

  	it 'task_nameが空だと保存できない' do
  		@task.task_name = ''
  		expect(@task.valid?).to eq(false)
  	end

  	it 'detailsの文字数が255以上だと保存できない' do
  		@task.details = 'a' * 256
  		expect(@task.valid?).to eq(false)
  	end

  	it 'user_idが空だと保存できない' do
  		@task.user_id = nil
  		expect(@task.valid?).to eq(false)
  	end
	end

	describe 'タスク検索' do
		context '送られてきたタスクを検索できること' do
			it '入力された値を返すこと' do
				expect(Task.where('task_name LIKE ?', "%#{@task.task_name}%")).to include(@task)
			end
		end
	end
end
