defmodule SarthakAdmission.Repo.Migrations.AddStudentEntranceStaging do
  use Ecto.Migration

  def change do
    create table(:student_entrance_staging, primary_key: false) do
      add :category, :string
	  add :center_address, :string
	  add :center_name, :string
	  add :ebc, :boolean, default: false
	  add :enrolment_no, :string
	  add :exam, :string
	  add :gate_rank, :integer
	  add :gate_valid_upto, :string
	  add :mq, :boolean, default: false
	  add :rank, :integer
	  add :tfw_rank, :integer, null: true
	  add :token_no, references(:student_staging, on_delete: :delete_all, type: :uuid, column: :token_no)


    timestamps()  
    end
    create unique_index(:student_entrance_staging, [:token_no])
  end
end