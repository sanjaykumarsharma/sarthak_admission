defmodule SarthakAdmission.Admission.StudentStagingRead do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_staging" do
    field(:admission_date, :date)
    field(:yop, :integer)
    field(:name, :string)
    field(:quota, :string)
    field(:sex, :string)
    field(:status, :string)
    field(:course_id, :string)
    field(:department_id, :string)
    field(:form_completed, :boolean)
    field(:hostel_required, :boolean)
    field(:fee_payee, :string)
    field(:student_pan_card, :string)
    field(:student_acn, :string)
    timestamps()
  end

  def changeset(student_staging, attrs) do
    student_staging
    |> cast(attrs, [
      :token_no,
      :admission_date,
      :yop,
      :name,
      :quota,
      :sex,
      :status,
      :course_id,
      :department_id,
      :form_completed,
      :hostel_required,
      :fee_payee,
      :student_pan_card,
      :student_acn
    ])
  end
end
