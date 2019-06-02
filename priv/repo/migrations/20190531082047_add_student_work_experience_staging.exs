defmodule SarthakAdmission.Repo.Migrations.AddStudentWorkExperienceStaging do
  use Ecto.Migration

  def change do
    create table(:student_work_experience_staging, primary_key: false) do
      add :sponsored, :boolean, null: true
      add :company_name, :string, null: true
      add :company_address, :string, null: true
      add :company_city, :string, null: true
      add :company_state, :string, null: true
      add :company_pin, :string, null: true
      add :designation, :string, null: true
      add :nature_of_work, :string, null: true
      add :doj, :string, null: true
      add :dol, :string, null: true
      add :total_experience, :string, null: true
      add :salary, :float, null: true

      add :token_no,
          references(:student_staging, on_delete: :delete_all, type: :uuid, column: :token_no)

      timestamps()
    end

    create unique_index(:student_work_experience_staging, [:token_no])
  end
end
