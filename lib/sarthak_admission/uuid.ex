defmodule SarthakAdmission.Uuid do
  def get_uuid(token_no) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        uuid

      :error ->
        nil
    end
  end
end
