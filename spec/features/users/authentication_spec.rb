require "spec_helper"

describe "Logging In" do
  it "logs the user in and goes to the todo lists" do
    User.create(first_name: "Jason", last_name:"Seifer", email: "jason@teamtreehouse.com", password: "treehouse1", password_confirmation: "treehouse1")
    visit new_user_session_path
    fill_in "Email Address", with: "jason@teamtreehouse.com"
    fill_in "Password", with: "treehouse1"
    click_button "Log In"

    expect(page).to have_content("Todo Lists")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "displays the email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email Address", with: "jason@teamtreehouse.com"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email Address", with: "jason@teamtreehouse.com")
  end
end