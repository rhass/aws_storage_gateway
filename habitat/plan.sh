pkg_name=aws_storage_gateway
pkg_description="AWS Storage Gateway"
pkg_origin=invalidchecksum
pkg_version=1.2.5.0
pkg_maintainer="Ryan Hass <rhass@users.noreply.github.com>"
pkg_license=('Apache-2.0')
pkg_source=https://dslbbkfzjw91h.cloudfront.net/AWS-Storage-Gateway-File.zip
pkg_filename=AWS-Storage-Gateway-File.zip
pkg_shasum=a21810c93771f500909015253d60b9e049def3c45954f30089fd11dd1ac2c003
pkg_build_deps=('core/7zip')
pkg_deps=('core/glibc' 'core/jdk8')
pkg_exports=(
  [http_port]=http.standard_port
  [http_alt_port]=http.alt_port
)
pkg_exposes=(http_port http_alt_port)

do_unpack() {
  7z x -o $HAB_CACHE_SRC_PATH $HAB_CACHE_SRC_PATH/$pkg_filename
  7z x -o$HAB_CACHE_SRC_PATH $HAB_CACHE_SRC_PATH/AWS-Storage-Gateway-File.ova *.vmdk
  7z x -o$HAB_CACHE_SRC_PATH $HAB_CACHE_SRC_PATH/*.vmdk Linux.img 
  7z x -o$HAB_CACHE_SRC_PATH Linux.img usr/local/aws-storage-gateway
}

do_install() {
  mv $HAB_CACHE_SRC_PATH/usr/local/aws-storage-gateway $pkg_prefix
}
