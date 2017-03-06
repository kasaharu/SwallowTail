class KeywordReply < ApplicationRecord
  def self.fetch(keyword)
    return KeywordReply.find_by(keyword: keyword)
  end
end
