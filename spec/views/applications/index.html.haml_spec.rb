require 'spec_helper'

describe "applications/index" do
  before(:each) do
    assign(:applications, [
      stub_model(Application,
        :title => "Title",
        :url => "Url",
        :description => "MyText",
        :user_id => 1
      ),
      stub_model(Application,
        :title => "Title",
        :url => "Url",
        :description => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of applications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
