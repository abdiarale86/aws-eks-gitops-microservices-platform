# Production-Style GitOps Microservices Platform on AWS EKS

A secure, automated, observable, and production-style microservices platform built on Amazon EKS using Terraform, Kubernetes, Helm, Argo CD, and GitHub Actions.

> Work in progress: this project is being built milestone by milestone, with each design decision and implementation stage documented.

## Project objective

Traditional Kubernetes deployment workflows often rely on manually created infrastructure, long-lived cloud credentials, direct deployment commands, limited security controls, and incomplete monitoring.

This project demonstrates how to build and operate a production-style microservices platform using infrastructure as code and GitOps practices.

## Application workload

The application workload is based on Google's Online Boutique microservices demo.

The imported application source is used as a realistic distributed workload consisting of multiple services that communicate using gRPC.

The original work in this repository focuses on designing and implementing the platform around the application, including:

- AWS infrastructure architecture
- Reusable Terraform modules
- Amazon EKS and Amazon ECR
- Separate development and production environments
- Encrypted Terraform remote state
- GitHub Actions authentication through AWS OIDC
- Automated testing and security scanning
- Helm-based Kubernetes deployments
- GitOps delivery using Argo CD
- AWS Secrets Manager and External Secrets Operator
- Kubernetes security controls and NetworkPolicies
- Prometheus, Grafana, and Alertmanager
- Autoscaling and high availability
- Canary deployments using Argo Rollouts
- Route 53, HTTPS, and AWS load balancing
- Disaster recovery and cost-management procedures

## Planned architecture

```text
Developer
    |
    v
GitHub Repository
    |
    v
GitHub Actions CI
    |
    +-- Tests
    +-- Terraform validation
    +-- Security scanning
    +-- Container builds
    +-- Trivy image scanning
    +-- Push images to Amazon ECR
    |
    v
GitOps configuration update
    |
    v
Argo CD
    |
    v
Amazon EKS
    |
    +-- Online Boutique microservices
    +-- External Secrets Operator
    +-- AWS Load Balancer Controller
    +-- Prometheus and Grafana
    +-- Alertmanager
    +-- Argo Rollouts