defmodule SarthakAdmission.Admission.StudentTotalMarksDiplomaStaging do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_total_marks_diploma_staging" do
    field(:course, :string)
    field(:institute, :string)
    field(:marks_obtained, :integer)
    field(:percentage, :float)
    field(:total_marks, :integer)
    field(:university, :string)
    field(:yop, :integer)

    timestamps()
  end

  @doc false

  def changeset(student_total_marks_diploma_staging, attrs) do
    student_total_marks_diploma_staging
    |> cast(attrs, [
      :token_no,
      :course,
      :institute,
      :marks_obtained,
      :percentage,
      :total_marks,
      :university,
      :yop
    ])

    # |> validate_required([
    #   :percentage,
    #   :yop
    # ])
  end
end
