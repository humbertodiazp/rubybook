require "application_system_test_case"

class FriendshipsTest < ApplicationSystemTestCase
  setup do
    @friendship = friendships(:one)
  end

  test "visiting the index" do
    visit friendships_url
    assert_selector "h1", text: "Friends"
  end

  test "should create friendship" do
    visit friendships_url

    assert_text "Friendship was successfully created"
    click_on "Back"
  end


  test "should destroy Friendship" do
  
  end
end
