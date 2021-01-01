import consumer from "./consumer"

document.addEventListener("turbolinks:load", function() {
	var room = document.querySelector("#room")
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
		   	if(data) {
			    let bodyContent = data["message"];
			    let formAction = document.querySelector("#form-action");
			    let newMessage = `${data["user_email"]}: <div class=inline-block">${data["message"]}</div> <br />`;

			    formAction.insertAdjacentHTML("beforebegin", newMessage);
			}
		  }
		});
	}
})