defmodule ConnectedNeighborsWeb.UserChannel do
  use ConnectedNeighborsWeb, :channel

  # To connect go to ws://localhost:4000/socket/websocket
  # and Send the following payload:
  # {"topic":"user:chat","event":"phx_join","payload":{},"ref":"1"}
  def join("user:chat", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Broadcast to everyone in the topic
  # {"topic":"user:chat","event":"shout","payload":{"user":"Benja","body":"Hola"},"ref":"2"}
  def handle_in("shout", payload, socket) do
    broadcast! socket, "shout", payload
    {:noreply, socket}
  end

  intercept ["shout"]

  def handle_out("shout", msg, socket) do
    if false do# query if the user that is broadcasting is in the range of the socket owner user.
      {:noreply, socket}
    else
      push(socket, "shout", msg)
      {:noreply, socket}
    end
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
