defmodule PhxGenAuthCheckWeb.Resolvers.UserResolver do

  alias PhxGenAuthCheck.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end

  def register_user(_, %{input: input}, _) do
    Accounts.register_user(input)
  end
end
