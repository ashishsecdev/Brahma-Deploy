<?php
  $command = escapeshellcmd('terra-exec.py');
  $output = shell_exec($command);
  echo "Deployed your Ansible Cluster on GCP";

?>

<script type="text/javascript">
    alert('Made by AshishSecDev!');
</script>
