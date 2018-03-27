##ActionCable notification app
   - This simple application to send notification
   -            --notification model--
       - recipient_id : User who receive the notification
       - user_id: User who send the notification
       - action: what the action user do ex. "following"
       - notifiable_id and notifiable_type : polymorphic for notifiacle

       
### Set up development environment

####  Requirements

  * Install [Redis](https://redis.io/)
  ```bash
        $ brew update
        $ brew install redis
   ```
### Prepare DB

   * Create DBs
    - create User model and notification model 
    
   ```bash 
     $ rails db:create db:migrate
   ```
### Use App

   * Open Console
       ```bash
        $ rails console
       ```
   * Rails Console 
     - Create User 
        ```bash
        > User.create! email: "test@test.com" , password: "123123"
        > User.create! email: "test@test1.com" , password: "123123"
        ```     
     - Create Notification 
        ```bash
        > Notification.create(recipient: User.first, user: User.last, action: "followed", notifiable: User.first)
     - Create Notification 
        ```bash
        > Notification.create(recipient: User.first, user: User.last, action: "followed", notifiable: User.first)
        > notification = Notification.last

        ```    
      - Render Partial on view 
        ```bash
        > ApplicationController.render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats:[:html]
        ```
      - Active Job notification
          ```bash
          NotificationRelayJob.perform_later(notification)

          ```
    
    