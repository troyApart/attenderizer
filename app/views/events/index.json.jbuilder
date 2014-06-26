json.array!(@events) do |event|
  json.extract! event, :id, :details, :date, :time_interval, :time_of_last_send, :time_for_first_send
  json.url event_url(event, format: :json)
end
