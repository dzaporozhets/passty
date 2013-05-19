require 'spec_helper'

describe "passwords/show" do
  before(:each) do
    @password = assign(:password, stub_model(Password,
      :title => "Title",
      :description => "MyText",
      :application_id => 1,
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Password/)
  end
end
