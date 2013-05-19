class Application < ActiveRecord::Base
  belongs_to :user

  has_many :passwords, dependent: :destroy
end
