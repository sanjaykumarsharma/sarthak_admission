defmodule SarthakAdmission.Admission.Print do
  import Ecto.Query, warn: false
  alias SarthakAdmission.Repo

  alias Ecto.Multi

  alias SarthakAdmission.Admission.StudentStagingRead
  alias SarthakAdmission.Admission.StudentEntranceStaging
  alias SarthakAdmission.Admission.StudentPersonalDetailsStaging

  alias SarthakAdmission.Admission.StudentFamilyDetailsStaging

  alias SarthakAdmission.Admission.StudentTotalMarksGraduationStaging
  alias SarthakAdmission.Admission.StudentWorkExStaging
  alias SarthakAdmission.Admission.StudentUndertakingStaging

  def read_student_staging(token_no) do
    Repo.get(StudentStagingRead, token_no)
  end

  def read_student_staging_details(token_no) do
    Repo.get(StudentStaging, token_no)
  end

  def read_student_entrance_staging(token_no) do
    Repo.get(StudentEntranceStaging, token_no)
  end

  def read_student_personal_details_staging(token_no) do
    Repo.get(StudentPersonalDetailsStaging, token_no)
  end

  def read_student_family_details_staging(token_no) do
    Repo.get(StudentFamilyDetailsStaging, token_no)
  end

  def read_student_undertaking_staging(token_no) do
    Repo.get(StudentUndertakingStaging, token_no)
  end
end
