defmodule PhxGenAuthCheck.Repo do
  use Ecto.Repo,
    otp_app: :phx_gen_auth_check,
    adapter: Ecto.Adapters.Postgres
end
