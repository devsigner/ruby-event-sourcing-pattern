class PlaceEvent < EventBase
  def initialize(action, data)
    super(:place, action, data)
    @subscribers = [PlaceEventSubscriber]
  end
end