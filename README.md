# acit4640-lab-wk13

## Team

- Angad Bains
- Misha Makaroff

## Bucket

The bucket is used for the remote backend for our Terraform configuration. We can create it by simply adding a block in the `provider.tf`.

```hcl
terraform {
    backend "s3" {
        bucket = "4640wk13"
        key = "terraform.tfstate"
        region = "us-west-2"
        encrypt = true
        use_lockfile = true
    }
}
```

## Questions

### When is the state file created?

The state file is created the first time Terraform writes state to the backend. This typically happens after a successful `terraform apply`, or when Terraform migrates existing state during `terraform init`.

### When is the lock file present?

The lock file is present only while Terraform is actively holding a state lock. For the S3 backend, this requires `use_lockfile = true`. Terraform acquires the lock automatically during operations that may write state or otherwise require exclusive access to the state.

### Is the lock file always in the bucket after it is created?

The lock file is temporary and exists only for the duration of the Terraform operation while the state is locked. For example, it may appear during commands such as `terraform plan` or `terraform apply` when Terraform needs to lock the state, and it is normally removed once the operation completes.

## Screenshots

AWS S3 web console that shows the state file only:
![state file only](./state-file.png)

AWS S3 web console that shows the lock file and the state file:
![state and lock file](./lock-file.png)
