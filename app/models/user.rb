class User < ActiveRecord::Base
  has_secure_password

  has_many :surveys
  has_many :responses
  has_many :completions
  has_many :taken_surveys, source: :survey, through: :completions

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :password, presence: true
end