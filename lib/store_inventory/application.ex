defmodule StoreInventory.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StoreInventory.Supervisor]
    Supervisor.start_link(get_children(), opts)
  end

  defp get_children do
    case Mix.env() do
      :test -> []
      _ -> [StoreInventory.Repo]
    end
  end
end
