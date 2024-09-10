class Board < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    belongs_to :user
    has_many :tasks, dependent: :destroy

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end

    def author_name
        user.display_name
    end
end
