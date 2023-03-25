defmodule RubixTest do
  use ExUnit.Case
  doctest Rubix

  test "greets the world" do
    assert Rubix.hello() == :world
  end
end
