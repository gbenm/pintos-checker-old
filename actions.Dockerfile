from ubuntu:16.04

workdir /root/pintos

run apt update --fix-missing
run apt install apt-utils -y
run apt upgrade -y
run apt install -y python3 build-essential qemu qemu-kvm
env PATH=$PATH:/root/pintos/utils
arg phase
env PINTOSPH=$phase
add . .
run echo $PINTOSPH
run cd /root/pintos/$PINTOSPH && make && make grade
run echo "#/bin/bash\nGRADE=\`cat /root/pintos/\$PINTOSPH/build/grade\` && GRADE=\"\${GRADE//'%'/'%25'}\" && echo \$GRADE && GRADE=\"\${GRADE//$'\\n'/'%0A'}\" && GRADE=\"\${GRADE//$'\\r'/'%0D'}\" && echo \"::set-output name=results::\$GRADE\"" | tee builder.sh && chmod +x builder.sh
run ["bash", "builder.sh"]


