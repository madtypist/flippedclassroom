json.array!(@classrooms) do |classroom|
  json.extract! classroom, :id, :name, :grade, :code, :activePlaylistLink
  json.url classroom_url(classroom, format: :json)
end
