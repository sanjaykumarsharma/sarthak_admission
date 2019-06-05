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

    get "/page_one_edit/:token_no", PageController, :page_one_edit
    post "/page_one_edit/:token_no", PageController, :update_page_one

    get "/page_two/:token_no", PageController, :page_two
    post "/page_two/:token_no", PageController, :create_page_two

    get "/secondary/:token_no", SecondaryController, :new
    post "/secondary/:token_no", SecondaryController, :create
    delete "/secondary/:token_no/:subject_code", SecondaryController, :delete
    post "/secondary_total/:token_no", SecondaryController, :create_total

    get "/secondary_edit/:token_no", SecondaryController, :edit
    post "/secondary_update/:token_no", SecondaryController, :update
    put "/secondary_update_total/:token_no", SecondaryController, :update_total

    get "/higher_secondary/:token_no", HigherSecondaryController, :new
    post "/higher_secondary/:token_no", HigherSecondaryController, :create
    delete "/higher_secondary/:token_no/:subject_code", HigherSecondaryController, :delete
    post "/higher_secondary_total/:token_no", HigherSecondaryController, :create_total

    get "/higher_secondary_edit/:token_no", HigherSecondaryController, :edit
    post "/higher_secondary_update/:token_no", HigherSecondaryController, :update
    put "/higher_secondary_update_total/:token_no", HigherSecondaryController, :update_total

    get "/diploma/:token_no", DiplomaController, :new
    post "/diploma/:token_no", DiplomaController, :create
    delete "/diploma/:token_no/:subject_code", DiplomaController, :delete
    post "/diploma_total/:token_no", DiplomaController, :create_total

    get "/diploma_edit/:token_no", DiplomaController, :edit
    post "/diploma_update/:token_no", DiplomaController, :update
    put "/diploma_update_total/:token_no", DiplomaController, :update_total

    get "/page_two_edit/:token_no", PageController, :page_two_edit
    put "/page_two_edit/:token_no", PageController, :update_page_two

    get "/page_three/:token_no", PageController, :page_three
    post "/page_three/:token_no", PageController, :create_page_three

    get "/page_three_edit/:token_no", PageController, :page_three_edit
    post "/page_three_edit/:token_no", PageController, :update_page_three

    get "/print/:token_no", PageController, :print
  end

  # Other scopes may use custom stacks.
  # scope "/api", SarthakAdmissionWeb do
  #   pipe_through :api
  # end
end
