json.extract! board_message, :id, :content, :character_id, :board_id, :board_title, :created_at, :updated_at
json.url board_message_url(board_message, format: :json)
