$goPath = [System.IO.Directory]::GetCurrentDirectory();
$env:GOPATH = $goPath;
$env:CGO_CPPFLAGS = "-I $goPath\src\github.com\omniscale\imposm3\includes";
$env:CGO_LDFLAGS = "-L $goPath\src\github.com\omniscale\imposm3\libs\";
echo "Downloading imposm source from 'mghadiri/imposm3-for-windows'";
go get github.com\mghadiri\imposm3-for-windows;
echo "Download finished.";
$_  = [System.IO.Directory]::CreateDirectory("$goPath\src\github.com\omniscale");
echo "Compiling imposm3 for windows";
mv $goPath\src\github.com\mghadiri\imposm3-for-windows $goPath\src\github.com\omniscale\imposm3;
go install github.com\omniscale\imposm3\cmd\imposm;
copy src\github.com\omniscale\imposm3\libs\* bin;
echo "Compile finished. Generated binaries are in '$goPath\bin'";
pause;