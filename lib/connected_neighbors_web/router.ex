defmodule ConnectedNeighborsWeb.Router do
  use ConnectedNeighborsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", ConnectedNeighborsWeb do
    pipe_through :api
    resources "/users", UserController
    resources "/messages", MessageController
  end
end
