defmodule MathTest do
  use Assertion

  test "integers can be added and subtracted" do
    assert 1 + 1 == 2
    assert 2 + 3 == 5
    assert 5 - 5 == 10
  end

  test "integers can be multiplied and divided" do
    assert 1 * 1 == 1
    assert 2 * 3 == 8
    assert 10 / 2 == 5
  end
end
