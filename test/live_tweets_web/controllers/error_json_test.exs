defmodule LiveTweetsWeb.ErrorJSONTest do
  use LiveTweetsWeb.ConnCase, async: true

  test "renders 404" do
    assert LiveTweetsWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert LiveTweetsWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
