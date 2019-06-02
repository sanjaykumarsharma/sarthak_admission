defmodule SarthakAdmission.Repo.Migrations.AddStudentStaging do
  use Ecto.Migration

  def change do
    create table(:student_staging, primary_key: false) do
      add :token_no, :uuid, primary_key: true
      add :admission_date, :date
      add :yop, :integer
      add :name, :string
      add :quota, :string
      add :sex, :string
      add :status, :string
      add :course_id, :string
      add :department_id, :string
      add :form_completed, :boolean, default: false
      add :hostel_required, :boolean, default: false
      add :fee_payee, :string, null: true, default: nil
      add :student_pan_card, :string, null: true, default: nil
      add :student_acn, :string, null: true, default: nil

      timestamps()
    end

    create index(:student_staging, [:yop])
    create index(:student_staging, [:course_id])
    create index(:student_staging, [:department_id])
  end
end
