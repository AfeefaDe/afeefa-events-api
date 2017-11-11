require 'event'
require Rails.root.join('app/concepts/event/representer/event_representer').to_s

class Event::Index < Trailblazer::Operation

  extend Representer::DSL

  representer EventRepresenter

  step :model!
  # step Contract::Build(constant: MyContract)
  # step Contract::Validate()
  # failure :log_error!
  # step Contract::Persist()

  def model!(options, params:)
    options['model'] = Event.all
  end

end
