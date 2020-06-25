defmodule SmokeWeb.PatientControllerTest do
  use SmokeWeb.ConnCase

  alias Smoke.R4
  alias Smoke.R4.Patient

  @create_attrs %{
    active: true,
    birthDate: ~D[2010-04-17],
    deceased: true,
    deceasedDateTime: ~T[14:00:00],
    firstName: "some firstName",
    gender: "some gender",
    identifier: "some identifier",
    lastName: "some lastName",
    maritalStatus: "some maritalStatus",
    middleName: "some middleName",
    multipleBirth: true,
    multipleBirthInteger: 42,
    photoURI: "some photoURI",
    prefix: "some prefix",
    suffix: "some suffix"
  }
  @update_attrs %{
    active: false,
    birthDate: ~D[2011-05-18],
    deceased: false,
    deceasedDateTime: ~T[15:01:01],
    firstName: "some updated firstName",
    gender: "some updated gender",
    identifier: "some updated identifier",
    lastName: "some updated lastName",
    maritalStatus: "some updated maritalStatus",
    middleName: "some updated middleName",
    multipleBirth: false,
    multipleBirthInteger: 43,
    photoURI: "some updated photoURI",
    prefix: "some updated prefix",
    suffix: "some updated suffix"
  }
  @invalid_attrs %{active: nil, birthDate: nil, deceased: nil, deceasedDateTime: nil, firstName: nil, gender: nil, identifier: nil, lastName: nil, maritalStatus: nil, middleName: nil, multipleBirth: nil, multipleBirthInteger: nil, photoURI: nil, prefix: nil, suffix: nil}

  def fixture(:patient) do
    {:ok, patient} = R4.create_patient(@create_attrs)
    patient
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all patients", %{conn: conn} do
      conn = get(conn, Routes.patient_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create patient" do
    test "renders patient when data is valid", %{conn: conn} do
      conn = post(conn, Routes.patient_path(conn, :create), patient: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.patient_path(conn, :show, id))

      assert %{
               "id" => id,
               "active" => true,
               "birthDate" => "2010-04-17",
               "deceased" => true,
               "deceasedDateTime" => "14:00:00",
               "firstName" => "some firstName",
               "gender" => "some gender",
               "identifier" => "some identifier",
               "lastName" => "some lastName",
               "maritalStatus" => "some maritalStatus",
               "middleName" => "some middleName",
               "multipleBirth" => true,
               "multipleBirthInteger" => 42,
               "photoURI" => "some photoURI",
               "prefix" => "some prefix",
               "suffix" => "some suffix"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.patient_path(conn, :create), patient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update patient" do
    setup [:create_patient]

    test "renders patient when data is valid", %{conn: conn, patient: %Patient{id: id} = patient} do
      conn = put(conn, Routes.patient_path(conn, :update, patient), patient: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.patient_path(conn, :show, id))

      assert %{
               "id" => id,
               "active" => false,
               "birthDate" => "2011-05-18",
               "deceased" => false,
               "deceasedDateTime" => "15:01:01",
               "firstName" => "some updated firstName",
               "gender" => "some updated gender",
               "identifier" => "some updated identifier",
               "lastName" => "some updated lastName",
               "maritalStatus" => "some updated maritalStatus",
               "middleName" => "some updated middleName",
               "multipleBirth" => false,
               "multipleBirthInteger" => 43,
               "photoURI" => "some updated photoURI",
               "prefix" => "some updated prefix",
               "suffix" => "some updated suffix"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, patient: patient} do
      conn = put(conn, Routes.patient_path(conn, :update, patient), patient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete patient" do
    setup [:create_patient]

    test "deletes chosen patient", %{conn: conn, patient: patient} do
      conn = delete(conn, Routes.patient_path(conn, :delete, patient))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.patient_path(conn, :show, patient))
      end
    end
  end

  defp create_patient(_) do
    patient = fixture(:patient)
    %{patient: patient}
  end
end
