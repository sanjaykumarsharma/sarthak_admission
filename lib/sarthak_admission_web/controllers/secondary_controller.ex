defmodule SarthakAdmissionWeb.SecondaryController do
  use SarthakAdmissionWeb, :controller

  alias SarthakAdmission.Uuid
  alias SarthakAdmission.Admission.Token
  alias SarthakAdmission.Admission.StudentMarksTenStaging
  alias SarthakAdmission.Admission.StudentTotalMarksTenStaging
  alias SarthakAdmission.Admission.PageSecondary
  alias SarthakAdmission.Admission.Token

  def calculate_total_secondary_marks_obtained(secondary_marks) do
    if secondary_marks == [] do
      nil
    else
      Enum.map(secondary_marks, fn x ->
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
        secondary_marks = PageSecondary.read_secondary_marks(uuid)
        changeset = StudentMarksTenStaging.changeset(%StudentMarksTenStaging{}, %{})

        tm_changeset = StudentTotalMarksTenStaging.changeset(%StudentTotalMarksTenStaging{}, %{})

        IO.inspect(secondary_marks)

        total_secondary_marks_obtained = calculate_total_secondary_marks_obtained(secondary_marks)
        # total_secondary_marks_obtained = nil

        IO.inspect(total_secondary_marks_obtained)

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          secondary_marks: secondary_marks,
          marks_obtained: total_secondary_marks_obtained
        )

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: nil)
    end
  end

  def create(conn, %{"student_marks_ten_staging" => params, "token_no" => token_no}) do
    case PageSecondary.create_secondary(
           params,
           token_no
         ) do
      {:ok, result} ->
        conn
        |> redirect(to: Routes.secondary_path(conn, :new, token_no))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        uuid = Uuid.get_uuid(token_no)
        secondary_marks = PageSecondary.read_secondary_marks(uuid)
        total_secondary_marks_obtained = calculate_total_secondary_marks_obtained(secondary_marks)

        tm_changeset = StudentTotalMarksTenStaging.changeset(%StudentTotalMarksTenStaging{}, %{})

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          secondary_marks: secondary_marks,
          marks_obtained: total_secondary_marks_obtained
        )
    end
  end

  def update(conn, %{"student_marks_ten_staging" => params, "token_no" => token_no}) do
    case PageSecondary.create_secondary(
           params,
           token_no
         ) do
      {:ok, result} ->
        conn
        |> redirect(to: Routes.secondary_path(conn, :edit, token_no))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        uuid = Uuid.get_uuid(token_no)
        secondary_marks = PageSecondary.read_secondary_marks(uuid)
        secondary_marks_total = PageSecondary.read_student_secondary_marks_total(uuid)
        tm_changeset = StudentTotalMarksTenStaging.changeset(secondary_marks_total, %{})
        total_secondary_marks_obtained = calculate_total_secondary_marks_obtained(secondary_marks)

        render(conn, "edit.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          secondary_marks: secondary_marks,
          marks_obtained: total_secondary_marks_obtained
        )
    end
  end

  def edit(conn, %{"token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        secondary_marks = PageSecondary.read_secondary_marks(uuid)
        changeset = StudentMarksTenStaging.changeset(%StudentMarksTenStaging{}, %{})

        secondary_marks_total = PageSecondary.read_student_secondary_marks_total(uuid)
        tm_changeset = StudentTotalMarksTenStaging.changeset(secondary_marks_total, %{})

        total_secondary_marks_obtained = calculate_total_secondary_marks_obtained(secondary_marks)

        IO.inspect(total_secondary_marks_obtained)

        render(conn, "edit.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          secondary_marks: secondary_marks,
          marks_obtained: total_secondary_marks_obtained
        )

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: nil)
    end
  end

  def delete(conn, %{"token_no" => token_no, "subject_code" => subject_code}) do
    uuid = Uuid.get_uuid(token_no)

    {_count, _error} = PageSecondary.delete_secondary_marks(uuid, subject_code)

    if Token.is_page_secondary_total_complete(uuid) == 1 do
      conn
      |> redirect(to: Routes.secondary_path(conn, :edit, token_no))
    else
      conn
      |> redirect(to: Routes.secondary_path(conn, :new, token_no))
    end
  end

  def create_total(conn, %{"student_total_marks_ten_staging" => params, "token_no" => token_no}) do
    case PageSecondary.create_secondary_total(
           params,
           token_no
         ) do
      {:ok, result} ->
        conn
        |> put_flash(:info, "Secondary Marks Saved")
        |> redirect(to: Routes.higher_secondary_path(conn, :new, token_no))

      {:error, %Ecto.Changeset{} = tm_changeset} ->
        IO.inspect(tm_changeset)
        uuid = Uuid.get_uuid(token_no)
        secondary_marks = PageSecondary.read_secondary_marks(uuid)
        total_secondary_marks_obtained = calculate_total_secondary_marks_obtained(secondary_marks)

        changeset = StudentMarksTenStaging.changeset(%StudentMarksTenStaging{}, %{})

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          secondary_marks: secondary_marks,
          marks_obtained: total_secondary_marks_obtained
        )
    end
  end

  def update_total(conn, %{"student_total_marks_ten_staging" => params, "token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        secondary_marks_total = PageSecondary.read_student_secondary_marks_total(uuid)

        case PageSecondary.update_total(secondary_marks_total, params) do
          {:ok, question} ->
            if Token.is_page_secondary_total_complete(uuid) == 1 do
              conn
              |> put_flash(:info, "Secondary marks updated successfully.")
              # |> redirect(to: Routes.higher_secondary_path(conn, :edit, token_no))
              |> redirect(to: Routes.higher_secondary_path(conn, :new, token_no))
            else
              conn
              |> put_flash(:info, "Secondary marks updated successfully.")
              |> redirect(to: Routes.higher_secondary_path(conn, :new, token_no))
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
end
