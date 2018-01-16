defmodule Salieri do

  use Application

  def start(_type, _args) do
    Salieri.Supervisor.start_link
  end
end
