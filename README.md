# JavikWeb Runners

This project contains the infrastructure for the JavikWeb GitLab and GitHub runners. The runners are hosted in the HCloud and provisioned using Terraform.
To get started with the JavikWeb GitLab and GitHub runners, follow these steps:

1. Clone this repository to your local machine:
    ```
    git clone https://github.com/javikweb/runners.git
    ```

2. Install Terraform on your machine. You can find the installation instructions [here](https://learn.hashicorp.com/tutorials/terraform/install-cli).

3. Navigate to the `runners` directory:
    ```
    cd runners
    ```

4. Update the `terraform.tfvars` file with your HCloud API token and other configuration settings.

5. Initialize the Terraform project:
    ```
    terraform init
    ```

6. Review the infrastructure plan:
    ```
    terraform plan
    ```

7. Apply the changes to provision the runners:
    ```
    terraform apply
    ```

8. Once the runners are provisioned, you can configure them in your GitLab or GitHub repositories to execute your CI/CD pipelines.

For more detailed information and advanced configuration options, please refer to the [documentation](https://github.com/javikweb/runners/blob/main/docs/README.md).
