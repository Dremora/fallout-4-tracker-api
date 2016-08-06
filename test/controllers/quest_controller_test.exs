defmodule Fallout_4Tracker.QuestControllerTest do
  use Fallout_4Tracker.ConnCase

  alias Fallout_4Tracker.Quest
  @valid_attrs %{category: "some content", name: "some content", status: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, quest_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    quest = Repo.insert! %Quest{}
    conn = get conn, quest_path(conn, :show, quest)
    assert json_response(conn, 200)["data"] == %{"id" => quest.id,
      "name" => quest.name,
      "category" => quest.category,
      "status" => quest.status}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, quest_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, quest_path(conn, :create), quest: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Quest, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, quest_path(conn, :create), quest: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    quest = Repo.insert! %Quest{}
    conn = put conn, quest_path(conn, :update, quest), quest: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Quest, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    quest = Repo.insert! %Quest{}
    conn = put conn, quest_path(conn, :update, quest), quest: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    quest = Repo.insert! %Quest{}
    conn = delete conn, quest_path(conn, :delete, quest)
    assert response(conn, 204)
    refute Repo.get(Quest, quest.id)
  end
end
