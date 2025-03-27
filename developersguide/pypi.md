# Deploy LAPKT on pypi 

By default the `cmake` scripts builds a `pypi` package. The steps to deploy `lapkt` on the `pypi` repository are well document in the github actions configurations, [test.pypi](../.github/workflows/testpypi_publish.yml) and [pypi](../.github/workflows/pypi_publish.yml).

## Pre-deployment steps

 - Update the lapkt package version in the file `src/python/_package/setup.py`
 - Deploy the package to `https://test.pypi.org/`. This can be done through the Github Actions, using the [testpypi_publish](../.github/workflows/testpypi_publish.yml) workflow. The `testpypi_publish` needs to be triggered manually from the LAPKT repo at `github.com`.
 - If the deployment to `https://test.pypi.org/` was successful, then trigger the [test_testpypi_package](../.github/workflows/test_testpypi_package.yml) workflow, which would perform some end-to-end tests on the test pypi deployment. Else, debug and deploy to `test.pypi` until the deployment is successful.

## Deployment steps

 - Deploy the package to `https://test.pypi.org/`. This can be done through the Github Actions, using the [testpypi_publish](../.github/workflows/testpypi_publish.yml) workflow. 
 - The standard way to trigger `pypi_publish` workflow is to create a new release. This would ensure that we have tarballs of source associated with each `pypi` release.

## Post-deployment steps

 - Trigger the [test_pypi_package](../.github/workflows/test_pypi_package.yml) workflow, which would perform some end-to-end tests on the `pypi` deployment.
