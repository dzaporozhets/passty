# == Schema Information
#
# Table name: applications
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  url         :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Application < ActiveRecord::Base
  belongs_to :user

  has_many :passwords, dependent: :destroy

  validates :title, presence: true

  def self.search(query)
    where("lower(applications.title) LIKE :query OR applications.url LIKE :query", query: "%#{query.downcase}%")
  end
end
