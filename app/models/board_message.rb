class BoardMessage < ApplicationRecord
    belongs_to :character

    validates :content, presence: {message:'は、必須項目です。'}
end
