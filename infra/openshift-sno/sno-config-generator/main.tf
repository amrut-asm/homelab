resource "terraform_data" "generate-sno-generated" {
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
      if [ ! -f ${path.root}/sno-configs/install-config.yaml ]; then
        echo "install-config.yaml not found! in sno-configs"
        exit 1
      fi
      rm ${path.root}/sno-generated/*.ign
      cp ${path.root}/sno-configs/install-config.yaml ${path.root}/sno-generated/install-config.yaml
      ${path.root}/openshift-binaries/openshift-install create manifests --dir ${path.root}/sno-generated
      ${path.root}/openshift-binaries/openshift-install create single-node-ignition-config --dir ${path.root}/sno-generated
      echo $?
      podman run --privileged --pull always --rm -v /dev:/dev -v /run/udev:/run/udev -v $PWD:/data -w /data quay.io/coreos/coreos-installer:release iso ignition embed -fi ${path.root}/sno-generated/bootstrap-in-place-for-live-iso.ign ${path.root}/images/fcos-live.iso
    EOL
  }
}

resource "terraform_data" "cleanup" {
  provisioner "local-exec" {
    command = <<-EOL
      echo "Destroying OpenShift files..."
      cd ${path.root}/sno-generated
      rm install-config.yaml
      rm openshift-install*
      rm .openshift_install*
      rm metadata.json
      rm -rf manifests
      rm -rf openshift
      rm -rf auth
      rm *.yaml
    EOL
    when = destroy
  }
}
