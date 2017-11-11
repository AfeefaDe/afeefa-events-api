require Rails.root.join('app/concepts/event/operation/index').to_s
require Rails.root.join('app/concepts/event/operation/show').to_s

class EventsController < ApplicationController

  def index
    result = Event::Index.()

    if result.success?
      render json: {
        events: result['model'].map{ |x| result['representer.default.class'].new(x) }
      }.to_json
    else
      render json: 'internal error'
    end
  end

  def show
    result = Event::Show.(params)

    if result.success?
      render json: result['representer.default.class'].new(result['model']).to_json
    else
      render json: 'internal error'
    end
  end

end
