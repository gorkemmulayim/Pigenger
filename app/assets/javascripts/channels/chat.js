App.chat = App.cable.subscriptions.create("ChatChannel", {
  // Called when the subscription is ready for use on the server
  connected: function() {
  },

  // Called when the subscription has been terminated by the server
  disconnected: function() {
  },

  // Called when there's incoming data on the websocket for this channel
  received: function(data) {
    var chat = $('#chats-list').find("[data-chat-id='" + data['chat_id'] + "']");
    chat.find('.messages-list').find('ul').append(data['message']);

    var messages_list = chat.find('.messages-list');
    var height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);
  },

  speak: function(message) {
    return this.perform('speak', {
      message: message
    });
  }
});

$(document).on('submit', '.new_message', function(e) {
  e.preventDefault();
  var values = $(this).serializeArray();
  App.chat.speak(values);
  $(this).trigger('reset');
});
