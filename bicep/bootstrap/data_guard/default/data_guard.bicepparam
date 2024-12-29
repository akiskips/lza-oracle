using '../../main.bicep'

param resourceGroupName = 'rg-mh-oracle-3'

param location = 'germanywestcentral'

param virtualNetworks = [
  {
    virtualNetworkName: 'vnet4'
    addressPrefixes: [
      '10.0.0.0/16' ]
    subnetName: 'subnet1'
    addressPrefix: '10.0.0.0/24'
  } ]

param networkSecurityGroups = [
  {
    networkSecurityGroupName: 'ora01nsg'
    securityRules: []
  }
]

param virtualMachines = [
  {
    virtualMachineName: 'vm-primary-0'
    vmSize: 'Standard_D4s_v5'
    avZone: 1
    adminUsername: 'oracle'
    managedIdentities: {
      userAssignedResourceIds: [
        '/subscriptions/9c68d2ae-d3d6-4784-8e4c-7ae6ae5e0312/resourcegroups/rg-mh-oracle/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-mh'
      ]
    }
    sshPublicKey: 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO8eep97lY3XKvnFbyNZjIy8AI1lhbYtFZpRMNdEJx11 akis100@CPC-admin-1DC4C'
    dataDisks: [
      {
        caching: 'None'
        writeAcceleratorEnabled: false
        diskSizeGB: '1024'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
      {
        caching: 'None'
        diskSizeGB: '1024'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
      {
        name: 'redo'
        caching: 'ReadOnly'
        writeAcceleratorEnabled: false
        diskSizeGB: '1024'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
    ]
  }
  {
    virtualMachineName: 'vm-secondary-0'
    vmSize: 'Standard_E4ds_v5'
    avZone: 2
    adminUsername: 'oracle'
    managedIdentities: {
      userAssignedResourceIds: [
        '/subscriptions/9c68d2ae-d3d6-4784-8e4c-7ae6ae5e0312/resourcegroups/rg-mh-oracle/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mi-mh'
      ]
    }
    sshPublicKey: 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO8eep97lY3XKvnFbyNZjIy8AI1lhbYtFZpRMNdEJx11 akis100@CPC-admin-1DC4C'
    dataDisks: [
      {
        caching: 'None'
        writeAcceleratorEnabled: false
        diskSizeGB: '1024'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
      {
        caching: 'None'
        diskSizeGB: '1024'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
      {
        name: 'redo'
        caching: 'ReadOnly'
        writeAcceleratorEnabled: false
        diskSizeGB: '1024'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
    ]
  }
]

param tags = {
  environment: 'dev'
  costCenter: 'it'
}

param oracleImageReference = {
  publisher: 'oracle'
  offer: 'oracle-linux'
  sku: 'ol9-lvm-gen2'
  version: 'latest'
}


param enableTelemetry = true
param telemetryPid = '53df3afd-6e55-4930-a481-69938a5b8f0a'
