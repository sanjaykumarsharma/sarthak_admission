defmodule SarthakAdmission.Admission.PageSecondary do
  import Ecto.Query, warn: false
  alias SarthakAdmission.Repo

  alias Ecto.Multi

  alias SarthakAdmission.Admission.StudentMarksTenStaging
  alias SarthakAdmission.Admission.StudentTotalMarksTenStaging

  def create_secondary(attrs, token_no) do
    %StudentMarksTenStaging{}
    |> StudentMarksTenStaging.changeset(attrs)
    |> Ecto.Changeset.put_change(:token_no, token_no)
    |> Repo.insert()
  end

  def read_secondary_marks(token_no) do
    from(
      s in StudentMarksTenStaging,
      where: s.token_no == ^token_no
    )
    |> Repo.all()
  end

  def get_secondary_marks!(token_no, subject_code) do
    from(
      s in StudentMarksTenStaging,
      where: s.token_no == ^token_no and s.subject_code == ^subject_code
    )
    |> Repo.one()
  end

  def delete_secondary_marks(token_no, subject_code) do
    from(
      s in StudentMarksTenStaging,
      where: s.token_no == ^token_no and s.subject_code == ^subject_code
    )
    |> Repo.delete_all()
  end

  # def delete_secondary_marks(%StudentMarksTenStaging{} = secondary_marks) do
  #   Repo.delete(secondary_marks)
  # end

  def create_secondary_total(attrs, token_no) do
    %StudentTotalMarksTenStaging{}
    |> StudentTotalMarksTenStaging.changeset(attrs)
    |> Ecto.Changeset.put_change(:token_no, token_no)
    |> Repo.insert()
  end

  # def update_page_two(%StudentMarksTenStaging{} = student_family_dtetails, attrs) do
  #   student_family_dtetails
  #   |> StudentMarksTenStaging.changeset(attrs)
  #   |> Repo.update()
  # end
end
