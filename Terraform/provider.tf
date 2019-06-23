provider "google" {
  credentials = "${file("service-account.json")}"
  project = "team-project-uam"
  region = "europe-west3"
  zone = "europe-west3-c"
}
