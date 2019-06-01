defmodule SarthakAdmission.Repo.Migrations.AddStudentTotalMarksTenStaging do
  use Ecto.Migration

  def change do
    create table(:student_total_marks_ten, primary_key: false) do
	    add :board, :string, null: true, default: nil
	    add :marks_obtained, :integer, null: true
	    add :percentage, :float, null: true
	    add :school, :string, null: true, default: nil
	    add :total_marks, :integer, null: true
	    add :yop, :integer, null: true
	    add :token_no, references(:student_staging, on_delete: :delete_all, type: :uuid, column: :token_no)


    timestamps()  
    end
    create unique_index(:student_total_marks_ten, [:token_no])
  end
end
