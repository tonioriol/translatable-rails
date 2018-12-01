# frozen_string_literal: true

class Content < ApplicationRecord
  translatable :body, :footer
end
