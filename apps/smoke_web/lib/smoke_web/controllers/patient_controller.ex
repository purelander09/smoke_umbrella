defmodule SmokeWeb.PatientController do
  use SmokeWeb, :controller

  alias Smoke.R4
  alias Smoke.R4.Patient

  action_fallback SmokeWeb.FallbackController

  def index(conn, _params) do
    patients = R4.list_patients()
    render(conn, "index.json", patients: patients)
  end

  def create(conn, %{"patient" => patient_params}) do
    with {:ok, %Patient{} = patient} <- R4.create_patient(patient_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.patient_path(conn, :show, patient))
      |> render("show.json", patient: patient)
    end
  end

  def show(conn, %{"id" => id}) do
    patient = R4.get_patient!(id)
    render(conn, "show.json", patient: patient)
  end

  def update(conn, %{"id" => id, "patient" => patient_params}) do
    patient = R4.get_patient!(id)

    with {:ok, %Patient{} = patient} <- R4.update_patient(patient, patient_params) do
      render(conn, "show.json", patient: patient)
    end
  end

  def delete(conn, %{"id" => id}) do
    patient = R4.get_patient!(id)

    with {:ok, %Patient{}} <- R4.delete_patient(patient) do
      send_resp(conn, :no_content, "")
    end
  end
end
