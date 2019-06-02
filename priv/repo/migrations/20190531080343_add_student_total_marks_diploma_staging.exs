defmodule SarthakAdmission.Repo.Migrations.AddStudentTotalMarksDiplomaStaging do
  use Ecto.Migration

  def change do
    create table(:student_total_marks_diploma_staging, primary_key: false) do
      add :course, :string, null: true, default: nil
      add :institute, :string, null: true, default: nil
      add :marks_obtained, :integer, null: true
      add :percentage, :float, null: true
      add :total_marks, :integer, null: true
      add :university, :string, null: true, default: nil
      add :yop, :integer, null: true

      add :token_no,
          references(:student_staging, on_delete: :delete_all, type: :uuid, column: :token_no)

      timestamps()
    end

    create unique_index(:student_total_marks_diploma_staging, [:token_no])
  end
end
