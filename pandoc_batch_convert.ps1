Get-ChildItem -Recurse -Filter *.pptx | ForEach-Object {
    $outFile = $_.FullName.Replace('.pptx', '.qmd')
    Write-Host "Converting: $($_.FullName) -> $outFile"
    # quarto pandoc $_.FullName -f pdf -t markdown --wrap=none -o $outFile
    # pdftotext -layout $_.FullName $outFile
    pptx2md $_.FullName --qmd -o $outFile
}
Write-Host "Batch convert done"