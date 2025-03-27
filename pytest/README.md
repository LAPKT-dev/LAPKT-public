# LAPKT Python Package Tests
A suite of functional tests and unit tests for Python bindings and other Python modules which includes problem data 

## Install dependencies


```
python3 -m pip install -r requirements.txt
```

> [!NOTE]
> If using python virtual environment `venv` or similar for LAPKT installation, then the dependencies should be installed in the same environment.


## Run tests

> [!NOTE]
> Ensure that the LAPKT python package is available on `sys.path`

```
python -c "import sys; print(sys.path)"
```

Initiate tests
```
python3 -m pytest
```

Advanced options to ignore deprecation warnings and slow tests
```
python3 -m pytest -s -x -m "not slow" -W ignore::DeprecationWarning
```