require 'test_helper'
require Rails.root.join('app/concepts/event/operation/show').to_s

class ShowTest < ActiveSupport::TestCase

  test 'should show event' do
    event = Event.create!(title: 'title123')
    result = Event::Show.(id: event.id)
    assert result.success?
    assert_equal event, result['model']
  end

end
