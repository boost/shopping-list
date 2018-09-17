class BackFillListNames < ActiveRecord::Migration[5.2]
  def timestamp(entry)
    entry.created_at.localtime.strftime('%e %b %Y, %l:%M:%S %P')
  end

  def change
    # NOTE: the below method would not be suitable to use for a large # of records.
    List.where(name: nil).each do |entry|
      entry.name = "List created at #{timestamp(entry)}"
      entry.save
    end
  end
end
