defmodule SarthakAdmission.Repo.Migrations.AddStudentFamilyDetailsStaging do
  use Ecto.Migration

  def change do
    create table(:student_family_details_staging, primary_key: false) do
      add :m_annual_income, :float
      add :m_e_city, :string, null: true, default: nil
      add :m_e_state, :string, null: true, default: nil
      add :m_designation, :string, null: true, default: nil
      add :f_email, :string, null: true, default: nil
      add :m_name, :string
      add :lg_designation, :string, null: true, default: nil
      add :f_e_city, :string, null: true, default: nil
      add :m_organization, :string, null: true, default: nil
      add :m_department, :string, null: true, default: nil
      add :father_pan_card, :string, null: true, default: nil
      add :lg_city, :string, null: true, default: nil
      add :f_department, :string, null: true, default: nil
      add :lg_department, :string, null: true, default: nil
      add :m_e_type, :string, null: true, default: nil
      add :m_e_address, :string, null: true, default: nil
      add :hostel_required, :boolean, default: false
      add :lg_relation, :string, null: true, default: nil
      add :m_e_land_phone, :string, null: true, default: nil
      add :annual_family_income, :float
      add :f_mobile, :string, null: true, default: nil
      add :f_annual_income, :float
      add :mother_pan_card, :string, null: true, default: nil
      add :guardian_pan_card, :string, null: true, default: nil
      add :lg_address, :string, null: true, default: nil
      add :lg_name, :string, null: true, default: nil
      add :lg_organization, :string, null: true, default: nil
      add :f_e_type, :string, null: true, default: nil
      add :f_designation, :string, null: true, default: nil
      add :f_e_address, :string, null: true, default: nil
      add :student_pan_card, :string, null: true, default: nil
      add :f_e_pin, :string, null: true, default: nil
      add :f_occupation, :string, null: true, default: nil
      add :m_e_pin, :string, null: true, default: nil
      add :lg_email, :string, null: true, default: nil
      add :f_e_land_phone, :string, null: true, default: nil
      add :f_name, :string
      add :f_e_state, :string, null: true, default: nil
      add :lg_state, :string, null: true, default: nil
      add :lg_pin, :string, null: true, default: nil
      add :lg_occupation, :string, null: true, default: nil
      add :student_acn, :string, null: true, default: nil
      add :fee_payee, :string, null: true, default: nil
      add :m_email, :string, null: true, default: nil
      add :mother_acn, :string, null: true, default: nil
      add :m_occupation, :string, null: true, default: nil
      add :father_acn, :string, null: true, default: nil
      add :lg_mobile, :string, null: true, default: nil
      add :m_mobile, :string, null: true, default: nil
      add :guardian_acn, :string, null: true, default: nil
      add :lg_land_phone, :string, null: true, default: nil
      add :f_organization, :string, null: true, default: nil

      add :token_no,
          references(:student_staging, on_delete: :delete_all, type: :uuid, column: :token_no)

      timestamps()
    end

    create unique_index(:student_family_details_staging, [:token_no])
  end
end
