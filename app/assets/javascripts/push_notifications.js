PushNotifications = {
  init: function(options){
    var self = this;

    if (Notification.permission !== 'granted'){
      Notification.requestPermission().then(function(permission){
        if (permission === 'granted'){
          self.initComponent(options);
        };
      });
    } else {
      self.initComponent(options);
    }
  },

  initComponent: function(options){
    this.eventSourceUrl = options.eventSourceUrl;
    this.noActivityTime = options.noActivityTimeMinutes;
    this.notificationId = 0;
    this.noActivityTO = 0;
    this.eventSourceStarted = false;
    this.eventSourceRestarted = true;
    this.bindEvents();
    this.setEventSource();
    this.startEventSource();
    this.initNoActivityChecker();
  },

  bindEvents: function(){
    var self = this;

    document.addEventListener('mousemove', function(){
      self.restartEventSource();
    });

    document.onkeypress = function(){
      self.restartEventSource();
    };
  },

  setEventSource: function(){
    this.eventSourceStarted = true;
    this.eventSource = new EventSource(this.eventSourceUrl);
    console.log('Push notifications started');
  },

  startEventSource: function(){
    var self = this;

    self.eventSource.addEventListener('push-notifications', function(e){
      self.jsonData = JSON.parse(e.data);

      if (self.jsonData.length > 0){
        self.createNotification(self.jsonData[0]);
      };
    });
  },

  createNotification: function(data){
    var self = this;

    if (Notification.permission === 'granted'){
      var notification = new Notification(data.title, { body: data.body });

      notification.onclick = function(){
        window.open(data.link);
      };
    };
  },

  initNoActivityChecker: function(){
    var self = this;

    clearTimeout(self.noActivityTO);

    self.noActivityTO = setTimeout(function(){
      self.eventSourceRestarted = false;
      self.eventSource.close();
      console.log('Push notifications stopped');
    }, self.noActivityTime * 60 * 1000);
  },

  restartEventSource: function(){
    this.initNoActivityChecker();

    if (!this.eventSourceRestarted && this.eventSourceStarted){
      this.eventSourceRestarted = true;
      this.setEventSource();
      this.startEventSource();
    };
  }
};
