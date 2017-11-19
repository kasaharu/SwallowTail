class KeywordReply < ApplicationRecord
  def self.fetch(keyword)
    KeywordReply.find_by(keyword: keyword)
  end
end
