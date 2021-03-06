defmodule BotAction.Supervisor do
  def start_link(opts \\ []) do
    Task.Supervisor.start_link(opts)
  end

  def start_action(supervisor, command, trigger, message, slack) do
    Task.Supervisor.start_child(supervisor, fn ->
      case command do
        :respond -> BotAction.Action.respond(trigger, message, slack)
        :hear -> BotAction.Action.hear(trigger, message, slack)
      end
    end)
  end
end
