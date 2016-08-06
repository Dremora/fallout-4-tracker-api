defmodule Fallout_4Tracker.QuestTest do
  use Fallout_4Tracker.ModelCase

  alias Fallout_4Tracker.Quest

  @valid_attrs %{category: "some content", name: "some content", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Quest.changeset(%Quest{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Quest.changeset(%Quest{}, @invalid_attrs)
    refute changeset.valid?
  end
end
