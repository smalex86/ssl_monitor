class MonitorJob < ApplicationJob
  def perform
    Certificate.check
  end
end
