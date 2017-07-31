class PushNotificationsController < ApplicationController
  include ActionController::Live

  SSE_RETRY = 3000;

  def push
    response.headers['Content-Type'] = 'text/event-stream'

    sse = SSE.new(response.stream, retry: SSE_RETRY, event: 'push-notifications')
    sse.write notification
    logger.info 'Event stream started'
  rescue IOError
    logger.info 'Event stream has been closed'
  ensure
    sse.close
    logger.info 'Event stream closed'
    mark_notifications_delivered
  end

  private

    def notification
      if notifications.count > 1
        multiple_notifications_message
      else
        notifications
      end
    end

    def notifications
      Notification.undelivered params[:id], params[:user_id]
    end

    def multiple_notifications_message
      [{ title: 'Push Notifications', body: "You have #{notifications.count} unread notifications."}]
    end

    def mark_notifications_delivered
      notifications.update_all delivered: true
    end
end
