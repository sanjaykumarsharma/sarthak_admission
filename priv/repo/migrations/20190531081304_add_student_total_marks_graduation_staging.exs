defmodule SarthakAdmission.Repo.Migrations.AddStudentTotalMarksGraduationStaging do
  use Ecto.Migration

  def change do
    create table(:student_total_marks_graduation_staging, primary_key: false) do
      add :course, :string, null: true, default: nil
      add :degree, :string, null: true, default: nil
      add :institute, :string, null: true, default: nil
      add :percentage, :float, null: true
      add :university, :string, null: true, default: nil
      add :yoa, :integer, null: true
      add :yop, :integer, null: true

      add :token_no,
          references(:student_staging, on_delete: :delete_all, type: :uuid, column: :token_no)

      timestamps()
    end

    create unique_index(:student_total_marks_graduation_staging, [:token_no])
  end
end
