# Browser Push Notifications
Browser push notifications demo using SSE, Rails 5.1.2, and Ruby 2.3.4

## Create Notifications
```sql
Notification.create title: 'Notification for User 1', body: 'Test the browser push notifications.', user_id: 1
Notification.create title: 'Notification for User 2', body: 'Test the browser push notifications.', user_id: 2
```

## Test the Browser Notifications
```
http://localhost:3000/?user_id=1
http://localhost:3000/?user_id=2
```
