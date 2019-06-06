defmodule SarthakAdmission.Admission.Token do
  import Ecto.Query, warn: false
  alias SarthakAdmission.Repo

  alias SarthakAdmission.Admission.StudentStaging
  alias SarthakAdmission.Admission.StudentFamilyDetailsStaging
  alias SarthakAdmission.Admission.StudentFamilyDetailsStaging

  alias SarthakAdmission.Admission.StudentMarksTenStaging
  alias SarthakAdmission.Admission.StudentTotalMarksTenStaging

  # alias SarthakAdmission.Admission.StudentMarksTwelveStaging
  alias SarthakAdmission.Admission.StudentTotalMarksTwelveStaging

  alias SarthakAdmission.Admission.StudentTotalMarksDiplomaStaging
  alias SarthakAdmission.Admission.StudentTotalMarksGraduationStaging

  def is_form_complete(token_no) do
    Repo.one(
      from(a in StudentStaging,
        where: a.token_no == ^token_no and a.form_completed == true,
        select: count(a.token_no)
      )
    )
  end

  def is_page_one_complete(token_no) do
    Repo.one(
      from(a in StudentStaging,
        where: a.token_no == ^token_no,
        select: count(a.token_no)
      )
    )
  end

  def is_page_two_complete(token_no) do
    Repo.one(
      from(a in StudentFamilyDetailsStaging,
        where: a.token_no == ^token_no,
        select: count(a.token_no)
      )
    )
  end

  def is_page_secondary_complete(token_no) do
    Repo.one(
      from(a in StudentMarksTenStaging,
        where: a.token_no == ^token_no,
        select: count(a.token_no)
      )
    )
  end

  def is_page_secondary_total_complete(token_no) do
    Repo.one(
      from(a in StudentTotalMarksTenStaging,
        where: a.token_no == ^token_no,
        select: count(a.token_no)
      )
    )
  end

  def is_page_higher_secondary_total_complete(token_no) do
    Repo.one(
      from(a in StudentTotalMarksTwelveStaging,
        where: a.token_no == ^token_no,
        select: count(a.token_no)
      )
    )
  end

  def is_page_diploma_total_complete(token_no) do
    Repo.one(
      from(a in StudentTotalMarksDiplomaStaging,
        where: a.token_no == ^token_no,
        select: count(a.token_no)
      )
    )
  end

  def is_page_graduation_total_complete(token_no) do
    Repo.one(
      from(a in StudentTotalMarksGraduationStaging,
        where: a.token_no == ^token_no,
        select: count(a.token_no)
      )
    )
  end

  # def get_question(account_id) do
  #   if question != nil do
  #     {:ok, question}
  #   else
  #     nil
  #   end
  # end
end
