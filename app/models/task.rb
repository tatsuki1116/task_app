class Task < ApplicationRecord
	validates :task_name, presence: true
	validates :details, length: { maximum: 255  }

	enum status: { waiting: 0, working: 1, completed: 2}
	scope :status_sorted, -> (status) { where(status: status) if status.present?}
end
