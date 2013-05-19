require 'spec_helper'

describe "applications/show" do
  before(:each) do
    @application = assign(:application, stub_model(Application,
      :title => "Title",
      :url => "Url",
      :description => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Url/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
