require 'representable/json'

class EventRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :title
  # collection :composer_ids
end
