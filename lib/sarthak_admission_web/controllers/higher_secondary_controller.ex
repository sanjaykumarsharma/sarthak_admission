defmodule SarthakAdmissionWeb.HigherSecondaryController do
  use SarthakAdmissionWeb, :controller

  alias SarthakAdmission.Uuid
  alias SarthakAdmission.Admission.Token
  alias SarthakAdmission.Admission.StudentMarksTwelveStaging
  alias SarthakAdmission.Admission.StudentTotalMarksTwelveStaging
  alias SarthakAdmission.Admission.PageHigherSecondary

  def read_higher_secondary_subjects do
    File.stream!("csv/higher_secondary_subjects.csv")
    |> CSV.decode!()
    |> Enum.to_list()
    |> Enum.map(fn [x, y] -> %{subject: x, subject_code: y} end)
  end

  def read_higher_secondary_boards do
    File.stream!("csv/higher_secondary_boards.csv")
    |> CSV.decode!(separator: ?;)
    |> Enum.to_list()
    |> Enum.map(fn [x] -> %{board: x} end)
  end

  def calculate_total_higher_secondary_marks_obtained(higher_secondary_marks) do
    if higher_secondary_marks == [] do
      nil
    else
      Enum.map(higher_secondary_marks, fn x ->
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
        higher_secondary_marks = PageHigherSecondary.read_higher_secondary_marks(uuid)
        changeset = StudentMarksTwelveStaging.changeset(%StudentMarksTwelveStaging{}, %{})

        tm_changeset =
          StudentTotalMarksTwelveStaging.changeset(%StudentTotalMarksTwelveStaging{}, %{})

        IO.inspect(higher_secondary_marks)

        total_higher_secondary_marks_obtained =
          calculate_total_higher_secondary_marks_obtained(higher_secondary_marks)

        higher_secondary_subjects = read_higher_secondary_subjects()
        higher_secondary_boards = read_higher_secondary_boards()

        IO.inspect(total_higher_secondary_marks_obtained)

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          higher_secondary_marks: higher_secondary_marks,
          marks_obtained: total_higher_secondary_marks_obtained,
          higher_secondary_subjects: higher_secondary_subjects,
          higher_secondary_boards: higher_secondary_boards
        )

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: nil)
    end
  end

  def create(conn, %{"student_marks_twelve_staging" => params, "token_no" => token_no}) do
    case PageHigherSecondary.create_secondary(
           params,
           token_no
         ) do
      {:ok, _result} ->
        conn
        |> redirect(to: Routes.higher_secondary_path(conn, :new, token_no))

      {:error, %Ecto.Changeset{} = changeset} ->
        uuid = Uuid.get_uuid(token_no)
        higher_secondary_marks = PageHigherSecondary.read_higher_secondary_marks(uuid)

        total_higher_secondary_marks_obtained =
          calculate_total_higher_secondary_marks_obtained(higher_secondary_marks)

        tm_changeset =
          StudentTotalMarksTwelveStaging.changeset(%StudentTotalMarksTwelveStaging{}, %{})

        higher_secondary_subjects = read_higher_secondary_subjects()
        higher_secondary_boards = read_higher_secondary_boards()

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          higher_secondary_marks: higher_secondary_marks,
          marks_obtained: total_higher_secondary_marks_obtained,
          higher_secondary_subjects: higher_secondary_subjects,
          higher_secondary_boards: higher_secondary_boards
        )
    end
  end

  def update(conn, %{"student_marks_twelve_staging" => params, "token_no" => token_no}) do
    case PageHigherSecondary.create_secondary(
           params,
           token_no
         ) do
      {:ok, _result} ->
        conn
        |> redirect(to: Routes.higher_secondary_path(conn, :edit, token_no))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        uuid = Uuid.get_uuid(token_no)
        higher_secondary_marks = PageHigherSecondary.read_higher_secondary_marks(uuid)

        higher_secondary_marks_total =
          PageHigherSecondary.read_student_higher_secondary_marks_total(uuid)

        tm_changeset = StudentTotalMarksTwelveStaging.changeset(higher_secondary_marks_total, %{})

        total_higher_secondary_marks_obtained =
          calculate_total_higher_secondary_marks_obtained(higher_secondary_marks)

        higher_secondary_subjects = read_higher_secondary_subjects()
        higher_secondary_boards = read_higher_secondary_boards()

        render(conn, "edit.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          higher_secondary_marks: higher_secondary_marks,
          marks_obtained: total_higher_secondary_marks_obtained,
          higher_secondary_subjects: higher_secondary_subjects,
          higher_secondary_boards: higher_secondary_boards
        )
    end
  end

  def edit(conn, %{"token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        if Token.is_form_complete(uuid) == 1 do
          conn
          |> redirect(to: Routes.page_path(conn, :print, token_no))
        else
          higher_secondary_marks = PageHigherSecondary.read_higher_secondary_marks(uuid)
          changeset = StudentMarksTwelveStaging.changeset(%StudentMarksTwelveStaging{}, %{})

          higher_secondary_marks_total =
            PageHigherSecondary.read_student_higher_secondary_marks_total(uuid)

          tm_changeset =
            StudentTotalMarksTwelveStaging.changeset(higher_secondary_marks_total, %{})

          total_higher_secondary_marks_obtained =
            calculate_total_higher_secondary_marks_obtained(higher_secondary_marks)

          higher_secondary_subjects = read_higher_secondary_subjects()
          higher_secondary_boards = read_higher_secondary_boards()

          render(conn, "edit.html",
            changeset: changeset,
            tm_changeset: tm_changeset,
            token_no: token_no,
            higher_secondary_marks: higher_secondary_marks,
            marks_obtained: total_higher_secondary_marks_obtained,
            higher_secondary_subjects: higher_secondary_subjects,
            higher_secondary_boards: higher_secondary_boards
          )
        end

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: nil)
    end
  end

  def delete(conn, %{"token_no" => token_no, "subject_code" => subject_code}) do
    uuid = Uuid.get_uuid(token_no)

    {_count, _error} = PageHigherSecondary.delete_higher_secondary_marks(uuid, subject_code)

    if Token.is_page_higher_secondary_total_complete(uuid) == 1 do
      conn
      |> redirect(to: Routes.higher_secondary_path(conn, :edit, token_no))
    else
      conn
      |> redirect(to: Routes.higher_secondary_path(conn, :new, token_no))
    end
  end

  def create_total(conn, %{"student_total_marks_twelve_staging" => params, "token_no" => token_no}) do
    case PageHigherSecondary.create_secondary_total(
           params,
           token_no
         ) do
      {:ok, _result} ->
        conn
        |> put_flash(:info, "Higher Secondary Marks Saved")
        |> redirect(to: Routes.diploma_path(conn, :new, token_no))

      {:error, %Ecto.Changeset{} = tm_changeset} ->
        IO.inspect(tm_changeset)
        uuid = Uuid.get_uuid(token_no)
        higher_secondary_marks = PageHigherSecondary.read_higher_secondary_marks(uuid)

        total_higher_secondary_marks_obtained =
          calculate_total_higher_secondary_marks_obtained(higher_secondary_marks)

        changeset = StudentMarksTwelveStaging.changeset(%StudentMarksTwelveStaging{}, %{})

        higher_secondary_subjects = read_higher_secondary_subjects()
        higher_secondary_boards = read_higher_secondary_boards()

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          higher_secondary_marks: higher_secondary_marks,
          marks_obtained: total_higher_secondary_marks_obtained,
          higher_secondary_subjects: higher_secondary_subjects,
          higher_secondary_boards: higher_secondary_boards
        )
    end
  end

  def update_total(conn, %{"student_total_marks_twelve_staging" => params, "token_no" => token_no}) do
    case Ecto.UUID.dump(token_no) do
      {:ok, uuid} ->
        higher_secondary_marks_total =
          PageHigherSecondary.read_student_higher_secondary_marks_total(uuid)

        IO.inspect(higher_secondary_marks_total)

        case PageHigherSecondary.update_total(higher_secondary_marks_total, params) do
          {:ok, _result} ->
            if Token.is_page_diploma_total_complete(uuid) == 1 do
              conn
              |> put_flash(:info, "Higher secondary marks updated successfully.")
              |> redirect(to: Routes.diploma_path(conn, :edit, token_no))
            else
              conn
              |> put_flash(:info, "Higher secondary marks updated successfully.")
              |> redirect(to: Routes.diploma_path(conn, :new, token_no))
            end

          {:error, %Ecto.Changeset{} = tm_changeset} ->
            higher_secondary_marks = PageHigherSecondary.read_higher_secondary_marks(uuid)

            total_higher_secondary_marks_obtained =
              calculate_total_higher_secondary_marks_obtained(higher_secondary_marks)

            changeset = StudentMarksTwelveStaging.changeset(%StudentMarksTwelveStaging{}, %{})

            higher_secondary_subjects = read_higher_secondary_subjects()
            higher_secondary_boards = read_higher_secondary_boards()

            render(conn, "edit.html",
              changeset: changeset,
              tm_changeset: tm_changeset,
              token_no: token_no,
              higher_secondary_marks: higher_secondary_marks,
              marks_obtained: total_higher_secondary_marks_obtained,
              higher_secondary_subjects: higher_secondary_subjects,
              higher_secondary_boards: higher_secondary_boards
            )
        end

      :error ->
        conn
        |> put_flash(:error, "Please enter a valid token number and try again")
        |> render("index.html", token_no: token_no)
    end
  end
end
