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

    assert Cube.row(cube, :up, 2) == ~w[R R R]
    assert Cube.col(cube, :left, 1) == ~w[W W W]

    assert Cube.cell(cube, :back, 2, 2) == "Y"
  end

  test "Rotate: L (left clockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "L")

    assert Cube.face(cube, :up) == ~w[Y R R Y R R Y R R]
    assert Cube.face(cube, :front) == ~w[R B B R B B R B B]
    assert Cube.face(cube, :back) == ~w[Y Y O Y Y O Y Y O]
    assert Cube.face(cube, :left) == ~w[W W W W W W W W W]
    assert Cube.face(cube, :right) == ~w[G G G G G G G G G]
    assert Cube.face(cube, :down) == ~w[B O O B O O B O O]
  end

  test "Rotate: L' (left counterclockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "L'")

    assert Cube.face(cube, :up) == ~w[B R R B R R B R R]
    assert Cube.face(cube, :front) == ~w[O B B O B B O B B]
    assert Cube.face(cube, :back) == ~w[Y Y R Y Y R Y Y R]
    assert Cube.face(cube, :left) == ~w[W W W W W W W W W]
    assert Cube.face(cube, :right) == ~w[G G G G G G G G G]
    assert Cube.face(cube, :down) == ~w[Y O O Y O O Y O O]
  end

  test "Rotate: R (right clockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "R")

    assert Cube.face(cube, :up) == ~w[R R B R R B R R B]
    assert Cube.face(cube, :front) == ~w[B B O B B O B B O]
    assert Cube.face(cube, :back) == ~w[R Y Y R Y Y R Y Y]
    assert Cube.face(cube, :left) == ~w[W W W W W W W W W]
    assert Cube.face(cube, :right) == ~w[G G G G G G G G G]
    assert Cube.face(cube, :down) == ~w[O O Y O O Y O O Y]
  end

  test "Rotate: R' (right counterclockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "R'")

    assert Cube.face(cube, :up) == ~w[R R Y R R Y R R Y]
    assert Cube.face(cube, :front) == ~w[B B R B B R B B R]
    assert Cube.face(cube, :back) == ~w[O Y Y O Y Y O Y Y]
    assert Cube.face(cube, :left) == ~w[W W W W W W W W W]
    assert Cube.face(cube, :right) == ~w[G G G G G G G G G]
    assert Cube.face(cube, :down) == ~w[O O B O O B O O B]
  end

  test "Rotate: U (up clockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "U")

    assert Cube.face(cube, :up) == ~w[R R R R R R R R R]
    assert Cube.face(cube, :front) == ~w[G G G B B B B B B B]
    assert Cube.face(cube, :back) == ~w[W W W Y Y Y Y Y Y]
    assert Cube.face(cube, :left) == ~w[B B B W W W W W W]
    assert Cube.face(cube, :right) == ~w[Y Y Y G G G G G G]
    assert Cube.face(cube, :down) == ~w[O O O O O O O O O]
  end

  test "Rotate: U' (up counterclockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "U'")

    assert Cube.face(cube, :up) == ~w[R R R R R R R R R]
    assert Cube.face(cube, :front) == ~w[W W W B B B B B B]
    assert Cube.face(cube, :back) == ~w[G G G Y Y Y Y Y Y]
    assert Cube.face(cube, :left) == ~w[Y Y Y W W W W W W]
    assert Cube.face(cube, :right) == ~w[B B B G G G G G G]
    assert Cube.face(cube, :down) == ~w[O O O O O O O O O]
  end

  test "Rotate: D (down clockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "D")

    assert Cube.face(cube, :up) == ~w[R R R R R R R R R]
    assert Cube.face(cube, :front) == ~w[B B B B B B W W W]
    assert Cube.face(cube, :back) == ~w[Y Y Y Y Y Y G G G]
    assert Cube.face(cube, :left) == ~w[W W W W W W Y Y Y]
    assert Cube.face(cube, :right) == ~w[G G G G G G B B B]
    assert Cube.face(cube, :down) == ~w[O O O O O O O O O]
  end

  test "Rotate: D' (down counterclockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "D'")

    assert Cube.face(cube, :up) == ~w[R R R R R R R R R]
    assert Cube.face(cube, :front) == ~w[B B B B B B G G G]
    assert Cube.face(cube, :back) == ~w[Y Y Y Y Y Y W W W]
    assert Cube.face(cube, :left) == ~w[W W W W W W B B B]
    assert Cube.face(cube, :right) == ~w[G G G G G G Y Y Y]
    assert Cube.face(cube, :down) == ~w[O O O O O O O O O]
  end

  test "Rotate: F (front clockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "F")

    assert Cube.face(cube, :up) == ~w[R R R R R R W W W]
    assert Cube.face(cube, :front) == ~w[B B B B B B B B B]
    assert Cube.face(cube, :back) == ~w[Y Y Y Y Y Y Y Y Y]
    assert Cube.face(cube, :left) == ~w[W W O W W O W W O]
    assert Cube.face(cube, :right) == ~w[R G G R G G R G G]
    assert Cube.face(cube, :down) == ~w[G G G O O O O O O]
  end

  test "Rotate: F' (front counterclockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "F'")

    assert Cube.face(cube, :up) == ~w[R R R R R R G G G]
    assert Cube.face(cube, :front) == ~w[B B B B B B B B B]
    assert Cube.face(cube, :back) == ~w[Y Y Y Y Y Y Y Y Y]
    assert Cube.face(cube, :left) == ~w[W W R W W R W W R]
    assert Cube.face(cube, :right) == ~w[O G G O G G O G G]
    assert Cube.face(cube, :down) == ~w[W W W O O O O O O]
  end

  test "Rotate: B (back clockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "B")

    assert Cube.face(cube, :up) == ~w[G G G R R R R R R]
    assert Cube.face(cube, :front) == ~w[B B B B B B B B B]
    assert Cube.face(cube, :back) == ~w[Y Y Y Y Y Y Y Y Y]
    assert Cube.face(cube, :left) == ~w[R W W R W W R W W]
    assert Cube.face(cube, :right) == ~w[G G O G G O G G O]
    assert Cube.face(cube, :down) == ~w[O O O O O O W W W]
  end

  test "Rotate: B' (back counterclockwise)" do
    cube = Cube.new()

    cube = Cube.rotate(cube, "B'")

    assert Cube.face(cube, :up) == ~w[W W W R R R R R R]
    assert Cube.face(cube, :front) == ~w[B B B B B B B B B]
    assert Cube.face(cube, :back) == ~w[Y Y Y Y Y Y Y Y Y]
    assert Cube.face(cube, :left) == ~w[O W W O W W O W W]
    assert Cube.face(cube, :right) == ~w[G G R G G R G G R]
    assert Cube.face(cube, :down) == ~w[O O O O O O G G G]
  end
end
