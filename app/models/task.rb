class Task < ApplicationRecord
    belongs_to :user
    belongs_to :board

    has_many :comments, dependent: :destroy

    has_one_attached :eyecatch

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end

    def author_name
        user.display_name
    end
end
