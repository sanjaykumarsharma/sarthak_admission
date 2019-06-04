defmodule SarthakAdmissionWeb.HigherSecondaryController do
  use SarthakAdmissionWeb, :controller

  alias SarthakAdmission.Uuid
  alias SarthakAdmission.Admission.Token
  alias SarthakAdmission.Admission.StudentMarksTwelveStaging
  alias SarthakAdmission.Admission.StudentTotalMarksTwelveStaging
  alias SarthakAdmission.Admission.PageHigherSecondary

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

        # total_higher_secondary_marks_obtained = nil

        IO.inspect(total_higher_secondary_marks_obtained)

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          higher_secondary_marks: higher_secondary_marks,
          marks_obtained: total_higher_secondary_marks_obtained
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
      {:ok, result} ->
        conn
        |> redirect(to: Routes.higher_secondary_path(conn, :new, token_no))

      {:error, %Ecto.Changeset{} = changeset} ->
        uuid = Uuid.get_uuid(token_no)
        higher_secondary_marks = PageHigherSecondary.read_higher_secondary_marks(uuid)

        total_higher_secondary_marks_obtained =
          calculate_total_higher_secondary_marks_obtained(higher_secondary_marks)

        tm_changeset =
          StudentTotalMarksTwelveStaging.changeset(%StudentTotalMarksTwelveStaging{}, %{})

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          higher_secondary_marks: higher_secondary_marks,
          marks_obtained: total_higher_secondary_marks_obtained
        )
    end
  end

  def delete(conn, %{"token_no" => token_no, "subject_code" => subject_code}) do
    token = Uuid.get_uuid(token_no)
    higher_secondary_marks = PageHigherSecondary.get_higher_secondary_marks!(token, subject_code)

    IO.inspect(higher_secondary_marks)

    # {:ok, _higher_secondary_marks} = PageHigherSecondary.delete_higher_secondary_marks(token, subject_code)
    {_count, _error} = PageHigherSecondary.delete_higher_secondary_marks(token, subject_code)

    conn
    |> redirect(to: Routes.higher_secondary_path(conn, :new, token_no))
  end

  def create_total(conn, %{"student_total_marks_twelve_staging" => params, "token_no" => token_no}) do
    case PageHigherSecondary.create_secondary_total(
           params,
           token_no
         ) do
      {:ok, result} ->
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

        render(conn, "new.html",
          changeset: changeset,
          tm_changeset: tm_changeset,
          token_no: token_no,
          higher_secondary_marks: higher_secondary_marks,
          marks_obtained: total_higher_secondary_marks_obtained
        )
    end
  end
end
