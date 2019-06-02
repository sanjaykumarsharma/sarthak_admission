defmodule SarthakAdmission.Admission.StudentTotalMarksGraduationStaging do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_total_marks_graduation_staging" do
    field(:course, :string)
    field(:degree, :string)
    field(:institute, :string)
    field(:percentage, :float)
    field(:university, :string)
    field(:yoa, :integer)
    field(:yop, :integer)

    field(:course_graduation, :string, virtual: true)
    field(:degree_graduation, :string, virtual: true)
    field(:institute_graduation, :string, virtual: true)
    field(:percentage_graduation, :float, virtual: true)
    field(:university_graduation, :string, virtual: true)
    field(:yoa_graduation, :integer, virtual: true)
    field(:yop_graduation, :integer, virtual: true)

    field(:sponsored, :boolean, virtual: true)
    field(:company_name, :string, virtual: true)
    field(:company_address, :string, virtual: true)
    field(:company_city, :string, virtual: true)
    field(:company_state, :string, virtual: true)
    field(:company_pin, :string, virtual: true)
    field(:designation, :string, virtual: true)
    field(:nature_of_work, :string, virtual: true)
    field(:doj, :string, virtual: true)
    field(:dol, :string, virtual: true)
    field(:total_experience, :string, virtual: true)
    field(:salary, :float, virtual: true)

    field(:son_daughter_wife_of, :string, virtual: true)
    field(:residing_at, :string, virtual: true)
    field(:we_shri_smt, :string, virtual: true)
    field(:this_date_of, :string, virtual: true)
    field(:for_the_session, :string, virtual: true)

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
      :course_graduation,
      :degree_graduation,
      :institute_graduation,
      :percentage_graduation,
      :university_graduation,
      :yoa_graduation,
      :yop_graduation,
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
      :salary,
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

  def student_total_marks_graduation_staging_changeset(
        student_total_marks_graduation_staging,
        attrs
      ) do
    student_total_marks_graduation_staging
    |> cast(attrs, [
      :token_no,
      :course,
      :degree,
      :institute,
      :percentage,
      :university,
      :yoa,
      :yop
    ])
  end
end
