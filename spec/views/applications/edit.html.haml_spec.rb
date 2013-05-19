require 'spec_helper'

describe "applications/edit" do
  before(:each) do
    @application = assign(:application, stub_model(Application,
      :title => "MyString",
      :url => "MyString",
      :description => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit application form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", application_path(@application), "post" do
      assert_select "input#application_title[name=?]", "application[title]"
      assert_select "input#application_url[name=?]", "application[url]"
      assert_select "textarea#application_description[name=?]", "application[description]"
      assert_select "input#application_user_id[name=?]", "application[user_id]"
    end
  end
end
