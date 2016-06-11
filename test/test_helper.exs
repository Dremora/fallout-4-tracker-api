ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Fallout_4Tracker.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Fallout_4Tracker.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Fallout_4Tracker.Repo)

