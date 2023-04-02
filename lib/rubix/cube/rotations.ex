defmodule Rubix.Cube.Rotations do
  require Logger

  @rotation_matrix %{
    "L" => %{
      {:up, 1, 1} => {:front, 1, 1}, {:up, 2, 1} => {:front, 2, 1}, {:up, 3, 1} => {:front, 3, 1},
      {:front, 1, 1} => {:down, 1, 1}, {:front, 2, 1} => {:down, 2, 1}, {:front, 3, 1} => {:down, 3, 1},
      {:back, 1, 3} => {:up, 3, 1}, {:back, 2, 3} => {:up, 2, 1}, {:back, 3, 3} => {:up, 1, 1},
      {:down, 1, 1} => {:back, 3, 3}, {:down, 2, 1} => {:back, 2, 3}, {:down, 3, 1} => {:back, 1, 3}
    }
  }
  @rotations Map.keys(@rotation_matrix)

  def rotate(cube, rotation) when rotation in @rotations do
    cells = for {source, destination} <- get_rotation(rotation), reduce: cube.cells do
      result -> copy_cell(cube.cells, result, {source, destination})
    end
    %{cube | cells: cells}
  end

  def rotate(cube, unknown_rotation) do
    raise "Undefined rotation [#{unknown_rotation}]"
    cube
  end

  defp copy_cell(source, destination, {from, to}) do
    with origin_cell <- Map.get(source, from) do
      Logger.debug("New cell #{origin_cell} [to #{inspect to} from #{inspect from}]")
      Map.put(destination, to, origin_cell)
    end
  end

  defp get_rotation(rotation), do: Map.get(@rotation_matrix, rotation)
end