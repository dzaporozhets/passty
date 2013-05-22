class Application < ActiveRecord::Base
  belongs_to :user

  has_many :passwords, dependent: :destroy

  validates :title, presence: true

  def self.search(query)
    where("applications.title LIKE :query OR applications.url LIKE :query", query: "%#{query}%")
  end
end
