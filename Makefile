SHELL := /bin/bash

define validate_kustomization_files =
# Find all kustomization.* file into all the project and
# then use the path of the file to validate build the tempaltes
# and pass it to kubeval to be validates
for k_path in $(find . -name "kustomization.*" -print); do
	echo "Validating $k_path"
	kustomize build ${k_path%/*} | kubeval --ignore-missing-schemas -
done
endef


validate-files: ; $(value validate_kustomization_files)

.ONESHELL: