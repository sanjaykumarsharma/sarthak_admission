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
end
