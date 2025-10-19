SCRIPTS =\
	stagit-hook\
	stagit-hook-hook\
	stagit-hook-install\

PREFIX = /usr/local/
MANPREFIX = ${PREFIX}/man

install:
.for s in ${SCRIPTS}
	install -o root -g bin -m 755 $s ${PREFIX}/bin/$s
.endfor
	install -o root -g bin -m 644 stagit-hook.1 ${MANPREFIX}/man1/stagit-hook.1 
	install -o root -g bin -m 644 stagit-hook.5 ${MANPREFIX}/man5/stagit-hook.5
	makewhatis -d ${MANPREFIX} ${MANPREFIX}/man1/stagit-hook.1 ${MANPREFIX}/man5/stagit-hook.5

uninstall:
.for s in ${SCRIPTS}
	rm -f /usr/local/bin/$s
.endfor
	rm -f ${MANPREFIX}/man1/stagit-hook.1 ${MANPREFIX}/man5/stagit-hook.5
