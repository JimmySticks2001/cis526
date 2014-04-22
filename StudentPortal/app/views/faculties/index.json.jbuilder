json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :name, :personal_page_link, :email, :office_location, :phone_number, :classes
  json.url faculty_url(faculty, format: :json)
end
