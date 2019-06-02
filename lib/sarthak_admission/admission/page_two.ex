defmodule SarthakAdmission.Admission.PageTwo do
  import Ecto.Query, warn: false
  alias SarthakAdmission.Repo

  alias Ecto.Multi

  alias SarthakAdmission.Admission.StudentStaging
  alias SarthakAdmission.Admission.StudentFamilyDetailsStaging

  def change_page_two(%StudentFamilyDetailsStaging{} = student_family_dtetails) do
    StudentFamilyDetailsStaging.changeset(student_family_dtetails, %{})
  end

  def create_page_two(attrs, token_no) do
    %StudentFamilyDetailsStaging{}
    |> StudentFamilyDetailsStaging.changeset(attrs)
    |> Ecto.Changeset.put_change(:token_no, token_no)
    |> Repo.insert()
  end
end
