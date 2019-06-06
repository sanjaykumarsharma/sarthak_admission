defmodule SarthakAdmissionWeb.PageView do
  use SarthakAdmissionWeb, :view

  def hostal_required(param) do
    case param do
      true ->
        "Yes"

      false ->
        "No"
    end
  end

  def economically_backward(param) do
    case param do
      true ->
        "Yes"

      false ->
        "No"
    end
  end

  def student_permanent_address(p_address, p_ps, p_district) do
    p_address <> " " <> p_ps <> " " <> p_district
  end

  def student_communication_address(c_address, c_ps, c_dist) do
    c_address <> " " <> c_ps <> " " <> c_dist
  end
end
