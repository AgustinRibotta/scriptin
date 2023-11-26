#!/usr/bin/env python3

import os
import subprocess
import time  

""" import threading """
"""Requests"""
"""Paramiko"""

# Django djangorestframework unipath pillow
def generate_environment():
    """Generation of the virtual environment"""
    
    environment_path = "/app"
    environment_name = "my_environment"
    
    # Check if the varibale exists
    if not environment_name or not environment_path:
        print('Please configure environment_name and environment_path variables.')
        return None
    
    # Check if environment directory exists
    if os.path.exists(f'{environment_path}/{environment_name}'):
        print('A directory with that name already exists.')
        return environment_path, environment_name
    
    # Command to create environment
    environment = f'python -m venv {environment_path}/{environment_name}'

    # Execute the command to create environment
    create = subprocess.run(environment, shell=True, stderr=subprocess.PIPE, text=True, check=False)

    if create.stderr:
        print(create.stderr)
        return None
    
    print('The virtual environment was created successfully.')
     
    return environment_path, environment_name


def activate_environment(path, name):
    """Activation and installation of dependencies"""
    
    dependencies = "django"
    
    # Check if directory exists
    if not os.path.exists(f'{path}/{name}/bin'):
        print('The environment cannot be activated because the script folder does not exist.')
        return None
    
    os.chdir(f'{path}/{name}/bin')
    
    # Command to activate the virtual environment on Windows
    activate_windows = 'source activate'

    # If it n Windows systems
    activate = subprocess.run(activate_windows, shell=True, stderr=subprocess.PIPE, text=True, check=False)

    if activate.stderr:
        return print('Failed to activate the virtual environment.')
    else:
        print('The virtual environment was activated successfully.')

    # Wait for a moment to ensure the environment is fully activated
    time.sleep(2)
    
    # Check if the dependencies
    if not dependencies:
        print('There are no dependencies to install')
        return None
        
    install_dependencies = f'pip install {dependencies}'
    
    install = subprocess.run(install_dependencies, shell=True, stderr=subprocess.PIPE, text=True, check=False)

    if install.stderr:
        return print(f'Failed to install dependencies {dependencies}')

    print("The dependencies were installed correctly")

    return True
 
""" Hasta este punto el codigo esta funcional """

# def generate_proyect_django():
#     """Project django creation"""
    
#     path_proyecto ='D:/Programacion/Curso/pruebas/'
#     name_proyect ='prueba1'
    
#     # Check if the varibale exists
#     if not path_proyecto or not name_proyect:
#         print('Please configure path_proyecto and name_proyect variables.')
#         return False
    
#     # Check if directory exists
#     if os.path.exists(f'{path_proyecto}/{name_proyect}'):
#         print ('A directory with that name already exists')
#         return False

#     os.chdir(path_proyecto)
    
#     create_proyect = f'django-admin startproyect {name_proyect}'
    
#     create = subprocess.run(create_proyect, shell=True)

if __name__ == "__main__":
    env_info = generate_environment()
    if env_info:
        path, name = env_info
        activate_environment(path, name)
