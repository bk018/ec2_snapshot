
data "aws_ebs_volumes" "all_volumes" {}

# Create snapshots for all volumes
resource "aws_ebs_snapshot" "all_snapshots" {
  count = length(data.aws_ebs_volumes.all_volumes.ids)

  volume_id = data.aws_ebs_volumes.all_volumes.ids[count.index]
}