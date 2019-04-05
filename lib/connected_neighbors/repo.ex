defmodule ConnectedNeighbors.Repo do
  use Ecto.Repo,
    otp_app: :connected_neighbors,
    adapter: Ecto.Adapters.Postgres
end
