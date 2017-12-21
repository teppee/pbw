class Character < ApplicationRecord
    belongs_to :user
    has_many :board_message

    validates :name, presence: {message:'は、必須項目です。'}
end
