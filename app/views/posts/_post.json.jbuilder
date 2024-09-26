json.extract! post, :id, :title, :content, :cover_photo_link, :author_id, :status, :created_at, :updated_at
json.url post_url(post, format: :json)
