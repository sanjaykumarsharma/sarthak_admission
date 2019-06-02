defmodule SarthakAdmission.Admission.StudentFamilyDetailsStaging do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_family_details_staging" do
    field(:m_annual_income, :float)
    field(:m_e_city, :string)
    field(:m_e_state, :string)
    field(:m_designation, :string)
    field(:f_email, :string)
    field(:m_name, :string)
    field(:lg_designation, :string)
    field(:f_e_city, :string)
    field(:m_organization, :string)
    field(:m_department, :string)
    field(:father_pan_card, :string)
    field(:lg_city, :string)
    field(:f_department, :string)
    field(:lg_department, :string)
    # field(:m_e_type, :string)
    field(:m_e_address, :string)
    field(:hostel_required, :boolean, default: false)
    field(:lg_relation, :string)
    field(:m_e_land_phone, :string)
    field(:annual_family_income, :float)
    field(:f_mobile, :string)
    field(:f_annual_income, :float)
    field(:mother_pan_card, :string)
    field(:guardian_pan_card, :string)
    field(:lg_address, :string)
    field(:lg_name, :string)
    field(:lg_organization, :string)
    # field(:f_e_type, :string)
    field(:f_designation, :string)
    field(:f_e_address, :string)
    field(:student_pan_card, :string)
    field(:f_e_pin, :string)
    field(:f_occupation, :string)
    field(:m_e_pin, :string)
    field(:lg_email, :string)
    field(:f_e_land_phone, :string)
    field(:f_name, :string)
    field(:f_e_state, :string)
    field(:lg_state, :string)
    field(:lg_pin, :string)
    field(:lg_occupation, :string)
    field(:student_acn, :string)
    field(:fee_payee, :string)
    field(:m_email, :string)
    field(:mother_acn, :string)
    field(:m_occupation, :string)
    field(:father_acn, :string)
    field(:lg_mobile, :string)
    field(:m_mobile, :string)
    field(:guardian_acn, :string)
    field(:lg_land_phone, :string)
    field(:f_organization, :string)
    field(:m_e_address_line_two, :string)
    field(:f_e_address_line_two, :string)
    field(:lg_e_address_line_two, :string)

    timestamps()
  end

  @doc false

  def changeset(student_family_details_staging, attrs) do
    student_family_details_staging
    |> cast(attrs, [
      :token_no,
      :f_name,
      :f_occupation,
      :f_organization,
      :f_designation,
      :f_department,
      :f_annual_income,
      :f_e_address,
      :f_e_city,
      :f_e_state,
      :f_e_pin,
      :f_email,
      :f_e_land_phone,
      :f_mobile,
      :m_name,
      :m_occupation,
      :m_organization,
      :m_designation,
      :m_department,
      :m_annual_income,
      :m_e_address,
      :m_e_city,
      :m_e_state,
      :m_e_pin,
      :m_email,
      :m_e_land_phone,
      :m_mobile,
      :annual_family_income,
      :lg_name,
      :lg_relation,
      :lg_occupation,
      :lg_organization,
      :lg_designation,
      :lg_department,
      :lg_address,
      :lg_city,
      :lg_state,
      :lg_pin,
      :lg_email,
      :lg_land_phone,
      :lg_mobile,
      :student_pan_card,
      :father_pan_card,
      :mother_pan_card,
      :guardian_pan_card,
      :student_acn,
      :father_acn,
      :mother_acn,
      :guardian_acn,
      :fee_payee,
      :hostel_required,
      :m_e_address_line_two,
      :f_e_address_line_two,
      :lg_e_address_line_two
    ])
    |> validate_required([
      :m_name,
      :f_name,
      :annual_family_income
    ])
  end
end
