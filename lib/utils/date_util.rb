class DateUtil
  def self.detect_target_season
    this_year   = Date.today.year
    this_season = self.get_this_season
    return "#{this_year}-#{this_season}"
  end

  def self.get_this_season
    this_month = Date.today.mon
    case this_month
    when 1..3
      return 'winter'
    when 4..6
      return 'spring'
    when 7..9
      return 'summer'
    when 10..12
      return 'autumn'
    end
  end
end
