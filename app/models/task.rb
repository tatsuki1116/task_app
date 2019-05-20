class Task < ApplicationRecord
	validates :task_name, presence: true
	validates :details, length: { maximum: 255  }
end
