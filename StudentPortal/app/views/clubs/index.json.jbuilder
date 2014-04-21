json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :description, :contact_info, :club_page_link, :sponsor
  json.url club_url(club, format: :json)
end
