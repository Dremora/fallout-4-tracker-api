defmodule Fallout_4Tracker.QuestView do
  use Fallout_4Tracker.Web, :view

  def render("index.json", %{quests: quests}) do
    %{data: render_many(quests, Fallout_4Tracker.QuestView, "quest.json")}
  end

  def render("show.json", %{quest: quest}) do
    %{data: render_one(quest, Fallout_4Tracker.QuestView, "quest.json")}
  end

  def render("quest.json", %{quest: quest}) do
    %{id: quest.id,
      name: quest.name,
      category: quest.category,
      status: quest.status}
  end
end
