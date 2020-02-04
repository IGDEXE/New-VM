# Criar uma VM com Powershell
# Ivo Dias

# Configuracoes
$grupoRecursos = "MeuGrupoDeRecursos"
$rgLocalizacao = "EastUs"

# Conecta no Azure
Connect-AzAccount

# Credenciais da VM
$vmCredential = Get-Credential -Message "Informe um usuario e senha para a VM."

# Criar um grupo de recursos
New-AzResourceGroup -Name $grupoRecursos -Location $rgLocalizacao

# Cria uma nova maquina virtual
New-AzVm `
    -ResourceGroupName "$grupoRecursos" `
    -Name "MyVM" `
    -Location $rgLocalizacao `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "MyNetworkSecurityGroup" `
    -PublicIpAddressName "MyPublicIpAddress" `
    -OpenPorts 80,3389 `
    -Credential $vmCredential

# Conecta na VM
$ipVM = Get-AzPublicIpAddress -ResourceGroupName $grupoRecursos | Select-Object "IpAddress"
mstsc /v:$ipVM

# Remove o grupo de recursos
Remove-AzResourceGroup -Name myResourceGroup