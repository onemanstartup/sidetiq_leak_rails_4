class Q
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly }

  def perform
  end
end
