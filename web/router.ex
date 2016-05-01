defmodule Triedemo.Router do
  use Triedemo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Triedemo do
    pipe_through :browser # Use the default browser stack

    get "/", TrieController, :index
    post "/", TrieController, :format
  end

  # Other scopes may use custom stacks.
  # scope "/api", Triedemo do
  #   pipe_through :api
  # end
end
