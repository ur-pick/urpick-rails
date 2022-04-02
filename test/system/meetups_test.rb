require "application_system_test_case"

class MeetupsTest < ApplicationSystemTestCase
  test "Creating a Meetup" do
    login_as users(:jane)

    visit "/meetups/new"

    fill_in "meetup[title]", with: "New Meetup"
    fill_in "meetup[description]", with: "New Description"
    fill_in "meetup[invites_attributes][0][user_id]", with: 2
    click_on "Create Meetup"
    assert_text "You have successfully created a Meetup!"
  end
end
