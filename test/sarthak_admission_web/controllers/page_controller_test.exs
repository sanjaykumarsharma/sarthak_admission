defmodule SarthakAdmissionWeb.PageControllerTest do
  use SarthakAdmissionWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
