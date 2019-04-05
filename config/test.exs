use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :connected_neighbors, ConnectedNeighborsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :connected_neighbors, ConnectedNeighbors.Repo,
  username: "postgres",
  password: "postgres",
  database: "connected_neighbors_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
