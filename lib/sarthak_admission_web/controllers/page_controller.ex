defmodule SarthakAdmissionWeb.PageController do
  use SarthakAdmissionWeb, :controller

  alias SarthakAdmission.Admission.Token
  alias SarthakAdmission.Admission.StudentStaging
  alias SarthakAdmission.Admission.StudentEntranceStaging
  alias SarthakAdmission.Admission.PageOne

  def index(conn, _params) do
    render(conn, "index.html", token_no: nil)
  end

  def page_one(conn, %{"token_no" => token_no}) do
    changeset = PageOne.change_page_one(%StudentStaging{})
    render(conn, "page_one_new.html", changeset: changeset, token_no: token_no)
  end

  def page_two(conn, %{"token_no" => token_no}) do
    changeset = PageOne.change_page_one(%StudentStaging{})
    render(conn, "page_two_new.html", changeset: changeset, token_no: token_no)
  end

  def page_three(conn, %{"token_no" => token_no}) do
    changeset = PageOne.change_page_one(%StudentStaging{})
    render(conn, "page_three_new.html", changeset: changeset, token_no: token_no)
  end

  def create_page_one(conn, %{"student_staging" => params, "token_no" => token_no}) do
    page_one_changeset = PageOne.student_staging_changeset(params, token_no)
    # IO.inspect("page_one_changeset")
    # IO.inspect(page_one_changeset)

    # case PageOne.create_page_one_test(
    #        params,
    #        token_no
    #      ) do
    #   {:ok, result} ->
    #     conn
    #     |> put_flash(:info, "Page one saved successfully.")
    #     |> redirect(to: Routes.page_path(conn, :page_two, token_no))

    #   {:error, %Ecto.Changeset{} = changeset} ->
    #     IO.inspect(changeset)
    #     render(conn, "page_one_new.html", changeset: changeset, token_no: token_no)
    # end

    if page_one_changeset.valid? do
      student_staging_params = %{
        "yop" => params["yop"],
        "name" => params["name"],
        "quota" => params["quota"],
        "sex" => params["sex"],
        "course_id" => "1",
        "department_id" => "1",
        "token_no" => token_no
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
          render(conn, "page_one_new.html", changeset: changeset, token_no: token_no)
      end
    else
      IO.inspect(page_one_changeset)
      render(conn, "page_one_new.html", changeset: page_one_changeset, token_no: token_no)
    end
  end

  def create_page_two(conn, %{"student_staging" => student_staging_params, "token_no" => token_no}) do
    conn
    # redirect(conn, to: Routes.page_path(conn, :page_three, token_no))
    # page_two_changeset = PageTwo.student_staging_changeset(params, token_no)
    # IO.inspect("page_two_changeset")
    # IO.inspect(page_two_changeset)

    # case PageOne.create_page_two_test(
    #        params,
    #        token_no
    #      ) do
    #   {:ok, result} ->
    #     conn
    #     |> put_flash(:info, "Page one saved successfully.")
    #     |> redirect(to: Routes.page_path(conn, :page_two, token_no))

    #   {:error, %Ecto.Changeset{} = changeset} ->
    #     IO.inspect(changeset)
    #     render(conn, "page_two_new.html", changeset: changeset, token_no: token_no)
    # end
  end

  def validate_token(conn, %{"token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        case Token.is_form_complete(uuid) do
          nil ->
            conn
            |> redirect(to: Routes.page_path(conn, :page_one, token_no))
        end

      :error ->
        conn
        |> put_flash(:error, "Invalid Token No")
        |> render("index.html", token_no: token_no)
    end

    # b7aadbb6-cecb-4c0e-92bc-479a5cc0c812
    # f8e20396-c63e-4410-80a4-06ed4d48fa56
    # 65e1b0ab-d297-42c0-84ef-8a94964a604f
    # redirect(coon, to: Routes.attendance_path(conn, :index))
  end

  def print(conn, %{"token_no" => token_no}) do
    render(conn, "print.html", token_no: token_no)
  end
end
