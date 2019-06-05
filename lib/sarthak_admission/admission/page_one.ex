defmodule SarthakAdmission.Admission.PageOne do
  import Ecto.Query, warn: false
  alias SarthakAdmission.Repo

  alias Ecto.Multi

  alias SarthakAdmission.Admission.StudentStaging
  alias SarthakAdmission.Admission.StudentStagingRead
  alias SarthakAdmission.Admission.StudentEntranceStaging
  alias SarthakAdmission.Admission.StudentPersonalDetailsStaging

  def change_page_one(%StudentStaging{} = student_entrance) do
    StudentStaging.changeset(student_entrance, %{})
  end

  def student_staging_changeset(attrs \\ %{}, token_no) do
    %StudentStaging{}
    |> StudentStaging.student_staging_changeset(attrs)
  end

  def create_page_one(
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

  def create_page_one_test(attrs, token_no) do
    %StudentStaging{}
    |> StudentStaging.changeset(attrs)
    |> Ecto.Changeset.put_change(:token_no, token_no)
    |> Repo.insert()
  end

  def read_page_one(token_no) do
    from(
      s in StudentStagingRead,
      join: se in StudentEntranceStaging,
      on: s.token_no == se.token_no,
      join: spd in StudentPersonalDetailsStaging,
      on: s.token_no == spd.token_no,
      where: s.token_no == ^token_no,
      select: %{
        "yop" => s.yop,
        "name" => s.name,
        "quota" => s.quota,
        "sex" => s.sex,
        "course_id" => s.course_id,
        "department_id" => s.department_id,
        "token_no" => s.token_no,
        "hostel_required" => s.hostel_required,
        "fee_payee" => s.fee_payee,
        "student_pan_card" => s.student_pan_card,
        "student_acn" => s.student_acn,
        "category" => se.category,
        "center_address" => se.center_address,
        "center_name" => se.center_name,
        "ebc" => se.ebc,
        "enrolment_no" => se.enrolment_no,
        "exam" => se.exam,
        "rank" => se.rank,
        "gate_rank" => se.gate_rank,
        "tfw_rank" => se.tfw_rank,
        "blood_group" => spd.blood_group,
        "c_address" => spd.c_address,
        "c_city" => spd.c_city,
        "c_dist" => spd.c_dist,
        "c_land_phone" => spd.c_land_phone,
        "c_pin" => spd.c_pin,
        "c_state" => spd.c_state,
        "dob" => spd.dob,
        "email" => spd.email,
        "identification_marks" => spd.identification_marks,
        "marital_status" => spd.marital_status,
        "mobile" => spd.mobile,
        "mother_tongue" => spd.mother_tongue,
        "nationality" => spd.nationality,
        "other_languages" => spd.other_languages,
        "p_address" => spd.p_address,
        "p_city" => spd.p_city,
        "p_district" => spd.p_district,
        "p_land_phone" => spd.p_land_phone,
        "p_pin" => spd.p_pin,
        "p_state" => spd.p_state,
        "passport_expiry" => spd.passport_expiry,
        "passport_no" => spd.passport_no,
        "religion" => spd.religion,
        "p_ps" => spd.p_ps,
        "c_ps" => spd.c_ps
      }
    )
    |> Repo.one()
  end

  def update_page_one(
        student_staging,
        student_entrance_staging,
        student_personal_details_staging,
        student_staging_data,
        student_entrance_staging_data,
        student_personal_details_staging_data,
        token_no
      ) do
    multi =
      Multi.new()
      |> Multi.update(
        :student_staging,
        StudentStaging.student_staging_changeset(student_staging_data, student_staging)
      )
      |> Multi.update(
        :student_entrance_staging,
        StudentEntranceStaging.student_entrance_staging_changeset(
          student_entrance_staging_data,
          student_entrance_staging
        )
      )
      |> Multi.update(
        :student_personal_details_staging,
        StudentPersonalDetailsStaging.student_personal_details_staging_changeset(
          student_personal_details_staging_data,
          student_personal_details_staging
        )
      )

    Repo.transaction(multi)
  end
end
