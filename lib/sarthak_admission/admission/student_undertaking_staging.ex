defmodule SarthakAdmission.Admission.StudentUndertakingStaging do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_undertaking_staging" do
    field(:son_daughter_wife_of, :string)
    field(:residing_at, :string)
    field(:we_shri_smt, :string)
    field(:this_date_of, :string)
    field(:for_the_session, :string)

    timestamps()
  end

  @doc false

  def changeset(
        student_total_marks_graduation_staging,
        attrs
      ) do
    student_total_marks_graduation_staging
    |> cast(attrs, [
      :token_no,
      :son_daughter_wife_of,
      :residing_at,
      :we_shri_smt,
      :this_date_of,
      :for_the_session
    ])
    |> validate_required([
      :son_daughter_wife_of,
      :residing_at,
      :we_shri_smt,
      :this_date_of,
      :for_the_session
    ])
  end
end
