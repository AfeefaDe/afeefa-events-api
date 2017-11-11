require Rails.root.join('app/concepts/event/operation/show').to_s

class EventsController < ApplicationController

  def show
    result = Event::Show.(params)

    if result.success?
      render json: result['representer.default.class'].new(result['model']).to_json
    else
      render json: 'internal error'
    end
  end

end
