defmodule SarthakAdmissionWeb.Router do
  use SarthakAdmissionWeb, :router

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

  scope "/", SarthakAdmissionWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/", PageController, :validate_token

    get "/page_one/:token_no", PageController, :page_one
    post "/page_one/:token_no", PageController, :create_page_one

    get "/page_two/:token_no", PageController, :page_two
    post "/page_two/:token_no", PageController, :create_page_two

    get "/page_three/:token_no", PageController, :page_three
    post "/page_three/:token_no", PageController, :create_page_three

    get "/print/:token_no", PageController, :print
  end

  # Other scopes may use custom stacks.
  # scope "/api", SarthakAdmissionWeb do
  #   pipe_through :api
  # end
end
