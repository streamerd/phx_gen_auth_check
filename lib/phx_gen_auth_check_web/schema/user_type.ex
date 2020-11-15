defmodule PhxGenAuthCheckWeb.Schema.Types.UserType do
  use Absinthe.Schema.Notation

  # user data structure

  @desc "A user"
  object :user_type do
    field(:id, :id)

    field :email, :string
    field :password, :string

    # added after phx.gen.auth Accounts User ..
    field :username, :string
    field :city, :string
    field :country, :string
    field :role, :string
    field :behaviours, list_of(:string)
  end

  input_object :user_input_type do
    field :email, non_null(:string)
    field :username, non_null(:string)
    field :password, non_null(:string)
    field :city, non_null(:string)
    field :country, non_null(:string)
    field :role, :string
    field :behaviours, list_of(:string)
  end
end
