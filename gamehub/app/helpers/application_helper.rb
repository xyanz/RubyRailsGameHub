# Dynamic title helper for partial
# Adds base title if no title exists
module ApplicationHelper
  def full_title(page_title = '')
  base_title = "GAMEHUB APP"
  if page_title.empty?
    base_title
  else
    page_title + " | " + base_title
  end
end
end
