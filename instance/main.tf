
resource "aws_instance" "example" {
  count         = 6
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
}

/*
# Create snapshots for the attached volumes of each instance
resource "aws_ebs_snapshot" "instance_snapshots" {
  count = length(aws_instance.example) * length(aws_instance.example[*].ebs_block_device)

  # Extract instance ID and volume ID using nested for loop
  volume_id = aws_instance.example[count.index / length(aws_instance.example)].ebs_block_device[count.index % length(aws_instance.example[*].ebs_block_device)].volume_id
}

output "snapshot_ids" {
  value = aws_ebs_snapshot.instance_snapshots[*].id
}

/*
resource "aws_ebs_snapshot" "instance_snapshots" {
  count = length(aws_instance.example[*].ebs_block_device)

  volume_id = aws_instance.example[count.index % 5].ebs_block_device[count.index % 6].volume_id
}


output "snapshot_ids" {
  value = aws_ebs_snapshot.instance_snapshots[*].id
}

*/