defmodule SarthakAdmission.Admission.StudentMarksTenStaging do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_marks_ten_staging" do
    field(:subject_code, :string)
    field(:marks, :float)

    timestamps()
  end

  @doc false

  def changeset(student_marks_ten_staging, attrs) do
    student_marks_ten_staging
    |> cast(attrs, [
      :token_no,
      :subject_code,
      :marks
    ])
    |> validate_required([
      :subject_code,
      :marks
    ])

    # |> unique_constraint([:token_no, :subject_code] , name:)
  end
end
