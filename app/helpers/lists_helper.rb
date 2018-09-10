module ListsHelper
  def format_list_name(list)
    list.updated_at.localtime.strftime('%e %b %Y, %l:%M:%S %P')
  end
end
