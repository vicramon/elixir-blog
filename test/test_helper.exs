Dynamo.under_test(Blog.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Blog.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
