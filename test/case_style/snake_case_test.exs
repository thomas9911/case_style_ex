defmodule CaseStyle.SnakeCaseTest do
  use ExUnit.Case

  test "_ok_teSting_12" do
    input = "_ok_teSting_12"
    {:ok, casing} = CaseStyle.from_string(input, CaseStyle.SnakeCase)
    refute CaseStyle.SnakeCase.might_be?(input)
    assert "_ok_testing_12" = output = CaseStyle.SnakeCase.to_string(casing)
    assert CaseStyle.SnakeCase.might_be?(output)
  end

  Enum.each(
    [
      "testing123",
      "testing",
      "__testing__",
      "12341234",
      "test213_123",
      "1234_testing__"
    ],
    fn input ->
      @input input
      test "#{@input}" do
        {:ok, casing} = CaseStyle.from_string(@input, CaseStyle.SnakeCase)
        assert @input = output = CaseStyle.SnakeCase.to_string(casing)
        assert CaseStyle.SnakeCase.might_be?(output)
      end
    end
  )
end
