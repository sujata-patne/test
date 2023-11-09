Helm Architecture
Helm is a package manager for Kubernetes. It allows developers and operators to easily package, configure, and deploy applications and services on Kubernetes clusters. 
Helm packages contain Kubernetes object definitions. With Helm, configuration settings are isolated from manifest files

Helm File Structure - 
package-name/
  charts/
  templates/
	NOTES.txt
	_helpers.tpl
	configmap.yaml
	deployment.yaml
	secrets.yaml
  Chart.yaml
  LICENSE
  README.md
  requirements.yaml
  values.yaml
   
charts/: Manually managed chart dependencies can be placed in this directory. However recommendation is to use the requirement.yaml file to link dependencies dynamically.
templates/: This directory contains template files that are combined with configuration values. Configuration values can be read from either values.yaml file or command line. These are then rendered into Kubernetes manifests.
Chart.yaml: A YAML file with metadata about the chart. E.g. chart name, version, maintainer etc.
LICENSE: A plaintext license for the chart.
README.md: A readme file which includes the user guide.
.helmignore - ignore file like .gitignore
requirements.yaml: A YAML file that lists the chart’s dependencies.
values.yaml: A YAML file of default configuration values for the chart.

templates/service.yaml - A basic manifest for creating a service endpoint for deployment
templates/deployment.yaml - actaul deployment file which uses values.yaml to create a chart
templates/_helpers.tpl: A place to put template helpers that you can re-use throughout the chart
templates/configMap.yaml=contains database configuration.
templates/secrets.yaml= database passwords are stored in secret file.
