module ApplicationHelper
  def browser_title content = nil
    return if content.blank?
    content_for :browser_title, content
    @browser_title_set = true
  end

  def title content = nil
    return if content.blank?
    content_for :browser_title, content unless @browser_title_set
    content_for :title, content
  end

  def body_class
    case controller.class.name
    when /^Admin/
      "administrator"
    when /^Project/
      "project"
    end
  end
  
  def date_select_options
    end_year = Time.now.localtime.year
    start_year = end_year - 15
    return {:discard_day => true, :discard_month => true, :start_year => start_year, :end_year => end_year, :include_blank => "Please select"}
  end

  def admin?
    true
  end
end
