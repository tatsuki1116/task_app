# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :tasks, dependent: :destroy
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
