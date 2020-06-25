defmodule Smoke.R4Test do
  use Smoke.DataCase

  alias Smoke.R4

  describe "patients" do
    alias Smoke.R4.Patient

    @valid_attrs %{active: true, birthDate: ~D[2010-04-17], deceased: true, deceasedDateTime: ~T[14:00:00], firstName: "some firstName", gender: "some gender", identifier: "some identifier", lastName: "some lastName", maritalStatus: "some maritalStatus", middleName: "some middleName", multipleBirth: true, multipleBirthInteger: 42, photoURI: "some photoURI", prefix: "some prefix", suffix: "some suffix"}
    @update_attrs %{active: false, birthDate: ~D[2011-05-18], deceased: false, deceasedDateTime: ~T[15:01:01], firstName: "some updated firstName", gender: "some updated gender", identifier: "some updated identifier", lastName: "some updated lastName", maritalStatus: "some updated maritalStatus", middleName: "some updated middleName", multipleBirth: false, multipleBirthInteger: 43, photoURI: "some updated photoURI", prefix: "some updated prefix", suffix: "some updated suffix"}
    @invalid_attrs %{active: nil, birthDate: nil, deceased: nil, deceasedDateTime: nil, firstName: nil, gender: nil, identifier: nil, lastName: nil, maritalStatus: nil, middleName: nil, multipleBirth: nil, multipleBirthInteger: nil, photoURI: nil, prefix: nil, suffix: nil}

    def patient_fixture(attrs \\ %{}) do
      {:ok, patient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> R4.create_patient()

      patient
    end

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert R4.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert R4.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      assert {:ok, %Patient{} = patient} = R4.create_patient(@valid_attrs)
      assert patient.active == true
      assert patient.birthDate == ~D[2010-04-17]
      assert patient.deceased == true
      assert patient.deceasedDateTime == ~T[14:00:00]
      assert patient.firstName == "some firstName"
      assert patient.gender == "some gender"
      assert patient.identifier == "some identifier"
      assert patient.lastName == "some lastName"
      assert patient.maritalStatus == "some maritalStatus"
      assert patient.middleName == "some middleName"
      assert patient.multipleBirth == true
      assert patient.multipleBirthInteger == 42
      assert patient.photoURI == "some photoURI"
      assert patient.prefix == "some prefix"
      assert patient.suffix == "some suffix"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = R4.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{} = patient} = R4.update_patient(patient, @update_attrs)
      assert patient.active == false
      assert patient.birthDate == ~D[2011-05-18]
      assert patient.deceased == false
      assert patient.deceasedDateTime == ~T[15:01:01]
      assert patient.firstName == "some updated firstName"
      assert patient.gender == "some updated gender"
      assert patient.identifier == "some updated identifier"
      assert patient.lastName == "some updated lastName"
      assert patient.maritalStatus == "some updated maritalStatus"
      assert patient.middleName == "some updated middleName"
      assert patient.multipleBirth == false
      assert patient.multipleBirthInteger == 43
      assert patient.photoURI == "some updated photoURI"
      assert patient.prefix == "some updated prefix"
      assert patient.suffix == "some updated suffix"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = R4.update_patient(patient, @invalid_attrs)
      assert patient == R4.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = R4.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> R4.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = R4.change_patient(patient)
    end
  end
end
