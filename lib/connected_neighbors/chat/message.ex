defmodule ConnectedNeighbors.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias ConnectedNeighbors.Accounts.User

  schema "messages" do
    field :content, :string
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :user_id])
    |> validate_required([:content, :user_id])
    |> assoc_constraint(:user)
  end
end
