# DevOps Directive Terraform Course

This is the companion repo to: [Complete Terraform Course - From BEGINNER to PRO! (Learn Infrastructure as Code)](https://www.youtube.com/watch?v=7xngnjfIlK4)

[![thumbnail](https://user-images.githubusercontent.com/1320389/154354937-98533608-2f42-44c1-8110-87f7e3f45085.jpeg)](https://www.youtube.com/watch?v=7xngnjfIlK4)

## 01 - Evolution of Cloud + Infrastructure as Code

High level overview of the evolution of cloud computing and infrastructure as code.

This module does not have any corresponding code.

## 02 - Overview + Setup

Terraform overview and setup instructions.

Includes basic `hello world` terraform config to provision a single AWS EC2 instance.

## 03 - Basics

Covers main usage pattern, setting up remote backends (where the terraform state is stored) using terraform Cloud and AWS, and provides a naive implementation of a web application architecture.

## 04 - Variables and Outputs

Introduces the concepts of variables which enable Terraform configurations to be flexible and composable. Refactors web application to use these features.

## 05 - Language Features

Describes additional features of the Hashicorp Configuration Language (HCL).

## 06 - Organization and Modules

Demonstrates how to structure terraform code into reuseable modules and how to instantiate/configure modules.

## 07 - Managing Multiple Environments

Shows two methods for managing multiple environments (e.g. dev/staging/prodution) with Terraform.

## 08 - Testing

Explains different types of testing (manual + automated) for Terraform modules and configurations.

## 09 - Developer Workflows + CI/CD

Covers how teams can work together with Terraform and how to set up CI/CD pipelines to keep infrastructure environments up to date.
