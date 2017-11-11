require 'test_helper'
require Rails.root.join('app/concepts/event/operation/index').to_s

class ShowTest < ActiveSupport::TestCase

  test 'should show events' do
    event = Event.create!(title: 'title123')
    event2 = Event.create!(title: 'title123456')
    result = Event::Index.()
    assert result.success?
    assert_equal 2, result['model'].count
    assert_equal event, result['model'].first
    assert_equal event2, result['model'].last
  end

end
