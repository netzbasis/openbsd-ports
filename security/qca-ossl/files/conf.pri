# qconf

LIBS += -lssl -lcrypto

CONFIG += release crypto

target.path = ${WRKINST}${MODQT4_LIBDIR}/plugins/crypto
INSTALLS += target
