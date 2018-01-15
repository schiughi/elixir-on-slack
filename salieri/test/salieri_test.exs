defmodule SalieriTest do
  use ExUnit.Case
  doctest Salieri

  test "greets the world" do
    assert Salieri.hello() == :world
  end
end
