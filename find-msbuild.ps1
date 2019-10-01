function Find-MsBuild()
{
    # 2017, 2019
    $msbuild = Resolve-Path "${env:ProgramFiles(x86)}\Microsoft Visual Studio\*\*\MSBuild\*\bin\msbuild.exe" -EA 0
    If ((Test-Path $msbuild)) { return $msbuild } 

    # 2013 (12.0), 2015 (14.0)
    $msbuild = Resolve-Path "${Env:ProgramFiles(x86)}\MSBuild\*\Bin\MSBuild.exe" -EA 0
    If ((Test-Path $msbuild)) { return $msbuild } 

    # 4.0
    $msbuild = "${env:WinDir}\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
    If (Test-Path $msbuild) { return $msbuild } 

    throw "Unable to find msbuild"
}
