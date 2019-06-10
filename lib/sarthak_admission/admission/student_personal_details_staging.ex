defmodule SarthakAdmission.Admission.StudentPersonalDetailsStaging do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_personal_details_staging" do
    field(:blood_group, :string)
    field(:c_address, :string)
    field(:c_city, :string)
    field(:c_dist, :string)
    field(:c_land_phone, :string)
    field(:c_pin, :string)
    field(:c_state, :string)
    field(:dob, :date)
    field(:email, :string)
    field(:identification_marks, :string)
    field(:marital_status, :string)
    field(:mobile, :string)
    field(:mother_tongue, :string)
    field(:nationality, :string)
    field(:other_languages, :string)
    field(:p_address, :string)
    field(:p_city, :string)
    field(:p_district, :string)
    field(:p_land_phone, :string)
    field(:p_pin, :string)
    field(:p_state, :string)
    field(:passport_expiry, :string)
    field(:passport_no, :string)
    field(:religion, :string)
    field(:p_po, :string)
    field(:c_po, :string)

    timestamps()
  end

  @doc false

  def student_personal_details_staging_changeset(student_personal_details_staging, attrs) do
    student_personal_details_staging
    |> cast(attrs, [
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
      :passport_expiry,
      :p_po,
      :c_po
    ])
    |> validate_required([
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
end
