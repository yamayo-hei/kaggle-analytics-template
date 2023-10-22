provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
}

# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["iap-ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 100
    }
  }

  network_interface {
    # 自分で定義したsubnetwork内にインスタンスを起動する
    network    = google_compute_network.my_network.name
    subnetwork = google_compute_subnetwork.my_subnetwork.name
    # 外部IPアドレスを割り振る方法は次の2種類ある。静的外部IPアドレス、エフェメラル外部IPアドレス
    access_config {
      # nat_ip = "${google_compute_address.default.address}"
    }
  }

  scheduling {
    # 料金を抑えるためにプリエンプティブルにしておく
    preemptible = true
    # プリエンプティブルの場合は下のオプションが必須
    automatic_restart = false
  }

  # Install
  metadata_startup_script = <<EOF
#!/bin/bash
sudo timedatectl set-timezone Asia/Tokyo
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install docker-compose
sudo apt-get install git
EOF
}

resource "google_compute_network" "my_network" {
  name = "my-network"
  # リージョンごとにサブネットを自動で作成してくれます。今回は使わないのでfalseにします。
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name   = "my-subnetwork"
  region = var.region

  # サブネットで使用したい内部IPアドレスの範囲を指定する
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.my_network.id

  # CloudLoggingにFlowLogログを出力したい場合は設定する
  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "ssh" {
  name = "allow-iap-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.my_network.id
  priority      = 1000
  source_ranges = ["35.235.240.0/20"] # IAPのアドレス範囲
  target_tags   = ["iap-ssh"]
}
