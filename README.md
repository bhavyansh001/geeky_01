# Geeky

Geeky is a platform designed for mathematical problem-solving enthusiasts. It offers various competitive modes for practicing mathematical problems and a learning area where users can study articles provided by others or create their own.

## Features

### Practice Area
- **Level Up Mode**: Complete as many problems as you can within 10 seconds.
- **Bro vs Bro Mode**: Play in real-time against another user and view results at the end.

### Learning Area
- Study articles provided by other users.
- Create and share your own articles.

## Installation

To set up Geeky locally, follow these steps:

1. Install Ruby
2. Install Bundler
3. Install Rails
4. Clone this repository
5. Run `bundle install` to install gem dependencies
6. Set up the database using either `rails db:setup` or `rails db:create` (requires PostgreSQL)

## Usage

1. Run `rails server` to start the application locally.
2. Access the application in your web browser at `http://localhost:3000`.

## Branches Explained

### deploy_aws_cli
Used to deploy to AWS using AWS CLI and user data scripts. This branch contains configurations and scripts specific to automating deployments via AWS CLI commands.

### deploy_tf
For deploying with Terraform and Ansible. This branch focuses on infrastructure as code (IaC) practices, utilizing Terraform for provisioning resources and Ansible for configuration management.

### monitoring
For setting up Prometheus and Grafana. This branch includes configurations and dashboards for monitoring the application's performance and health metrics, leveraging Prometheus for data collection and Grafana for visualization.

## Contributing

Currently, Geeky is a private project developed solely by Bhavyansh. However, if you're interested in contributing, please reach out to Bhavyansh001 at bhavyansh001@gmail.com.

## Contact

For more information, support, or feedback, contact Bhavyansh at bhavyansh001@gmail.com.
