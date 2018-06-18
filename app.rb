require 'pp'
require 'active_support/inflector'

require_relative 'publishers/event_publisher.rb'
require_relative 'publishers/event_collection_publisher.rb'

require_relative 'subscribers/event_subscriber_base.rb'
require_relative 'subscribers/place_event_subscriber.rb'
require_relative 'subscribers/model3d_event_subscriber.rb'

require_relative 'events/event_base.rb'
require_relative 'events/place_event.rb'
require_relative 'events/model3d_event.rb'

#### Start to play with event pub/sub

EVENT_STORE = []

puts 'Create some events'
puts '=========='
puts

event_collection = EventCollectionPublisherLog.new
event_collection << PlaceEvent.new(:create, {a: 1})
event_collection << Model3dEvent.new(:update, {a: 2})

puts
puts
puts 'Run events'
puts '=========='
puts

event_collection.call
# previous events should not be played again
event_collection << PlaceEvent.new(:create, {a: 2})
event_collection.call

puts
puts
puts 'Store: ', EVENT_STORE.size
puts '=========='
puts
pp EVENT_STORE
puts
puts
puts 'Create and Run events'
puts '=========='
puts

EventCollectionPublisherLog.call([
  {type: :place, action: :create, data: {a: 10}},
  Model3dEvent.new(:update, {a: 20}),
  PlaceEvent.new(:create, {a: 20}),
  PlaceEvent.new(:create, {a: 30})
])

puts
puts
puts 'Store: ', EVENT_STORE.size
puts '=========='
puts

pp EVENT_STORE
