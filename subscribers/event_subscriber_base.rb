class EventSubscriberBase
  attr_reader :event

  def self.call(event)
    new(event).call
  end

  def initialize(event)
    @event = event
  end

  def call
    if self.respond_to? event.action
      send(event.action)
    else
      raise "Not implemented method: #{event.action} for #{self.class}"
    end
  end

  module HandleSubscribers
    def subscribers
      @subscribers ||= []
    end

    def remove_subscriber(subscriber)
      subscribers.delete(subscriber)
    end

    def add_subscriber(subscriber)
      subscribers << subscriber
    end

    def clear_subsribers
      subscribers.clear
    end
  end
end
