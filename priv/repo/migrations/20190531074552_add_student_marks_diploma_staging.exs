defmodule SarthakAdmission.Repo.Migrations.AddStudentMarksDiplomaStaging do
  use Ecto.Migration

  def change do
    create table(:student_marks_diploma_staging, primary_key: false) do
      add :subject_code, :string
      add :marks, :float

      add :token_no,
          references(:student_staging, on_delete: :delete_all, type: :uuid, column: :token_no)

      timestamps()
    end

    create unique_index(:student_marks_diploma_staging, [:subject_code, :token_no])
    create index(:student_marks_diploma_staging, [:token_no])
  end
end
