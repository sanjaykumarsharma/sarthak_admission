defmodule SarthakAdmission.Repo.Migrations.AddStudentMarksTenStaging do
  use Ecto.Migration

  def change do
    create table(:student_marks_ten, primary_key: false) do
      add :subject_code, :string
      add :marks, :float
	  add :token_no, references(:student_staging, on_delete: :delete_all, type: :uuid, column: :token_no)


    timestamps()  
    end
    create unique_index(:student_marks_ten, [:token_no, :subject_code])
    create index(:student_marks_ten, [:token_no])
  end
end
