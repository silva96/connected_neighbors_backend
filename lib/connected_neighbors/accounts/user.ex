defmodule ConnectedNeighbors.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ConnectedNeighbors.Chat.Message

  schema "users" do
    field :name, :string
    has_many :messages, Message

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
