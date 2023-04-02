defmodule Rubix.Cube do
  alias Rubix.Cube.Rotations
  defdelegate rotate(cube, rotation), to: Rotations
  defdelegate rotations(), to: Rotations

  defstruct [
    cells: %{
      {:up, 1, 1} => "R",  {:up, 1, 2} => "R",  {:up, 1, 3} => "R", 
      {:up, 2, 1} => "R",  {:up, 2, 2} => "R",  {:up, 2, 3} => "R", 
      {:up, 3, 1} => "R",  {:up, 3, 2} => "R",  {:up, 3, 3} => "R",
      {:front, 1, 1} => "B",  {:front, 1, 2} => "B",  {:front, 1, 3} => "B", 
      {:front, 2, 1} => "B",  {:front, 2, 2} => "B",  {:front, 2, 3} => "B", 
      {:front, 3, 1} => "B",  {:front, 3, 2} => "B",  {:front, 3, 3} => "B",
      {:back, 1, 1} => "Y",  {:back, 1, 2} => "Y",  {:back, 1, 3} => "Y", 
      {:back, 2, 1} => "Y",  {:back, 2, 2} => "Y",  {:back, 2, 3} => "Y", 
      {:back, 3, 1} => "Y",  {:back, 3, 2} => "Y",  {:back, 3, 3} => "Y",
      {:left, 1, 1} => "W",  {:left, 1, 2} => "W",  {:left, 1, 3} => "W", 
      {:left, 2, 1} => "W",  {:left, 2, 2} => "W",  {:left, 2, 3} => "W", 
      {:left, 3, 1} => "W",  {:left, 3, 2} => "W",  {:left, 3, 3} => "W",
      {:right, 1, 1} => "G",  {:right, 1, 2} => "G",  {:right, 1, 3} => "G", 
      {:right, 2, 1} => "G",  {:right, 2, 2} => "G",  {:right, 2, 3} => "G", 
      {:right, 3, 1} => "G",  {:right, 3, 2} => "G",  {:right, 3, 3} => "G",
      {:down, 1, 1} => "O",  {:down, 1, 2} => "O",  {:down, 1, 3} => "O", 
      {:down, 2, 1} => "O",  {:down, 2, 2} => "O",  {:down, 2, 3} => "O", 
      {:down, 3, 1} => "O",  {:down, 3, 2} => "O",  {:down, 3, 3} => "O"
    }
  ]

  def new, do: %__MODULE__{}

  def shuffle(n \\ 999) do
    for _ <- (1..n), reduce: new() do
      cube -> rotate(cube, Enum.random(rotations))
    end
  end

  def face(cube, face) do
    with cells <- cube.cells do
      [
        cell(cells, face, 1, 1), cell(cells, face, 1, 2), cell(cells, face, 1, 3),
        cell(cells, face, 2, 1), cell(cells, face, 2, 2), cell(cells, face, 2, 3),
        cell(cells, face, 3, 1), cell(cells, face, 3, 2), cell(cells, face, 3, 3)
      ]
    end
  end

  def row(cube, face, row) do
    with cells <- cube.cells do
      [cell(cells, face, row, 1), cell(cells, face, row, 2), cell(cells, face, row, 3)]
    end
  end

  def col(cube, face, col) do
    with cells <- cube.cells do
      [cell(cells, face, 1, col), cell(cells, face, 2, col), cell(cells, face, 3, col)]
    end
  end

  def cell(%__MODULE__{cells: cells}, face, row, col) do
    cell(cells, face, row, col)
  end

  def cell(cells, face, row, col) when is_map(cells) do
    Map.get(cells, {face, row, col})
  end
end
