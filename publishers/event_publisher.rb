class EventPublisher < Struct.new(:event)
  def self.publish(event)
    new(event).publish
  end

  def publish
    run_event
    save_event
  end

  def run_event
    event.call
  end

  def save_event
    EVENT_STORE << event
  end
end

class EventPublisherLog < EventPublisher
  def run_event
    puts "-> Run event: #{event.to_json}"
    super
  end

  def save_event
    puts "<- Store event: #{event.to_json}"
    super
  end
end
