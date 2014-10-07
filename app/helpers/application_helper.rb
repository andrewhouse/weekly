module ApplicationHelper
  def not_artist item
    if current_user
      current_user != item.artist && current_user.items.include?(item) == false
    end
  end

  def is_artist
    if current_user
      current_user == @item.artist
    end
  end

  def closed item
    item.status != 'projection'
  end

  def not_banned 
    current_user.role != 'banned'
  end
end
