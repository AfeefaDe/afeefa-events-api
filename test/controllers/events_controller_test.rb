require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  test 'should show event' do
    event = Event.create!(title: 'title123')
    get :show, params: { id: event.id }
    assert_response :ok
    json = JSON.parse(response.body)
    assert_equal event.id, json['id']
    assert_equal event.title, json['title']
  end

end
