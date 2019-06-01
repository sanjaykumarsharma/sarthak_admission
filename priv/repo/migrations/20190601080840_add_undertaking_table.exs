defmodule SarthakAdmission.Repo.Migrations.AddUndertakingTable do
  use Ecto.Migration

  def change do
    create table(:student_undertaking_staging, primary_key: false) do
	  add :son_daughter_wife_of, :string
	  add :residing_at, :string
	  add :we_shri_smt, :string
	  add :this_date_of, :string
	  add :for_the_session, :string
	  add :token_no, references(:student_staging, on_delete: :delete_all, type: :uuid, column: :token_no)


    timestamps()  
    end
    create unique_index(:student_undertaking_staging, [:token_no])
  end
end






