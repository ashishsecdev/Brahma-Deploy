from python_terraform import *

terra = Terraform(working_dir='<///Path-of-your-Terraform-Project///')

tfinit - terra.init()
#t = terra.plan() If you want to plan and get the ouput first.
tfapply = terra.apply(skip_plan=True)
#out = terra.output()
#destroy= terra.destroy()
#print(tfapply) 
#print(out) - Print output.

