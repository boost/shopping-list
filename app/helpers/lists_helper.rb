module ListsHelper
  def format_list_name(list)
    if list.name.nil? || list.name.strip.empty?
      timestamp = list.created_at.localtime.strftime('%e %b %Y, %l:%M:%S %P')
      "List created at #{timestamp}"
    else
      list.name
    end
  end
end
