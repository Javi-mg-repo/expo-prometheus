# Cargar .env como variables de entorno
Get-Content .env | ForEach-Object {
    if ($_ -match '^\s*([^#][^=]*)=(.*)$') {
        $key = $matches[1].Trim()
        $value = $matches[2].Trim()
        [Environment]::SetEnvironmentVariable($key, $value)
    }
}

# Leer el template completo
$template = Get-Content prometheus.template.yml -Raw

# Buscar todas las ocurrencias de ${VAR_NAME}
$processed = [regex]::Replace($template, '\$\{(\w+)\}', {
    param($match)
    $varName = $match.Groups[1].Value
    $envValue = [Environment]::GetEnvironmentVariable($varName)
    if (![string]::IsNullOrEmpty($envValue)) {
        return $envValue
    } else {
        Write-Warning "⚠️  La variable `$varName` no está definida en el entorno. Se dejará vacía."
        return ''
    }
})

# Guardar el resultado en prometheus.yml
$processed | Set-Content prometheus.yml -Encoding UTF8

Write-Host "`n✅ Archivo 'prometheus.yml' generado correctamente."
