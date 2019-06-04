defmodule SarthakAdmission.Admission.PageDiploma do
  import Ecto.Query, warn: false
  alias SarthakAdmission.Repo

  alias Ecto.Multi

  alias SarthakAdmission.Admission.StudentMarksDiplomaStaging
  alias SarthakAdmission.Admission.StudentTotalMarksDiplomaStaging

  def create_diploma(attrs, token_no) do
    %StudentMarksDiplomaStaging{}
    |> StudentMarksDiplomaStaging.changeset(attrs)
    |> Ecto.Changeset.put_change(:token_no, token_no)
    |> Repo.insert()
  end

  def read_diploma_marks(token_no) do
    from(
      s in StudentMarksDiplomaStaging,
      where: s.token_no == ^token_no
    )
    |> Repo.all()
  end

  def get_diploma_marks!(token_no, subject_code) do
    from(
      s in StudentMarksDiplomaStaging,
      where: s.token_no == ^token_no and s.subject_code == ^subject_code
    )
    |> Repo.one()
  end

  def delete_diploma_marks(token_no, subject_code) do
    from(
      s in StudentMarksDiplomaStaging,
      where: s.token_no == ^token_no and s.subject_code == ^subject_code
    )
    |> Repo.delete_all()
  end

  # def delete_diploma_marks(%StudentMarksDiplomaStaging{} = diploma_marks) do
  #   Repo.delete(diploma_marks)
  # end

  def create_diploma_total(attrs, token_no) do
    %StudentTotalMarksDiplomaStaging{}
    |> StudentTotalMarksDiplomaStaging.changeset(attrs)
    |> Ecto.Changeset.put_change(:token_no, token_no)
    |> Repo.insert()
  end

  # def update_page_two(%StudentMarksDiplomaStaging{} = student_family_dtetails, attrs) do
  #   student_family_dtetails
  #   |> StudentMarksDiplomaStaging.changeset(attrs)
  #   |> Repo.update()
  # end
end
