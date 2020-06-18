FactoryBot.define do
  factory :task do
    task_name { 'タスク１' }
    details { 'タスク１タスク１タスク１' }
    deadline_at { Date.parse('2018-01-01') }
    status { 'completed' }
  end

  factory :new_task do
    task_name { 'new Task' }
    details { 'タスクタスクタスク' }
    deadline_at { Date.parse('2022-12-31') }
    status { 'waiting' }
  end

  factory :old_task do
    task_name { 'old Task' }
    details { 'タスクタスクタスク' }
    deadline_at { Date.parse('2019-12-31') }
    status { 'waiting' }
  end
end
