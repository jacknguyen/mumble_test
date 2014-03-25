require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :user_name => "MyString",
      :body => "MyText",
      :idea_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "input#comment_user_name[name=?]", "comment[user_name]"
      assert_select "textarea#comment_body[name=?]", "comment[body]"
      assert_select "input#comment_idea_id[name=?]", "comment[idea_id]"
    end
  end
end
