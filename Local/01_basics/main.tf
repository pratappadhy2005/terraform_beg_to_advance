# Simple file resource
resource "local_file" "tf_example" {
  //filename = "01_basics/example.txt"
  filename = "${path.module}/example.txt"
  content  = "hey, this is the terraform course!"
}
