defmodule FallingBack.Repo do
  use Ecto.Repo,
    otp_app: :falling_back,
    adapter: Ecto.Adapters.Postgres
end
