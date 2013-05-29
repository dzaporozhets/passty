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

require 'spec_helper'

describe Password do
  it { should belong_to :application }
end
