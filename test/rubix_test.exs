defmodule RubixTest do
  use ExUnit.Case
  alias Rubix.Cube

  doctest Rubix

  test "generate a new Rubik cube (3x) and get faces (chars)" do
    cube = Cube.new()

    assert Cube.face(cube, :up) == ~w[R R R R R R R R R]
    assert Cube.face(cube, :front) == ~w[B B B B B B B B B]
    assert Cube.face(cube, :back) == ~w[Y Y Y Y Y Y Y Y Y]
    assert Cube.face(cube, :left) == ~w[W W W W W W W W W]
    assert Cube.face(cube, :right) == ~w[G G G G G G G G G]
    assert Cube.face(cube, :down) == ~w[O O O O O O O O O]
  end
end
