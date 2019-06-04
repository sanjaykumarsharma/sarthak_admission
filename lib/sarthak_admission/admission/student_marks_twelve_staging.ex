defmodule SarthakAdmission.Admission.StudentMarksTwelveStaging do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_marks_twelve_staging" do
    field(:subject_code, :string)
    field(:marks, :float)

    timestamps()
  end

  @doc false

  def changeset(student_marks_twelve_staging, attrs) do
    student_marks_twelve_staging
    |> cast(attrs, [
      :token_no,
      :subject_code,
      :marks
    ])
    |> validate_required([
      :subject_code,
      :marks
    ])
    |> unique_constraint(:subject_code,
      name: :student_marks_twelve_staging_subject_code_token_no_index
    )
  end
end
