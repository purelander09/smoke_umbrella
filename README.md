# Smoke

Where there is smoke there is FHIR! This is an attempt at creating a FHIR server in Elixir supporting HL7's R4 specification of FHIR.

## What is It?

Smoke is a combination of multiple Elixir applications, supervision trees, and other features of Elixir to create an extendable FHIR server and application platform.

It contains the following applications:

* SmokeWeb: A Phoenix application that holds the actual server for Smoke.
* Smoke: An Ecto application that handles the database functionality.

There is a goal to have a Typescript React web application and library to support FHIR interactions using Smoke. 

There is a lot to do and this is very much a work in progress, this is more a test bed for me to learn and use FHIR from a server and client perspective.
