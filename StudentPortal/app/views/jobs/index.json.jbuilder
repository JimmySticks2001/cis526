json.array!(@jobs) do |job|
  json.extract! job, :id, :kind, :title, :desc, :poster, :host
  json.url job_url(job, format: :json)
end
