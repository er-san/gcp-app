provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_artifact_registry_repository" "hello_world" {
  location      = var.region
  repository_id = var.repo_id
  format        = "DOCKER"
}

resource "google_cloud_run_service" "hello_world" {
  name     = var.app_name
  location = var.region

  template {
    spec {
      containers {
        image = "${google_artifact_registry_repository.hello_world.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.hello_world.repository_id}/${var.app_name}:latest"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

resource "google_cloud_run_service_iam_member" "invoker" {
  location = google_cloud_run_service.hello_world.location
  service  = google_cloud_run_service.hello_world.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
