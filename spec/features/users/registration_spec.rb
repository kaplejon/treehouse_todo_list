require "spec_helper"

describe "Signing up" do
  it "allows a user to sign up for the site and creates the object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign Up")
    click_link "Sign Up"

    fill_in "First Name", with: "Jason"
    fill_in "Last Name", with: "Seifer"
    fill_in "Email", with: "jason@teamtreehouse.com"
    fill_in "Password", with: "treehouse1234"
    fill_in "Password (again)", with: "treehouse1234"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end

end