defmodule Fallout_4Tracker.QuestController do
  use Fallout_4Tracker.Web, :controller

  alias Fallout_4Tracker.Quest

  plug :scrub_params, "quest" when action in [:create, :update]

  def index(conn, _params) do
    quests = Repo.all(from q in Quest, select: q, order_by: [asc: q.id])
    render(conn, "index.json", quests: quests)
  end

  def create(conn, %{"quest" => quest_params}) do
    changeset = Quest.changeset(%Quest{}, quest_params)

    case Repo.insert(changeset) do
      {:ok, quest} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", quest_path(conn, :show, quest))
        |> render("show.json", quest: quest)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Fallout_4Tracker.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    quest = Repo.get!(Quest, id)
    render(conn, "show.json", quest: quest)
  end

  def update(conn, %{"id" => id, "quest" => quest_params}) do
    quest = Repo.get!(Quest, id)
    changeset = Quest.changeset(quest, quest_params)

    case Repo.update(changeset) do
      {:ok, quest} ->
        render(conn, "show.json", quest: quest)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Fallout_4Tracker.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    quest = Repo.get!(Quest, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(quest)

    send_resp(conn, :no_content, "")
  end
end
