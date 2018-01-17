defmodule BotAction.Action do
  def hear("hear", message, slack) do
    send_message("I can hear", message.channel, slack)
  end

  def hear(_, _, _) do
  end

  def respond("respond?", message, slack) do
    send_message("I can respond", message.channel, slack)
  end

  def respond(_, _, _) do
  end

  defp send_message(text, channel, slack) do
    Slack.send_message(text, channel, slack)
  end
end
