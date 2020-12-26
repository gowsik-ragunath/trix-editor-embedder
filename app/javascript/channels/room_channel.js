import consumer from "./consumer"

document.addEventListener("turbolinks:load", function() {
	var room = document.querySelector("#room")
	console.log(room)
	if(room)
	{
		consumer.subscriptions.create({ channel: "RoomChannel", room: room.getAttribute("data-room-id") }, {
		  connected() {
		    // Called when the subscription is ready for use on the server
		    console.log("Connected to room!")
		  },

		  disconnected() {
		    // Called when the subscription has been terminated by the server
		  },

		  received(data) {
		    // Called when there's incoming data on the websocket for this channel
		    console.log(data)
		  }
		});
	}
})

//		consumer.subscriptions.create({ channel: `room_channel_${room.getAttribute("data-room-id")}` }, {