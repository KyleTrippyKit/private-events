require "test_helper"

class EventInvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_invitations_create_url
    assert_response :success
  end
end
