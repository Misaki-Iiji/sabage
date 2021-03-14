module NotificationsHelper
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
    pp current_user
    pp @notifications
    return @notifications
  end
end
