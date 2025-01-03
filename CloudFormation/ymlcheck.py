import yaml

file_path = 'network.yml'

try:
    with open(cd /Users/joya/astroTask1/Cloudformation/network.yaml, 'r') as file:
        yaml.safe_load(file)
    print("YAML syntax is valid.")
except yaml.YAMLError as e:
    print("Error in YAML syntax:", e)
