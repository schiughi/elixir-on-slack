defmodule Salieri.Supervisor do

  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @bot_name Salieri.Bot
  @action_sup_name BotAction.Supervisor

  def init(:ok) do
    api_key = case System.get_env("SALIERI_API_KEY") do
      nil -> Application.get_env(:sarieri, :api_key)
      s -> s
    end

    children = [
      supervisor(BotAction.Supervisor, [[name: @action_sup_name]]),
      worker(Salieri.Bot, [api_key, [name: @bot_name, sup_action: @action_sup_name]])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
