defmodule Salieri.Bot do

  use Slack

  @doc """
  接続に成功したとき
  """
  def handle_connect(slack, state) do
    IO.puts "connected as #{slack.me.name}"
    { :ok, state }
  end

  @doc """
  メッセージを受け取ったとき
  """
  def handle_mesage(message = %{ type: "message", text: _ }, slack, state) do
    trigger = String.split(message.text, ~r{ |　})

    case String.starts_with?(message.text, "<@#{slack.me.id}>: ") do
      true -> BotAction.Supervisor.start_action(state[:sup_action], :respond, Enum.fetch!(trigger, 1), message, slack)

      false -> BotAction.Supervisor.start_action(state[:sup_action], :hear, hd(trigger), message, slack)
    end
  end

  def handle_mesage(_message, _slack, state) do
    { :ok , state }
  end
end
