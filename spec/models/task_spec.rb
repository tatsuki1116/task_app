# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'task_nameの作成ができること' do
    task = Task.new(task_name: 'task1', details: 'tasktasktask')
    expect(task.task_name).to eq 'task1'
  end

  it 'detailsの作成ができること' do
    task = Task.new(details: 'tasktasktask')
    expect(task.details).to eq 'tasktasktask'
  end
end
