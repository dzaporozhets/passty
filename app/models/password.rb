# == Schema Information
#
# Table name: passwords
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  description    :text
#  application_id :integer
#  password       :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Password < ActiveRecord::Base
  belongs_to :application

  validates :title, presence: true
  validates :password, presence: true

  scope :old, -> { where(old: true) }

  before_save :encrypt

  def encrypt
    self.password = user.encrypt(self.password)
  end

  def decrypted_password
    user.decrypt(password) if password.present?
  end

  def user
    application.user
  end
end
