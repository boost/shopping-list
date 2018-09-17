module ListsHelper
  def format_time(timestamp)
    timestamp.localtime.strftime('%e %b %Y, %l:%M:%S %P')
  end
end
