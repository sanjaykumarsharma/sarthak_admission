defmodule SarthakAdmissionWeb.DiplomaController do
  use SarthakAdmissionWeb, :controller

  alias SarthakAdmission.Uuid
  alias SarthakAdmission.Admission.Token
  alias SarthakAdmission.Admission.StudentMarksDiplomaStaging
  alias SarthakAdmission.Admission.StudentTotalMarksDiplomaStaging
  alias SarthakAdmission.Admission.PageDiploma

  def calculate_total_diploma_marks_obtained(diploma_marks) do
    if diploma_marks == [] do
      nil
    else
      Enum.map(diploma_marks, fn x ->
        case Map.fetch(x, :marks) do
          {:ok, marks} -> marks
        end
      end)
      |> Enum.reduce(fn x, acc -> x + acc end)
      |> round()
    end
  end

  def new(conn, %{"token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        diploma_marks = PageDiploma.read_diploma_marks(uuid)
        changeset = StudentMarksDiplomaStaging.changeset(%StudentMarksDiplomaStaging{}, %{})

        tm_changeset =
          StudentTotalMarksDiplomaStaging.changeset(%StudentTotalMarksDiplomaStaging{}, %{})

        IO.inspect(diploma_marks)

        total_diploma_marks_obtained = calculate_total_diploma_marks_obtained(diploma_marks)
        # total_diploma_marks_obtained = nil

        IO.inspect(total_diploma_marks_obtained)

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          diploma_marks: diploma_marks,
          marks_obtained: total_diploma_marks_obtained
        )

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: nil)
    end
  end

  def create(conn, %{"student_marks_diploma_staging" => params, "token_no" => token_no}) do
    case PageDiploma.create_diploma(
           params,
           token_no
         ) do
      {:ok, result} ->
        conn
        |> redirect(to: Routes.diploma_path(conn, :new, token_no))

      {:error, %Ecto.Changeset{} = changeset} ->
        uuid = Uuid.get_uuid(token_no)
        diploma_marks = PageDiploma.read_diploma_marks(uuid)
        total_diploma_marks_obtained = calculate_total_diploma_marks_obtained(diploma_marks)

        tm_changeset =
          StudentTotalMarksDiplomaStaging.changeset(%StudentTotalMarksDiplomaStaging{}, %{})

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          diploma_marks: diploma_marks,
          marks_obtained: total_diploma_marks_obtained
        )
    end
  end

  def delete(conn, %{"token_no" => token_no, "subject_code" => subject_code}) do
    token = Uuid.get_uuid(token_no)
    # diploma_marks = PageDiploma.get_diploma_marks!(token, subject_code)
    # IO.inspect(diploma_marks)

    {_count, _error} = PageDiploma.delete_diploma_marks(token, subject_code)

    conn
    |> redirect(to: Routes.diploma_path(conn, :new, token_no))
  end

  def create_total(conn, %{
        "student_total_marks_diploma_staging" => params,
        "token_no" => token_no
      }) do
    case PageDiploma.create_diploma_total(
           params,
           token_no
         ) do
      {:ok, result} ->
        conn
        |> put_flash(:info, "Diploma Marks Saved")
        |> redirect(to: Routes.page_path(conn, :page_three, token_no))

      {:error, %Ecto.Changeset{} = tm_changeset} ->
        IO.inspect(tm_changeset)
        uuid = Uuid.get_uuid(token_no)
        diploma_marks = PageDiploma.read_diploma_marks(uuid)
        total_diploma_marks_obtained = calculate_total_diploma_marks_obtained(diploma_marks)

        changeset = StudentMarksDiplomaStaging.changeset(%StudentMarksDiplomaStaging{}, %{})

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          diploma_marks: diploma_marks,
          marks_obtained: total_diploma_marks_obtained
        )
    end
  end
end
