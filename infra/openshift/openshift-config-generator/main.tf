resource "terraform_data" "generate-openshift-generated" {
  provisioner "local-exec" {
    interpreter = [ "bash", "-ceu"]
    command = <<-EOL
      if [ ! -f ${path.root}/openshift-binaries/openshift-install ]; then
        echo "openshift-install not found in openshift-binaries!"
        exit 1
      fi
      if [ ! -f ${path.root}/openshift-binaries/oc ]; then
        echo "OpenShift Client (oc) not found in openshift-binaries!"
        exit 1
      fi
      if [ ! -f ${path.root}/openshift-configs/install-config.yaml ]; then
        echo "install-config.yaml not found! in openshift-configs"
        exit 1
      fi
      rm ${path.root}/openshift-generated/*.ign
      cp ${path.root}/openshift-configs/install-config.yaml ${path.root}/openshift-generated/install-config.yaml
      ${path.root}/openshift-binaries/openshift-install create manifests --dir ${path.root}/openshift-generated
      sed -i 's/true/false/g' ${path.root}/openshift-generated/manifests/cluster-scheduler-02-config.yml
      ${path.root}/openshift-binaries/openshift-install create ignition-configs --dir ${path.root}/openshift-generated
      echo $?
    EOL
  }
}

resource "terraform_data" "cleanup" {
  provisioner "local-exec" {
    command = <<-EOL
      echo "Destroying OpenShift files..."
      cd ${path.root}/openshift-generated
      rm install-config.yaml
      rm openshift-install*
      rm .openshift_install*
      rm metadata.json
      rm -rf manifests
      rm -rf openshift
      rm -rf auth
    EOL
    when = destroy
  }
}