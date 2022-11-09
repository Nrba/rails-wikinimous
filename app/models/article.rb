# frozen_string_literal: false

class Article < ApplicationRecord
  validates :title, :content, presence: true
end
