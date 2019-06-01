defmodule SarthakAdmission.Admission.StudentEntranceStaging do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:token_no, Ecto.UUID, read_after_writes: true}
  schema "student_entrance_staging" do
    field(:category, :string)
    field(:center_address, :string)
    field(:center_name, :string)
    field(:ebc, :boolean, default: false)
    field(:enrolment_no, :string)
    field(:exam, :string)
    field(:gate_rank, :integer)
    field(:gate_valid_upto, :string)
    field(:mq, :boolean, default: false)
    field(:rank, :integer)
    field(:tfw_rank, :integer)

    timestamps()
  end

  @doc false

  def student_entrance_staging_changeset(student_entrance_staging, attrs) do
    student_entrance_staging
    |> cast(attrs, [
      :token_no,
      :category,
      :center_address,
      :center_name,
      :ebc,
      :enrolment_no,
      :exam,
      :gate_rank,
      :gate_valid_upto,
      :mq,
      :rank,
      :tfw_rank
    ])
    |> validate_required([
      :category,
      :center_address,
      :center_name,
      :enrolment_no,
      :rank,
      :ebc,
      :exam
    ])
  end
end
