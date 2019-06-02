defmodule SarthakAdmission.Repo.Migrations.AddStudentPersonalDetailsStaging do
  use Ecto.Migration

  def change do
    create table(:student_personal_details_staging, primary_key: false) do
      add :blood_group, :string, null: true, default: nil
      add :c_address, :string
      add :c_city, :string
      add :c_dist, :string, null: true, default: nil
      add :c_land_phone, :string, null: true, default: nil
      add :c_pin, :string
      add :c_ps, :string
      add :c_state, :string
      add :dob, :date
      add :email, :string, null: true, default: nil
      add :identification_marks, :string, null: true, default: nil
      add :marital_status, :string
      add :mobile, :string
      add :mother_tongue, :string, null: true, default: nil
      add :nationality, :string
      add :other_languages, :string, null: true, default: nil
      add :p_address, :string
      add :p_city, :string
      add :p_district, :string, null: true, default: nil
      add :p_land_phone, :string, null: true, default: nil
      add :p_pin, :string
      add :p_ps, :string
      add :p_state, :string
      add :passport_expiry, :string, null: true, default: nil
      add :passport_no, :string, null: true, default: nil
      add :religion, :string

      add :token_no,
          references(:student_staging, on_delete: :delete_all, type: :uuid, column: :token_no)

      timestamps()
    end

    create unique_index(:student_personal_details_staging, [:token_no])
  end
end
