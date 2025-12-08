class BlogPost < ApplicationRecord
  before_save :calculate_reading_time

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true
  validates :date, presence: true
  validates :summary, presence: true

  private

  def calculate_reading_time
    return unless body.present?
    
    words_per_minute = 200
    word_count = body.split.size
    minutes = (word_count / words_per_minute.to_f).ceil
    self.reading_time = minutes
  end
end
