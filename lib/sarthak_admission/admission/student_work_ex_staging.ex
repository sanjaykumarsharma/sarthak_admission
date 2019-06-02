defmodule SarthakAdmission.Admission.StudentWorkExStaging do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_work_experience_staging" do
    field(:sponsored, :boolean)
    field(:company_name, :string)
    field(:company_address, :string)
    field(:company_city, :string)
    field(:company_state, :string)
    field(:company_pin, :string)
    field(:designation, :string)
    field(:nature_of_work, :string)
    field(:doj, :string)
    field(:dol, :string)
    field(:total_experience, :string)
    field(:salary, :float)

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
      :sponsored,
      :company_name,
      :company_address,
      :company_city,
      :company_state,
      :company_pin,
      :designation,
      :nature_of_work,
      :doj,
      :dol,
      :total_experience,
      :salary
    ])
  end
end
