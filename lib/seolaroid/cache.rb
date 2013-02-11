require 'active_support'

module Seolaroid
  class Cache < ActiveSupport::Cache::MemoryStore
  end
end