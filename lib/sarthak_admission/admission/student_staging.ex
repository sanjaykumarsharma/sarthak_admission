defmodule SarthakAdmission.Admission.StudentStaging do
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

    field(:category, :string, virtual: true)
    field(:center_address, :string, virtual: true)
    field(:center_name, :string, virtual: true)
    field(:ebc, :boolean, default: false, virtual: true)
    field(:enrolment_no, :string, virtual: true)
    field(:exam, :string, virtual: true)
    field(:gate_rank, :integer, virtual: true)
    field(:gate_valid_upto, :string, virtual: true)
    field(:mq, :boolean, default: false, virtual: true)
    field(:rank, :integer, virtual: true)
    field(:tfw_rank, :integer, null: true, virtual: true)

    field(:blood_group, :string, virtual: true)
    field(:c_address, :string, virtual: true)
    field(:c_city, :string, virtual: true)
    field(:c_dist, :string, virtual: true)
    field(:c_land_phone, :string, virtual: true)
    field(:c_pin, :string, virtual: true)
    field(:c_state, :string, virtual: true)
    field(:dob, :date, virtual: true)
    field(:email, :string, virtual: true)
    field(:identification_marks, :string, virtual: true)
    field(:marital_status, :string, virtual: true)
    field(:mobile, :string, virtual: true)
    field(:mother_tongue, :string, virtual: true)
    field(:nationality, :string, virtual: true)
    field(:other_languages, :string, virtual: true)
    field(:p_address, :string, virtual: true)
    field(:p_city, :string, virtual: true)
    field(:p_district, :string, virtual: true)
    field(:p_land_phone, :string, virtual: true)
    field(:p_pin, :string, virtual: true)
    field(:p_state, :string, virtual: true)
    field(:passport_expiry, :string, virtual: true)
    field(:passport_no, :string, virtual: true)
    field(:religion, :string, virtual: true)

    timestamps()
  end

  @doc false
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
      :category,
      :center_address,
      :center_name,
      :ebc,
      :enrolment_no,
      :exam,
      :gate_rank,
      :gate_valid_upto,
      :mq,
      :rank,
      :tfw_rank,
      :token_no,
      :dob,
      :blood_group,
      :email,
      :mobile,
      :p_address,
      :p_city,
      :p_district,
      :p_state,
      :p_pin,
      :p_land_phone,
      :c_address,
      :c_city,
      :c_dist,
      :c_state,
      :c_pin,
      :c_land_phone,
      :identification_marks,
      :nationality,
      :religion,
      :marital_status,
      :mother_tongue,
      :other_languages,
      :passport_no,
      :passport_expiry
    ])
    |> validate_required([
      :name,
      :sex,
      :quota,
      :category,
      :center_address,
      :center_name,
      :enrolment_no,
      :rank,
      :ebc,
      :exam,
      :dob,
      :p_address,
      :nationality,
      :religion,
      :marital_status,
      :p_address,
      :p_city,
      :p_state,
      :p_pin,
      :c_address,
      :c_city,
      :c_state,
      :c_pin
    ])
  end

  def student_staging_changeset(student_staging, attrs) do
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
      :form_completed
    ])
    |> validate_required([
      :name,
      :sex,
      :quota
    ])
  end
end
