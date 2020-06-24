defmodule Smoke.Repo do
  use Ecto.Repo,
    otp_app: :smoke,
    adapter: Ecto.Adapters.Postgres
end
