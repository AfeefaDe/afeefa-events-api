require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  test 'should get index' do
    event = Event.create!(title: 'title123')
    event2 = Event.create!(title: 'title123456')
    get :index
    assert_response :ok
    json = JSON.parse(response.body)
    events = json['events']
    assert_equal 2, events.count
    assert_equal event.id, events.first['id']
    assert_equal event.title, events.first['title']
    assert_equal event2.id, events.last['id']
    assert_equal event2.title, events.last['title']
  end

  test 'should get show' do
    event = Event.create!(title: 'title123')
    get :show, params: { id: event.id }
    assert_response :ok
    json = JSON.parse(response.body)
    assert_equal event.id, json['id']
    assert_equal event.title, json['title']
  end

end
