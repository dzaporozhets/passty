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

require 'spec_helper'

describe Application do
  it { should belong_to :user }
  it { should have_many :passwords }
  it { validate_uniqueness_of :title }
end
