require 'spec_helper'

describe "passwords/new" do
  before(:each) do
    assign(:password, stub_model(Password,
      :title => "MyString",
      :description => "MyText",
      :application_id => 1,
      :password => "MyString"
    ).as_new_record)
  end

  it "renders new password form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", passwords_path, "post" do
      assert_select "input#password_title[name=?]", "password[title]"
      assert_select "textarea#password_description[name=?]", "password[description]"
      assert_select "input#password_application_id[name=?]", "password[application_id]"
      assert_select "input#password_password[name=?]", "password[password]"
    end
  end
end
