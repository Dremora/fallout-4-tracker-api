use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fallout_4_tracker, Fallout_4Tracker.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :fallout_4_tracker, Fallout_4Tracker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "fallout_4_tracker_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
