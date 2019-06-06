defmodule SarthakAdmissionWeb.PageController do
  use SarthakAdmissionWeb, :controller

  alias SarthakAdmission.Admission.Token
  alias SarthakAdmission.Admission.StudentStaging
  alias SarthakAdmission.Admission.StudentEntranceStaging
  alias SarthakAdmission.Admission.StudentFamilyDetailsStaging
  alias SarthakAdmission.Admission.StudentTotalMarksGraduationStaging
  alias SarthakAdmission.Admission.PageOne
  alias SarthakAdmission.Admission.PageTwo
  alias SarthakAdmission.Admission.PageThree
  alias SarthakAdmission.Uuid

  alias SarthakAdmission.Admission.Print

  def index(conn, _params) do
    render(conn, "index.html", token_no: nil)
  end

  def page_one(conn, %{"token_no" => token_no}) do
    changeset = PageOne.change_page_one(%StudentStaging{})
    render(conn, "page_one_new.html", changeset: changeset, token_no: token_no)
  end

  def page_one_edit(conn, %{"token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        if Token.is_form_complete(uuid) == 1 do
          conn
          |> redirect(to: Routes.page_path(conn, :print, token_no))
        else
          student_staging = PageOne.read_page_one(uuid)

          IO.inspect(student_staging)

          changeset = StudentStaging.changeset(%StudentStaging{}, student_staging)
          render(conn, "page_one_edit.html", changeset: changeset, token_no: token_no)
        end

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: token_no)
    end
  end

  def page_two(conn, %{"token_no" => token_no}) do
    changeset = PageTwo.change_page_two(%StudentFamilyDetailsStaging{})
    render(conn, "page_two_new.html", changeset: changeset, token_no: token_no)
  end

  def page_two_edit(conn, %{"token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        if Token.is_form_complete(uuid) == 1 do
          conn
          |> redirect(to: Routes.page_path(conn, :print, token_no))
        else
          student_family_details_staging = Print.read_student_family_details_staging(uuid)

          changeset = PageTwo.change_page_two(student_family_details_staging)
          render(conn, "page_two_edit.html", changeset: changeset, token_no: token_no)
        end

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: token_no)
    end
  end

  def page_three(conn, %{"token_no" => token_no}) do
    changeset = PageThree.change_page_three(%StudentTotalMarksGraduationStaging{})
    render(conn, "page_three_new.html", changeset: changeset, token_no: token_no)
  end

  def page_three_edit(conn, %{"token_no" => token_no}) do
    conn
    # case Ecto.UUID.dump(token_no) do
    #   {:ok, uuid} ->
    #     student_staging = PageOne.read_page_one(uuid)

    #     IO.inspect(student_staging)

    #     changeset = StudentStaging.changeset(%StudentStaging{}, student_staging)
    #     render(conn, "page_one_edit.html", changeset: changeset, token_no: token_no)

    #   :error ->
    #     conn
    #     |> put_flash(:error, "Please enter a valid token number and try again")
    #     |> render("index.html", token_no: token_no)
    # end
  end

  def create_page_one(conn, %{"student_staging" => params, "token_no" => token_no}) do
    page_one_changeset = StudentStaging.changeset(%StudentStaging{}, params)

    if page_one_changeset.valid? do
      student_staging_params = %{
        "yop" => params["yop"],
        "name" => params["name"],
        "quota" => params["quota"],
        "sex" => params["sex"],
        "course_id" => "1",
        "department_id" => "1",
        "token_no" => token_no,
        "hostel_required" => params["hostel_required"],
        "fee_payee" => params["fee_payee"],
        "student_pan_card" => params["student_pan_card"],
        "student_acn" => params["student_acn"]
      }

      student_entrance_staging_params = %{
        "category" => params["category"],
        "center_address" => params["center_address"],
        "center_name" => params["center_name"],
        "ebc" => params["ebc"],
        "enrolment_no" => params["enrolment_no"],
        "exam" => params["exam"],
        "rank" => params["rank"],
        "gate_rank" => params["gate_rank"],
        "tfw_rank" => params["tfw_rank"],
        "token_no" => token_no
      }

      IO.inspect("student_entrance_staging_params")
      IO.inspect(student_entrance_staging_params)

      student_personal_details_staging_params = %{
        "blood_group" => params["blood_group"],
        "c_address" => params["c_address"],
        "c_city" => params["c_city"],
        "c_dist" => params["c_dist"],
        "c_land_phone" => params["c_land_phone"],
        "c_pin" => params["c_pin"],
        "c_state" => params["c_state"],
        "dob" => params["dob"],
        "email" => params["email"],
        "identification_marks" => params["identification_marks"],
        "marital_status" => params["marital_status"],
        "mobile" => params["mobile"],
        "mother_tongue" => params["mother_tongue"],
        "nationality" => params["nationality"],
        "other_languages" => params["other_languages"],
        "p_address" => params["p_address"],
        "p_city" => params["p_city"],
        "p_district" => params["p_district"],
        "p_land_phone" => params["p_land_phone"],
        "p_pin" => params["p_pin"],
        "p_state" => params["p_state"],
        "passport_expiry" => params["passport_expiry"],
        "passport_no" => params["passport_no"],
        "religion" => params["religion"],
        "p_ps" => params["p_ps"],
        "c_ps" => params["c_ps"],
        "token_no" => token_no
      }

      IO.inspect("student_personal_details_staging_params")
      IO.inspect(student_personal_details_staging_params)

      case PageOne.create_page_one(
             student_staging_params,
             student_entrance_staging_params,
             student_personal_details_staging_params,
             token_no
           ) do
        {:ok, result} ->
          conn
          |> put_flash(:info, "Page one saved successfully.")
          |> redirect(to: Routes.page_path(conn, :page_two, token_no))

        {:error, %Ecto.Changeset{} = changeset} ->
          IO.inspect(changeset)
          render(conn, "page_one_new.html", changeset: page_one_changeset, token_no: token_no)
      end
    else
      IO.inspect("page_one_changeset")
      IO.inspect(page_one_changeset)

      conn
      |> put_flash(:error, "Please correct the errors marked in red and try again")
      |> render("page_one_new.html",
        changeset: %{page_one_changeset | action: :check_errors},
        token_no: token_no
      )
    end
  end

  def update_page_one(conn, %{"student_staging" => params, "token_no" => token_no}) do
    uuid = Uuid.get_uuid(token_no)
    student_staging = PageOne.read_page_one(uuid)
    page_one_changeset = StudentStaging.changeset(%StudentStaging{}, params)

    student_staging_data = Print.read_student_staging(uuid)
    student_entrance_staging_data = Print.read_student_entrance_staging(uuid)
    student_personal_details_staging_data = Print.read_student_personal_details_staging(uuid)

    if page_one_changeset.valid? do
      student_staging_params = %{
        "yop" => params["yop"],
        "name" => params["name"],
        "quota" => params["quota"],
        "sex" => params["sex"],
        "course_id" => "1",
        "department_id" => "1",
        "token_no" => token_no,
        "hostel_required" => params["hostel_required"],
        "fee_payee" => params["fee_payee"],
        "student_pan_card" => params["student_pan_card"],
        "student_acn" => params["student_acn"]
      }

      student_entrance_staging_params = %{
        "category" => params["category"],
        "center_address" => params["center_address"],
        "center_name" => params["center_name"],
        "ebc" => params["ebc"],
        "enrolment_no" => params["enrolment_no"],
        "exam" => params["exam"],
        "rank" => params["rank"],
        "gate_rank" => params["gate_rank"],
        "tfw_rank" => params["tfw_rank"],
        "token_no" => token_no
      }

      IO.inspect("student_entrance_staging_params")
      IO.inspect(student_entrance_staging_params)

      student_personal_details_staging_params = %{
        "blood_group" => params["blood_group"],
        "c_address" => params["c_address"],
        "c_city" => params["c_city"],
        "c_dist" => params["c_dist"],
        "c_land_phone" => params["c_land_phone"],
        "c_pin" => params["c_pin"],
        "c_state" => params["c_state"],
        "dob" => params["dob"],
        "email" => params["email"],
        "identification_marks" => params["identification_marks"],
        "marital_status" => params["marital_status"],
        "mobile" => params["mobile"],
        "mother_tongue" => params["mother_tongue"],
        "nationality" => params["nationality"],
        "other_languages" => params["other_languages"],
        "p_address" => params["p_address"],
        "p_city" => params["p_city"],
        "p_district" => params["p_district"],
        "p_land_phone" => params["p_land_phone"],
        "p_pin" => params["p_pin"],
        "p_state" => params["p_state"],
        "passport_expiry" => params["passport_expiry"],
        "passport_no" => params["passport_no"],
        "religion" => params["religion"],
        "p_ps" => params["p_ps"],
        "c_ps" => params["c_ps"],
        "token_no" => token_no
      }

      IO.inspect("student_personal_details_staging_params")
      IO.inspect(student_personal_details_staging_params)

      case PageOne.update_page_one(
             student_staging_params,
             student_entrance_staging_params,
             student_personal_details_staging_params,
             student_staging_data,
             student_entrance_staging_data,
             student_personal_details_staging_data,
             token_no
           ) do
        {:ok, result} ->
          if Token.is_page_two_complete(uuid) == 1 do
            conn
            |> put_flash(:info, "Page one updated successfully.")
            |> redirect(to: Routes.page_path(conn, :page_two_edit, token_no))
          else
            conn
            |> put_flash(:info, "Page one updated successfully.")
            |> redirect(to: Routes.page_path(conn, :page_two, token_no))
          end

        {:error, %Ecto.Changeset{} = changeset} ->
          IO.inspect(changeset)
          render(conn, "page_one_edit.html", changeset: page_one_changeset, token_no: token_no)
      end
    else
      IO.inspect("page_one_changeset")
      IO.inspect(page_one_changeset)

      conn
      |> put_flash(:error, "Please correct the errors marked in red and try again")
      |> render("page_one_edit.html",
        changeset: %{page_one_changeset | action: :check_errors},
        token_no: token_no
      )
    end
  end

  def create_page_two(conn, %{"student_family_details_staging" => params, "token_no" => token_no}) do
    case PageTwo.create_page_two(params, token_no) do
      {:ok, result} ->
        conn
        |> put_flash(:info, "Page two saved successfully.")
        |> redirect(to: Routes.secondary_path(conn, :new, token_no))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)

        conn
        |> put_flash(:error, "Please correct the errors marked in red and try again")
        |> render("page_two_new.html", changeset: changeset, token_no: token_no)
    end
  end

  def update_page_two(conn, %{"student_family_details_staging" => params, "token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        student_family_details_staging = Print.read_student_family_details_staging(uuid)

        case PageTwo.update_page_two(student_family_details_staging, params) do
          {:ok, question} ->
            if Token.is_page_secondary_total_complete(uuid) == 1 do
              conn
              |> put_flash(:info, "Page two updated successfully.")
              |> redirect(to: Routes.secondary_path(conn, :edit, token_no))
            else
              conn
              |> put_flash(:info, "Page two updated successfully.")
              |> redirect(to: Routes.secondary_path(conn, :new, token_no))
            end

          {:error, %Ecto.Changeset{} = changeset} ->
            render(conn, "page_two_edit.html", changeset: changeset, token_no: token_no)
        end

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: token_no)
    end
  end

  def create_page_three(conn, %{
        "student_total_marks_graduation_staging" => params,
        "token_no" => token_no
      }) do
    page_three_changeset =
      StudentTotalMarksGraduationStaging.changeset(%StudentTotalMarksGraduationStaging{}, params)

    if page_three_changeset.valid? do
      student_total_marks_graduation_staging_params = %{
        "course" => params["course_graduation"],
        "degree" => params["degree_graduation"],
        "institute" => params["institute_graduation"],
        "percentage" => params["percentage_graduation"],
        "university" => params["university_graduation"],
        "yoa" => params["yoa_graduation"],
        "yop" => params["yop_graduation"],
        "token_no" => token_no
      }

      student_work_ex_staging_params = %{
        "sponsored" => params["sponsored"],
        "company_name" => params["company_name"],
        "company_address" => params["company_address"],
        "company_city" => params["company_city"],
        "company_state" => params["company_state"],
        "company_pin" => params["company_pin"],
        "designation" => params["designation"],
        "nature_of_work" => params["nature_of_work"],
        "doj" => params["doj"],
        "dol" => params["dol"],
        "total_experience" => params["total_experience"],
        "salary" => params["salary"],
        "sponsored" => params["sponsored"],
        "company_name" => params["company_name"],
        "company_address" => params["company_address"],
        "company_city" => params["company_city"],
        "company_state" => params["company_state"],
        "company_pin" => params["company_pin"],
        "designation" => params["designation"],
        "nature_of_work" => params["nature_of_work"],
        "doj" => params["doj"],
        "dol" => params["dol"],
        "total_experience" => params["total_experience"],
        "salary" => params["salary"],
        "token_no" => token_no
      }

      IO.inspect("student_work_ex_staging_params")
      IO.inspect(student_work_ex_staging_params)

      student_undertaking_staging_params = %{
        "son_daughter_wife_of" => params["son_daughter_wife_of"],
        "residing_at" => params["residing_at"],
        "we_shri_smt" => params["we_shri_smt"],
        "this_date_of" => params["this_date_of"],
        "for_the_session" => params["for_the_session"],
        "token_no" => token_no
      }

      student_staging_params = %{
        "form_completed" => true,
        "token_no" => token_no
      }

      IO.inspect("student_undertaking_staging_params")
      IO.inspect(student_undertaking_staging_params)

      case PageThree.create_page_three(
             student_total_marks_graduation_staging_params,
             student_work_ex_staging_params,
             student_undertaking_staging_params,
             student_staging_params,
             token_no
           ) do
        {:ok, result} ->
          conn
          |> put_flash(:info, "All data saved successfully.")
          |> redirect(to: Routes.page_path(conn, :print, token_no))

        {:error, %Ecto.Changeset{} = changeset} ->
          IO.inspect(changeset)
          render(conn, "page_three_new.html", changeset: page_three_changeset, token_no: token_no)
      end
    else
      IO.inspect(page_three_changeset)

      conn
      |> put_flash(:error, "Please correct the errors marked in red and try again")
      |> render("page_three_new.html",
        changeset: %{page_three_changeset | action: :check_errors},
        token_no: token_no
      )
    end
  end

  def update_page_three(conn, %{
        "student_total_marks_graduation_staging" => params,
        "token_no" => token_no
      }) do
    conn
  end

  def validate_token(conn, %{"token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        if Token.is_form_complete(uuid) == 1 do
          conn
          |> redirect(to: Routes.page_path(conn, :print, token_no))
        else
          if Token.is_page_one_complete(uuid) == 1 do
            conn
            |> redirect(to: Routes.page_path(conn, :page_one_edit, token_no))
          else
            conn
            |> redirect(to: Routes.page_path(conn, :page_one, token_no))
          end
        end

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: token_no)
    end

    # b7aadbb6-cecb-4c0e-92bc-479a5cc0c812
    # f8e20396-c63e-4410-80a4-06ed4d48fa56
    # 65e1b0ab-d297-42c0-84ef-8a94964a604f
    # redirect(coon, to: Routes.attendance_path(conn, :index))
  end

  def print(conn, %{"token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        student_staging = Print.read_student_staging(uuid)
        student_entrance_staging = Print.read_student_entrance_staging(uuid)
        student_personal_details_staging = Print.read_student_personal_details_staging(uuid)

        student_family_details_staging = Print.read_student_family_details_staging(uuid)

        student_secondary_marks = Print.read_student_secondary_marks(uuid)
        student_secondary_marks_total = Print.read_student_secondary_marks_total(uuid)

        student_higher_secondary_marks = Print.read_student_higher_secondary_marks(uuid)

        student_higher_secondary_marks_total =
          Print.read_student_higher_secondary_marks_total(uuid)

        student_diploma_marks = Print.read_student_diploma_marks(uuid)
        student_diploma_marks_total = Print.read_student_diploma_marks_total(uuid)

        student_undertaking_staging = Print.read_student_undertaking_staging(uuid)

        render(conn, "print.html",
          token_no: token_no,
          student: student_staging,
          se: student_entrance_staging,
          spd: student_personal_details_staging,
          sfd: student_family_details_staging,
          secondary_marks: student_secondary_marks,
          smt: student_secondary_marks_total,
          higher_secondary_marks: student_higher_secondary_marks,
          hsmt: student_higher_secondary_marks_total,
          diploma_marks: student_diploma_marks,
          dmt: student_diploma_marks_total,
          su: student_undertaking_staging
        )

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: nil)
    end
  end
end
