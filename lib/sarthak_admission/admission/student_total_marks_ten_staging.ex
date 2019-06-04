defmodule SarthakAdmission.Admission.StudentTotalMarksTenStaging do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_total_marks_ten_staging" do
    field(:board, :string)
    field(:marks_obtained, :integer)
    field(:percentage, :float)
    field(:school, :string)
    field(:total_marks, :integer)
    field(:yop, :integer)

    timestamps()
  end

  @doc false

  def changeset(student_marks_ten_staging, attrs) do
    student_marks_ten_staging
    |> cast(attrs, [
      :token_no,
      :marks_obtained,
      :total_marks,
      :percentage,
      :yop,
      :board,
      :school
    ])
    |> validate_required([
      :percentage,
      :yop
    ])

    # |> unique_constraint([:token_no, :subject_code] , name:)
  end
end
