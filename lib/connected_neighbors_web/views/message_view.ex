defmodule ConnectedNeighborsWeb.MessageView do
  use ConnectedNeighborsWeb, :view
  alias ConnectedNeighborsWeb.MessageView
  use Timex

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessageView, "message.json")}
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    {:ok, relative_str} = message.inserted_at |> Timex.format("{relative}", :relative)
    %{
      id: message.id,
      user_name: message.user_name,
      inserted_at: message.inserted_at,
      inserted_at_h: relative_str,
      content: message.content
    }
  end
end
