require 'spec_helper'

describe "applications/new" do
  before(:each) do
    assign(:application, stub_model(Application,
      :title => "MyString",
      :url => "MyString",
      :description => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new application form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", applications_path, "post" do
      assert_select "input#application_title[name=?]", "application[title]"
      assert_select "input#application_url[name=?]", "application[url]"
      assert_select "textarea#application_description[name=?]", "application[description]"
      assert_select "input#application_user_id[name=?]", "application[user_id]"
    end
  end
end
