require 'spec_helper'

describe "passwords/edit" do
  before(:each) do
    @password = assign(:password, stub_model(Password,
      :title => "MyString",
      :description => "MyText",
      :application_id => 1,
      :password => "MyString"
    ))
  end

  it "renders the edit password form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", password_path(@password), "post" do
      assert_select "input#password_title[name=?]", "password[title]"
      assert_select "textarea#password_description[name=?]", "password[description]"
      assert_select "input#password_application_id[name=?]", "password[application_id]"
      assert_select "input#password_password[name=?]", "password[password]"
    end
  end
end
