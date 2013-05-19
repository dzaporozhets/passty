require 'spec_helper'

describe "passwords/index" do
  before(:each) do
    assign(:passwords, [
      stub_model(Password,
        :title => "Title",
        :description => "MyText",
        :application_id => 1,
        :password => "Password"
      ),
      stub_model(Password,
        :title => "Title",
        :description => "MyText",
        :application_id => 1,
        :password => "Password"
      )
    ])
  end

  it "renders a list of passwords" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
