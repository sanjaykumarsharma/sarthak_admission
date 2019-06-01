defmodule SarthakAdmission.Admission.PageTwo do
  import Ecto.Query, warn: false
  alias SarthakAdmission.Repo

  alias Ecto.Multi

  alias SarthakAdmission.Admission.StudentStaging
  alias SarthakAdmission.Admission.StudentEntranceStaging
  alias SarthakAdmission.Admission.StudentPersonalDetailsStaging

  def change_page_two(%StudentStaging{} = student_entrance) do
    StudentStaging.changeset(student_entrance, %{})
  end

  def student_staging_changeset(attrs \\ %{}, token_no) do
    %StudentStaging{}
    |> StudentStaging.student_staging_changeset(attrs)
  end

  def create_page_two(
        student_staging,
        student_entrance_staging,
        student_personal_details_staging,
        token_no
      ) do
    multi =
      Multi.new()
      |> Multi.insert(
        :student_staging,
        StudentStaging.student_staging_changeset(%StudentStaging{}, student_staging)
      )
      |> Multi.insert(
        :student_entrance_staging,
        StudentEntranceStaging.student_entrance_staging_changeset(
          %StudentEntranceStaging{},
          student_entrance_staging
        )
      )
      |> Multi.insert(
        :student_personal_details_staging,
        StudentPersonalDetailsStaging.student_personal_details_staging_changeset(
          %StudentPersonalDetailsStaging{},
          student_personal_details_staging
        )
      )

    Repo.transaction(multi)
  end

  def create_page_two_test(attrs, token_no) do
    %StudentStaging{}
    |> StudentStaging.changeset(attrs)
    |> Ecto.Changeset.put_change(:token_no, token_no)
    |> Repo.insert()
  end
end
