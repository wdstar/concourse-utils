Concourse Pipeline Utilities
============================

## Contents

- [Utilities](#utilities)
    - [install-ca-certs](#install-ca-certs)
- [License and Authors](#license-and-authors)

## Utilities

### install-ca-certs

CA certificates installation (via `CA_CERTS` environmental variable) scripts

- `alpine.sh`: for the `alpine` image.
- `buildroot.sh`: for the `concourse/buildroot` image.
- `centos.sh`: for the RHEL family.
- `debian.sh`: for the Debian family.

`concourse.yml`: Pipeline configuration example.

```yaml
---
resources:
- name: src-git
  type: git
  source:
    uri: https://github.com/wdstar/concourse-utils.git
    branch: master

jobs:
- name: install-ca-certs
  plan:
  - get: src-git
  - task: on-alpine
    params:
      CA_CERTS: ((ca-certs))
    config:
      platform: linux
      image_resource:
        type: docker-image
        source:
          repository: alpine
          tag: latest
      inputs:
      - name: src-git
      run:
        path: src-git/install-ca-certs/alpine.sh
```

## License and Authors

- Author:: wdstar at github.com

```text
Copyright 2017, wdstar

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
