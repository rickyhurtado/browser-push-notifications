# Browser Push Notifications
Browser push notifications demo using Rails 4.2.7.1 and Ruby 2.3.4

## Create Notifications
```sql
Notification.create title: 'Notification for User 1', body: 'Test the browser push notifications.', user_id: 1, link: 'https://facebook.com/'
Notification.create title: 'Notification for User 2', body: 'Test the browser push notifications.', user_id: 2, link: 'https://instagram.com/'
```

## Test the Browser Notifications
```
http://localhost:3000/?user_id=1
http://localhost:3000/?user_id=2
```
