defmodule Fallout_4Tracker.Quest do
  use Fallout_4Tracker.Web, :model

  schema "quests" do
    field :name, :string
    field :category, :string
    field :status, :string

    timestamps
  end

  @required_fields ~w(name category status)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
