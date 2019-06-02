defmodule SarthakAdmission.Admission.PageThree do
  import Ecto.Query, warn: false
  alias SarthakAdmission.Repo

  alias Ecto.Multi

  alias SarthakAdmission.Admission.StudentStaging
  alias SarthakAdmission.Admission.StudentEntranceStaging
  alias SarthakAdmission.Admission.StudentPersonalDetailsStaging
  alias SarthakAdmission.Admission.StudentTotalMarksGraduationStaging
  alias SarthakAdmission.Admission.StudentWorkExStaging
  alias SarthakAdmission.Admission.StudentUndertakingStaging

  def change_page_three(%StudentTotalMarksGraduationStaging{} = student_total_marks_graduation) do
    StudentTotalMarksGraduationStaging.changeset(student_total_marks_graduation, %{})
  end

  def student_stagin_changeset(attrs \\ %{}, token_no) do
    %StudentTotalMarksGraduationStaging{}
    |> StudentTotalMarksGraduationStaging.changeset(attrs)
  end

  def create_page_three(
        student_total_marks_graduation_staging,
        student_work_ex_staging,
        student_undertaking_staging,
        token_no
      ) do
    multi =
      Multi.new()
      |> Multi.insert(
        :student_total_marks_graduation_staging,
        StudentTotalMarksGraduationStaging.student_total_marks_graduation_staging_changeset(
          %StudentTotalMarksGraduationStaging{},
          student_total_marks_graduation_staging
        )
      )
      |> Multi.insert(
        :student_work_experience_staging,
        StudentWorkExStaging.changeset(
          %StudentWorkExStaging{},
          student_work_ex_staging
        )
      )
      |> Multi.insert(
        :student_undertaking_staging,
        StudentUndertakingStaging.changeset(
          %StudentUndertakingStaging{},
          student_undertaking_staging
        )
      )

    Repo.transaction(multi)
  end

  def create_page_three_test(attrs, token_no) do
    %StudentTotalMarksGraduationStaging{}
    |> StudentTotalMarksGraduationStaging.changeset(attrs)
    |> Ecto.Changeset.put_change(:token_no, token_no)
    |> Repo.insert()
  end
end