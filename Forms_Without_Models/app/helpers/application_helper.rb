module ApplicationHelper
  def calendar(month, year)

    cal_str = ""
    first_day = Date.new(year, month).at_beginning_of_month.wday
    last_day = Time.days_in_month(month, year)
    prev_year = year
    next_year = year
    prev_month = month - 1
    if prev_month == 0
      prev_month = 12
      prev_year -= 1
    end

    next_month = month + 1
    if next_month == 13
      next_month = 1
      next_year += 1
    end


    cal_str += '<div class="calendar_month">'
    cal_str += '<div class="cal_button">'
    cal_str += link_to 'Prev', calendar_path(month: prev_month, year: prev_year)
    cal_str += '</div>'
    cal_str += '<h2 class="cal_h2">'
    cal_str += Date.new(year, month).strftime("%B %Y")
    cal_str += '</h2>'
    cal_str += '<div class="cal_button">'
    cal_str += link_to 'Next', calendar_path(month: next_month, year: next_year)
    cal_str += '</div>'
    cal_str += '</div>'
    cal_str += '<table class="calendar_table">'
    cal_str += '<tr>'
    cal_str += '<td>Sunday</td>'
    cal_str += '<td>Monday</td>'
    cal_str += '<td>Tuesday</td>'
    cal_str += '<td>Wednesday</td>'
    cal_str += '<td>Thursday</td>'
    cal_str += '<td>Friday</td>'
    cal_str += '<td>Saturday</td>'
    cal_str += '</tr>'

    cal_str += '<tr>'

    first_day.times do
      cal_str += '<td>&nbsp;</td>'
    end
    day_counter = 1
    (7 - first_day).times do |day|
      cal_str += '<td>'
      cal_str += (day + 1).to_s
      cal_str += '</td>'
      day_counter += 1
    end
    cal_str += '</tr>'
    cal_str += '<tr>'
    day_of_week = 0
    while day_counter <= last_day

      if day_of_week % 7 == 0
        cal_str += '<tr>'
      end

      cal_str += '<td>'
      cal_str += day_counter.to_s
      cal_str += '</td>'
      day_of_week += 1
      day_counter += 1
      if day_of_week % 7 == 0
        day_of_week = 0
        cal_str += '</tr>'
      end

    end
    remaining_days = 7 - day_of_week
    while remaining_days > 0
      cal_str += '<td>-</td>'
      remaining_days -= 1
    end
    cal_str += '</tr>'
    cal_str += '</table>'
    return cal_str.html_safe

  end
end