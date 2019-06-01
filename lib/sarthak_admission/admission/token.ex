defmodule SarthakAdmission.Admission.Token do
  import Ecto.Query, warn: false
  alias SarthakAdmission.Repo

  alias SarthakAdmission.Admission.StudentStaging

  def is_form_complete(token_no) do
    Repo.one(
      from(a in StudentStaging,
        where: a.token_no == ^token_no and a.form_completed == true
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
