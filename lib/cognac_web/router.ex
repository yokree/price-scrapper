defmodule CognacWeb.Router do
  use CognacWeb, :router

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

  scope "/", CognacWeb do
    pipe_through :browser # Use the default browser stack

    get "/", ProductController, :index
    get "/all", ProductController, :all
    resources "/products", ProductController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CognacWeb do
  #   pipe_through :api
  # end
end
