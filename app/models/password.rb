class Password < ActiveRecord::Base
  belongs_to :application

  validates :title, presence: true
  validates :password, presence: true
end
