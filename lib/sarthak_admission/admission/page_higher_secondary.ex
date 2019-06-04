defmodule SarthakAdmission.Admission.PageHigherSecondary do
  import Ecto.Query, warn: false
  alias SarthakAdmission.Repo

  alias Ecto.Multi

  alias SarthakAdmission.Admission.StudentMarksTwelveStaging
  alias SarthakAdmission.Admission.StudentTotalMarksTwelveStaging

  def create_secondary(attrs, token_no) do
    %StudentMarksTwelveStaging{}
    |> StudentMarksTwelveStaging.changeset(attrs)
    |> Ecto.Changeset.put_change(:token_no, token_no)
    |> Repo.insert()
  end

  def read_higher_secondary_marks(token_no) do
    from(
      s in StudentMarksTwelveStaging,
      where: s.token_no == ^token_no
    )
    |> Repo.all()
  end

  def get_higher_secondary_marks!(token_no, subject_code) do
    from(
      s in StudentMarksTwelveStaging,
      where: s.token_no == ^token_no and s.subject_code == ^subject_code
    )
    |> Repo.one()
  end

  def delete_higher_secondary_marks(token_no, subject_code) do
    from(
      s in StudentMarksTwelveStaging,
      where: s.token_no == ^token_no and s.subject_code == ^subject_code
    )
    |> Repo.delete_all()
  end

  # def delete_higher_secondary_marks(%StudentMarksTwelveStaging{} = higher_secondary_marks) do
  #   Repo.delete(higher_secondary_marks)
  # end

  def create_secondary_total(attrs, token_no) do
    %StudentTotalMarksTwelveStaging{}
    |> StudentTotalMarksTwelveStaging.changeset(attrs)
    |> Ecto.Changeset.put_change(:token_no, token_no)
    |> Repo.insert()
  end

  # def update_page_two(%StudentMarksTwelveStaging{} = student_family_dtetails, attrs) do
  #   student_family_dtetails
  #   |> StudentMarksTwelveStaging.changeset(attrs)
  #   |> Repo.update()
  # end
end
