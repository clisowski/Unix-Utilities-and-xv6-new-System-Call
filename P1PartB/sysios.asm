
_sysios:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"
#include "stat.h"

int main (int argc, char *argv[]){
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 28             	sub    $0x28,%esp
  18:	8b 41 04             	mov    0x4(%ecx),%eax
	int val;

	if (argc != 3){
  1b:	83 39 03             	cmpl   $0x3,(%ecx)
  1e:	75 1b                	jne    3b <main+0x3b>
		exit();
		}

	char buff[10];
        struct iostat test;
	test.readcount = 0;
  20:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
	test.writecount = 0; 
  27:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)

	int m = (int) argv[1];
  2e:	8b 78 04             	mov    0x4(%eax),%edi
	int n = (int) argv[2];
  31:	8b 70 08             	mov    0x8(%eax),%esi

	for (int i = 0; i < m; i++){
  34:	bb 00 00 00 00       	mov    $0x0,%ebx
  39:	eb 1b                	jmp    56 <main+0x56>
		exit();
  3b:	e8 19 02 00 00       	call   259 <exit>
		read(1, buff, 5);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 05                	push   $0x5
  45:	8d 45 de             	lea    -0x22(%ebp),%eax
  48:	50                   	push   %eax
  49:	6a 01                	push   $0x1
  4b:	e8 21 02 00 00       	call   271 <read>
	for (int i = 0; i < m; i++){
  50:	83 c3 01             	add    $0x1,%ebx
  53:	83 c4 10             	add    $0x10,%esp
  56:	39 fb                	cmp    %edi,%ebx
  58:	7c e6                	jl     40 <main+0x40>
		}

	for (int j = 0; j < n; j++){
  5a:	bb 00 00 00 00       	mov    $0x0,%ebx
  5f:	eb 16                	jmp    77 <main+0x77>
		write(1, buff, 5);
  61:	83 ec 04             	sub    $0x4,%esp
  64:	6a 05                	push   $0x5
  66:	8d 45 de             	lea    -0x22(%ebp),%eax
  69:	50                   	push   %eax
  6a:	6a 01                	push   $0x1
  6c:	e8 08 02 00 00       	call   279 <write>
	for (int j = 0; j < n; j++){
  71:	83 c3 01             	add    $0x1,%ebx
  74:	83 c4 10             	add    $0x10,%esp
  77:	39 f3                	cmp    %esi,%ebx
  79:	7c e6                	jl     61 <main+0x61>
		}

	val = getiocounts(&test);
  7b:	83 ec 0c             	sub    $0xc,%esp
  7e:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  81:	50                   	push   %eax
  82:	e8 72 02 00 00       	call   2f9 <getiocounts>
	printf(1, "%d", val);
  87:	83 c4 0c             	add    $0xc,%esp
  8a:	50                   	push   %eax
  8b:	68 60 06 00 00       	push   $0x660
  90:	6a 01                	push   $0x1
  92:	e8 0b 03 00 00       	call   3a2 <printf>
	exit();
  97:	e8 bd 01 00 00       	call   259 <exit>

0000009c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  9c:	f3 0f 1e fb          	endbr32 
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
  a5:	8b 75 08             	mov    0x8(%ebp),%esi
  a8:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ab:	89 f0                	mov    %esi,%eax
  ad:	89 d1                	mov    %edx,%ecx
  af:	83 c2 01             	add    $0x1,%edx
  b2:	89 c3                	mov    %eax,%ebx
  b4:	83 c0 01             	add    $0x1,%eax
  b7:	0f b6 09             	movzbl (%ecx),%ecx
  ba:	88 0b                	mov    %cl,(%ebx)
  bc:	84 c9                	test   %cl,%cl
  be:	75 ed                	jne    ad <strcpy+0x11>
    ;
  return os;
}
  c0:	89 f0                	mov    %esi,%eax
  c2:	5b                   	pop    %ebx
  c3:	5e                   	pop    %esi
  c4:	5d                   	pop    %ebp
  c5:	c3                   	ret    

000000c6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c6:	f3 0f 1e fb          	endbr32 
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  cd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  d0:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  d3:	0f b6 01             	movzbl (%ecx),%eax
  d6:	84 c0                	test   %al,%al
  d8:	74 0c                	je     e6 <strcmp+0x20>
  da:	3a 02                	cmp    (%edx),%al
  dc:	75 08                	jne    e6 <strcmp+0x20>
    p++, q++;
  de:	83 c1 01             	add    $0x1,%ecx
  e1:	83 c2 01             	add    $0x1,%edx
  e4:	eb ed                	jmp    d3 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  e6:	0f b6 c0             	movzbl %al,%eax
  e9:	0f b6 12             	movzbl (%edx),%edx
  ec:	29 d0                	sub    %edx,%eax
}
  ee:	5d                   	pop    %ebp
  ef:	c3                   	ret    

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  fa:	b8 00 00 00 00       	mov    $0x0,%eax
  ff:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 103:	74 05                	je     10a <strlen+0x1a>
 105:	83 c0 01             	add    $0x1,%eax
 108:	eb f5                	jmp    ff <strlen+0xf>
    ;
  return n;
}
 10a:	5d                   	pop    %ebp
 10b:	c3                   	ret    

0000010c <memset>:

void*
memset(void *dst, int c, uint n)
{
 10c:	f3 0f 1e fb          	endbr32 
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	89 d7                	mov    %edx,%edi
 119:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11c:	8b 45 0c             	mov    0xc(%ebp),%eax
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    

00000127 <strchr>:

char*
strchr(const char *s, char c)
{
 127:	f3 0f 1e fb          	endbr32 
 12b:	55                   	push   %ebp
 12c:	89 e5                	mov    %esp,%ebp
 12e:	8b 45 08             	mov    0x8(%ebp),%eax
 131:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 135:	0f b6 10             	movzbl (%eax),%edx
 138:	84 d2                	test   %dl,%dl
 13a:	74 09                	je     145 <strchr+0x1e>
    if(*s == c)
 13c:	38 ca                	cmp    %cl,%dl
 13e:	74 0a                	je     14a <strchr+0x23>
  for(; *s; s++)
 140:	83 c0 01             	add    $0x1,%eax
 143:	eb f0                	jmp    135 <strchr+0xe>
      return (char*)s;
  return 0;
 145:	b8 00 00 00 00       	mov    $0x0,%eax
}
 14a:	5d                   	pop    %ebp
 14b:	c3                   	ret    

0000014c <gets>:

char*
gets(char *buf, int max)
{
 14c:	f3 0f 1e fb          	endbr32 
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
 155:	53                   	push   %ebx
 156:	83 ec 1c             	sub    $0x1c,%esp
 159:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 15c:	bb 00 00 00 00       	mov    $0x0,%ebx
 161:	89 de                	mov    %ebx,%esi
 163:	83 c3 01             	add    $0x1,%ebx
 166:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 169:	7d 2e                	jge    199 <gets+0x4d>
    cc = read(0, &c, 1);
 16b:	83 ec 04             	sub    $0x4,%esp
 16e:	6a 01                	push   $0x1
 170:	8d 45 e7             	lea    -0x19(%ebp),%eax
 173:	50                   	push   %eax
 174:	6a 00                	push   $0x0
 176:	e8 f6 00 00 00       	call   271 <read>
    if(cc < 1)
 17b:	83 c4 10             	add    $0x10,%esp
 17e:	85 c0                	test   %eax,%eax
 180:	7e 17                	jle    199 <gets+0x4d>
      break;
    buf[i++] = c;
 182:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 186:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 189:	3c 0a                	cmp    $0xa,%al
 18b:	0f 94 c2             	sete   %dl
 18e:	3c 0d                	cmp    $0xd,%al
 190:	0f 94 c0             	sete   %al
 193:	08 c2                	or     %al,%dl
 195:	74 ca                	je     161 <gets+0x15>
    buf[i++] = c;
 197:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 199:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 19d:	89 f8                	mov    %edi,%eax
 19f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1a2:	5b                   	pop    %ebx
 1a3:	5e                   	pop    %esi
 1a4:	5f                   	pop    %edi
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    

000001a7 <stat>:

int
stat(const char *n, struct stat *st)
{
 1a7:	f3 0f 1e fb          	endbr32 
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	56                   	push   %esi
 1af:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b0:	83 ec 08             	sub    $0x8,%esp
 1b3:	6a 00                	push   $0x0
 1b5:	ff 75 08             	pushl  0x8(%ebp)
 1b8:	e8 dc 00 00 00       	call   299 <open>
  if(fd < 0)
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	85 c0                	test   %eax,%eax
 1c2:	78 24                	js     1e8 <stat+0x41>
 1c4:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1c6:	83 ec 08             	sub    $0x8,%esp
 1c9:	ff 75 0c             	pushl  0xc(%ebp)
 1cc:	50                   	push   %eax
 1cd:	e8 df 00 00 00       	call   2b1 <fstat>
 1d2:	89 c6                	mov    %eax,%esi
  close(fd);
 1d4:	89 1c 24             	mov    %ebx,(%esp)
 1d7:	e8 a5 00 00 00       	call   281 <close>
  return r;
 1dc:	83 c4 10             	add    $0x10,%esp
}
 1df:	89 f0                	mov    %esi,%eax
 1e1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e4:	5b                   	pop    %ebx
 1e5:	5e                   	pop    %esi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    
    return -1;
 1e8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1ed:	eb f0                	jmp    1df <stat+0x38>

000001ef <atoi>:

int
atoi(const char *s)
{
 1ef:	f3 0f 1e fb          	endbr32 
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	53                   	push   %ebx
 1f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1fa:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1ff:	0f b6 01             	movzbl (%ecx),%eax
 202:	8d 58 d0             	lea    -0x30(%eax),%ebx
 205:	80 fb 09             	cmp    $0x9,%bl
 208:	77 12                	ja     21c <atoi+0x2d>
    n = n*10 + *s++ - '0';
 20a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 20d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 210:	83 c1 01             	add    $0x1,%ecx
 213:	0f be c0             	movsbl %al,%eax
 216:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 21a:	eb e3                	jmp    1ff <atoi+0x10>
  return n;
}
 21c:	89 d0                	mov    %edx,%eax
 21e:	5b                   	pop    %ebx
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    

00000221 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 221:	f3 0f 1e fb          	endbr32 
 225:	55                   	push   %ebp
 226:	89 e5                	mov    %esp,%ebp
 228:	56                   	push   %esi
 229:	53                   	push   %ebx
 22a:	8b 75 08             	mov    0x8(%ebp),%esi
 22d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 230:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 233:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 235:	8d 58 ff             	lea    -0x1(%eax),%ebx
 238:	85 c0                	test   %eax,%eax
 23a:	7e 0f                	jle    24b <memmove+0x2a>
    *dst++ = *src++;
 23c:	0f b6 01             	movzbl (%ecx),%eax
 23f:	88 02                	mov    %al,(%edx)
 241:	8d 49 01             	lea    0x1(%ecx),%ecx
 244:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 247:	89 d8                	mov    %ebx,%eax
 249:	eb ea                	jmp    235 <memmove+0x14>
  return vdst;
}
 24b:	89 f0                	mov    %esi,%eax
 24d:	5b                   	pop    %ebx
 24e:	5e                   	pop    %esi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    

00000251 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 251:	b8 01 00 00 00       	mov    $0x1,%eax
 256:	cd 40                	int    $0x40
 258:	c3                   	ret    

00000259 <exit>:
SYSCALL(exit)
 259:	b8 02 00 00 00       	mov    $0x2,%eax
 25e:	cd 40                	int    $0x40
 260:	c3                   	ret    

00000261 <wait>:
SYSCALL(wait)
 261:	b8 03 00 00 00       	mov    $0x3,%eax
 266:	cd 40                	int    $0x40
 268:	c3                   	ret    

00000269 <pipe>:
SYSCALL(pipe)
 269:	b8 04 00 00 00       	mov    $0x4,%eax
 26e:	cd 40                	int    $0x40
 270:	c3                   	ret    

00000271 <read>:
SYSCALL(read)
 271:	b8 05 00 00 00       	mov    $0x5,%eax
 276:	cd 40                	int    $0x40
 278:	c3                   	ret    

00000279 <write>:
SYSCALL(write)
 279:	b8 10 00 00 00       	mov    $0x10,%eax
 27e:	cd 40                	int    $0x40
 280:	c3                   	ret    

00000281 <close>:
SYSCALL(close)
 281:	b8 15 00 00 00       	mov    $0x15,%eax
 286:	cd 40                	int    $0x40
 288:	c3                   	ret    

00000289 <kill>:
SYSCALL(kill)
 289:	b8 06 00 00 00       	mov    $0x6,%eax
 28e:	cd 40                	int    $0x40
 290:	c3                   	ret    

00000291 <exec>:
SYSCALL(exec)
 291:	b8 07 00 00 00       	mov    $0x7,%eax
 296:	cd 40                	int    $0x40
 298:	c3                   	ret    

00000299 <open>:
SYSCALL(open)
 299:	b8 0f 00 00 00       	mov    $0xf,%eax
 29e:	cd 40                	int    $0x40
 2a0:	c3                   	ret    

000002a1 <mknod>:
SYSCALL(mknod)
 2a1:	b8 11 00 00 00       	mov    $0x11,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <unlink>:
SYSCALL(unlink)
 2a9:	b8 12 00 00 00       	mov    $0x12,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <fstat>:
SYSCALL(fstat)
 2b1:	b8 08 00 00 00       	mov    $0x8,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <link>:
SYSCALL(link)
 2b9:	b8 13 00 00 00       	mov    $0x13,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <mkdir>:
SYSCALL(mkdir)
 2c1:	b8 14 00 00 00       	mov    $0x14,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <chdir>:
SYSCALL(chdir)
 2c9:	b8 09 00 00 00       	mov    $0x9,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <dup>:
SYSCALL(dup)
 2d1:	b8 0a 00 00 00       	mov    $0xa,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <getpid>:
SYSCALL(getpid)
 2d9:	b8 0b 00 00 00       	mov    $0xb,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <sbrk>:
SYSCALL(sbrk)
 2e1:	b8 0c 00 00 00       	mov    $0xc,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <sleep>:
SYSCALL(sleep)
 2e9:	b8 0d 00 00 00       	mov    $0xd,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <uptime>:
SYSCALL(uptime)
 2f1:	b8 0e 00 00 00       	mov    $0xe,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <getiocounts>:
SYSCALL(getiocounts)
 2f9:	b8 16 00 00 00       	mov    $0x16,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 301:	55                   	push   %ebp
 302:	89 e5                	mov    %esp,%ebp
 304:	83 ec 1c             	sub    $0x1c,%esp
 307:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 30a:	6a 01                	push   $0x1
 30c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 30f:	52                   	push   %edx
 310:	50                   	push   %eax
 311:	e8 63 ff ff ff       	call   279 <write>
}
 316:	83 c4 10             	add    $0x10,%esp
 319:	c9                   	leave  
 31a:	c3                   	ret    

0000031b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 31b:	55                   	push   %ebp
 31c:	89 e5                	mov    %esp,%ebp
 31e:	57                   	push   %edi
 31f:	56                   	push   %esi
 320:	53                   	push   %ebx
 321:	83 ec 2c             	sub    $0x2c,%esp
 324:	89 45 d0             	mov    %eax,-0x30(%ebp)
 327:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 329:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 32d:	0f 95 c2             	setne  %dl
 330:	89 f0                	mov    %esi,%eax
 332:	c1 e8 1f             	shr    $0x1f,%eax
 335:	84 c2                	test   %al,%dl
 337:	74 42                	je     37b <printint+0x60>
    neg = 1;
    x = -xx;
 339:	f7 de                	neg    %esi
    neg = 1;
 33b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 342:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 347:	89 f0                	mov    %esi,%eax
 349:	ba 00 00 00 00       	mov    $0x0,%edx
 34e:	f7 f1                	div    %ecx
 350:	89 df                	mov    %ebx,%edi
 352:	83 c3 01             	add    $0x1,%ebx
 355:	0f b6 92 6c 06 00 00 	movzbl 0x66c(%edx),%edx
 35c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 360:	89 f2                	mov    %esi,%edx
 362:	89 c6                	mov    %eax,%esi
 364:	39 d1                	cmp    %edx,%ecx
 366:	76 df                	jbe    347 <printint+0x2c>
  if(neg)
 368:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 36c:	74 2f                	je     39d <printint+0x82>
    buf[i++] = '-';
 36e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 373:	8d 5f 02             	lea    0x2(%edi),%ebx
 376:	8b 75 d0             	mov    -0x30(%ebp),%esi
 379:	eb 15                	jmp    390 <printint+0x75>
  neg = 0;
 37b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 382:	eb be                	jmp    342 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 384:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 389:	89 f0                	mov    %esi,%eax
 38b:	e8 71 ff ff ff       	call   301 <putc>
  while(--i >= 0)
 390:	83 eb 01             	sub    $0x1,%ebx
 393:	79 ef                	jns    384 <printint+0x69>
}
 395:	83 c4 2c             	add    $0x2c,%esp
 398:	5b                   	pop    %ebx
 399:	5e                   	pop    %esi
 39a:	5f                   	pop    %edi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3a0:	eb ee                	jmp    390 <printint+0x75>

000003a2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3a2:	f3 0f 1e fb          	endbr32 
 3a6:	55                   	push   %ebp
 3a7:	89 e5                	mov    %esp,%ebp
 3a9:	57                   	push   %edi
 3aa:	56                   	push   %esi
 3ab:	53                   	push   %ebx
 3ac:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3af:	8d 45 10             	lea    0x10(%ebp),%eax
 3b2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3b5:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3ba:	bb 00 00 00 00       	mov    $0x0,%ebx
 3bf:	eb 14                	jmp    3d5 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3c1:	89 fa                	mov    %edi,%edx
 3c3:	8b 45 08             	mov    0x8(%ebp),%eax
 3c6:	e8 36 ff ff ff       	call   301 <putc>
 3cb:	eb 05                	jmp    3d2 <printf+0x30>
      }
    } else if(state == '%'){
 3cd:	83 fe 25             	cmp    $0x25,%esi
 3d0:	74 25                	je     3f7 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 3d2:	83 c3 01             	add    $0x1,%ebx
 3d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3dc:	84 c0                	test   %al,%al
 3de:	0f 84 23 01 00 00    	je     507 <printf+0x165>
    c = fmt[i] & 0xff;
 3e4:	0f be f8             	movsbl %al,%edi
 3e7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3ea:	85 f6                	test   %esi,%esi
 3ec:	75 df                	jne    3cd <printf+0x2b>
      if(c == '%'){
 3ee:	83 f8 25             	cmp    $0x25,%eax
 3f1:	75 ce                	jne    3c1 <printf+0x1f>
        state = '%';
 3f3:	89 c6                	mov    %eax,%esi
 3f5:	eb db                	jmp    3d2 <printf+0x30>
      if(c == 'd'){
 3f7:	83 f8 64             	cmp    $0x64,%eax
 3fa:	74 49                	je     445 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 3fc:	83 f8 78             	cmp    $0x78,%eax
 3ff:	0f 94 c1             	sete   %cl
 402:	83 f8 70             	cmp    $0x70,%eax
 405:	0f 94 c2             	sete   %dl
 408:	08 d1                	or     %dl,%cl
 40a:	75 63                	jne    46f <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 40c:	83 f8 73             	cmp    $0x73,%eax
 40f:	0f 84 84 00 00 00    	je     499 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 415:	83 f8 63             	cmp    $0x63,%eax
 418:	0f 84 b7 00 00 00    	je     4d5 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 41e:	83 f8 25             	cmp    $0x25,%eax
 421:	0f 84 cc 00 00 00    	je     4f3 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 427:	ba 25 00 00 00       	mov    $0x25,%edx
 42c:	8b 45 08             	mov    0x8(%ebp),%eax
 42f:	e8 cd fe ff ff       	call   301 <putc>
        putc(fd, c);
 434:	89 fa                	mov    %edi,%edx
 436:	8b 45 08             	mov    0x8(%ebp),%eax
 439:	e8 c3 fe ff ff       	call   301 <putc>
      }
      state = 0;
 43e:	be 00 00 00 00       	mov    $0x0,%esi
 443:	eb 8d                	jmp    3d2 <printf+0x30>
        printint(fd, *ap, 10, 1);
 445:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 448:	8b 17                	mov    (%edi),%edx
 44a:	83 ec 0c             	sub    $0xc,%esp
 44d:	6a 01                	push   $0x1
 44f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 454:	8b 45 08             	mov    0x8(%ebp),%eax
 457:	e8 bf fe ff ff       	call   31b <printint>
        ap++;
 45c:	83 c7 04             	add    $0x4,%edi
 45f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 462:	83 c4 10             	add    $0x10,%esp
      state = 0;
 465:	be 00 00 00 00       	mov    $0x0,%esi
 46a:	e9 63 ff ff ff       	jmp    3d2 <printf+0x30>
        printint(fd, *ap, 16, 0);
 46f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 472:	8b 17                	mov    (%edi),%edx
 474:	83 ec 0c             	sub    $0xc,%esp
 477:	6a 00                	push   $0x0
 479:	b9 10 00 00 00       	mov    $0x10,%ecx
 47e:	8b 45 08             	mov    0x8(%ebp),%eax
 481:	e8 95 fe ff ff       	call   31b <printint>
        ap++;
 486:	83 c7 04             	add    $0x4,%edi
 489:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 48c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 48f:	be 00 00 00 00       	mov    $0x0,%esi
 494:	e9 39 ff ff ff       	jmp    3d2 <printf+0x30>
        s = (char*)*ap;
 499:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 49c:	8b 30                	mov    (%eax),%esi
        ap++;
 49e:	83 c0 04             	add    $0x4,%eax
 4a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4a4:	85 f6                	test   %esi,%esi
 4a6:	75 28                	jne    4d0 <printf+0x12e>
          s = "(null)";
 4a8:	be 63 06 00 00       	mov    $0x663,%esi
 4ad:	8b 7d 08             	mov    0x8(%ebp),%edi
 4b0:	eb 0d                	jmp    4bf <printf+0x11d>
          putc(fd, *s);
 4b2:	0f be d2             	movsbl %dl,%edx
 4b5:	89 f8                	mov    %edi,%eax
 4b7:	e8 45 fe ff ff       	call   301 <putc>
          s++;
 4bc:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4bf:	0f b6 16             	movzbl (%esi),%edx
 4c2:	84 d2                	test   %dl,%dl
 4c4:	75 ec                	jne    4b2 <printf+0x110>
      state = 0;
 4c6:	be 00 00 00 00       	mov    $0x0,%esi
 4cb:	e9 02 ff ff ff       	jmp    3d2 <printf+0x30>
 4d0:	8b 7d 08             	mov    0x8(%ebp),%edi
 4d3:	eb ea                	jmp    4bf <printf+0x11d>
        putc(fd, *ap);
 4d5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d8:	0f be 17             	movsbl (%edi),%edx
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
 4de:	e8 1e fe ff ff       	call   301 <putc>
        ap++;
 4e3:	83 c7 04             	add    $0x4,%edi
 4e6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4e9:	be 00 00 00 00       	mov    $0x0,%esi
 4ee:	e9 df fe ff ff       	jmp    3d2 <printf+0x30>
        putc(fd, c);
 4f3:	89 fa                	mov    %edi,%edx
 4f5:	8b 45 08             	mov    0x8(%ebp),%eax
 4f8:	e8 04 fe ff ff       	call   301 <putc>
      state = 0;
 4fd:	be 00 00 00 00       	mov    $0x0,%esi
 502:	e9 cb fe ff ff       	jmp    3d2 <printf+0x30>
    }
  }
}
 507:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50a:	5b                   	pop    %ebx
 50b:	5e                   	pop    %esi
 50c:	5f                   	pop    %edi
 50d:	5d                   	pop    %ebp
 50e:	c3                   	ret    

0000050f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 50f:	f3 0f 1e fb          	endbr32 
 513:	55                   	push   %ebp
 514:	89 e5                	mov    %esp,%ebp
 516:	57                   	push   %edi
 517:	56                   	push   %esi
 518:	53                   	push   %ebx
 519:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 51c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 51f:	a1 18 09 00 00       	mov    0x918,%eax
 524:	eb 02                	jmp    528 <free+0x19>
 526:	89 d0                	mov    %edx,%eax
 528:	39 c8                	cmp    %ecx,%eax
 52a:	73 04                	jae    530 <free+0x21>
 52c:	39 08                	cmp    %ecx,(%eax)
 52e:	77 12                	ja     542 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 530:	8b 10                	mov    (%eax),%edx
 532:	39 c2                	cmp    %eax,%edx
 534:	77 f0                	ja     526 <free+0x17>
 536:	39 c8                	cmp    %ecx,%eax
 538:	72 08                	jb     542 <free+0x33>
 53a:	39 ca                	cmp    %ecx,%edx
 53c:	77 04                	ja     542 <free+0x33>
 53e:	89 d0                	mov    %edx,%eax
 540:	eb e6                	jmp    528 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 542:	8b 73 fc             	mov    -0x4(%ebx),%esi
 545:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 548:	8b 10                	mov    (%eax),%edx
 54a:	39 d7                	cmp    %edx,%edi
 54c:	74 19                	je     567 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 54e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 551:	8b 50 04             	mov    0x4(%eax),%edx
 554:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 557:	39 ce                	cmp    %ecx,%esi
 559:	74 1b                	je     576 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 55b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 55d:	a3 18 09 00 00       	mov    %eax,0x918
}
 562:	5b                   	pop    %ebx
 563:	5e                   	pop    %esi
 564:	5f                   	pop    %edi
 565:	5d                   	pop    %ebp
 566:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 567:	03 72 04             	add    0x4(%edx),%esi
 56a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 56d:	8b 10                	mov    (%eax),%edx
 56f:	8b 12                	mov    (%edx),%edx
 571:	89 53 f8             	mov    %edx,-0x8(%ebx)
 574:	eb db                	jmp    551 <free+0x42>
    p->s.size += bp->s.size;
 576:	03 53 fc             	add    -0x4(%ebx),%edx
 579:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 57c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 57f:	89 10                	mov    %edx,(%eax)
 581:	eb da                	jmp    55d <free+0x4e>

00000583 <morecore>:

static Header*
morecore(uint nu)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	53                   	push   %ebx
 587:	83 ec 04             	sub    $0x4,%esp
 58a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 58c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 591:	77 05                	ja     598 <morecore+0x15>
    nu = 4096;
 593:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 598:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 59f:	83 ec 0c             	sub    $0xc,%esp
 5a2:	50                   	push   %eax
 5a3:	e8 39 fd ff ff       	call   2e1 <sbrk>
  if(p == (char*)-1)
 5a8:	83 c4 10             	add    $0x10,%esp
 5ab:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ae:	74 1c                	je     5cc <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5b3:	83 c0 08             	add    $0x8,%eax
 5b6:	83 ec 0c             	sub    $0xc,%esp
 5b9:	50                   	push   %eax
 5ba:	e8 50 ff ff ff       	call   50f <free>
  return freep;
 5bf:	a1 18 09 00 00       	mov    0x918,%eax
 5c4:	83 c4 10             	add    $0x10,%esp
}
 5c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ca:	c9                   	leave  
 5cb:	c3                   	ret    
    return 0;
 5cc:	b8 00 00 00 00       	mov    $0x0,%eax
 5d1:	eb f4                	jmp    5c7 <morecore+0x44>

000005d3 <malloc>:

void*
malloc(uint nbytes)
{
 5d3:	f3 0f 1e fb          	endbr32 
 5d7:	55                   	push   %ebp
 5d8:	89 e5                	mov    %esp,%ebp
 5da:	53                   	push   %ebx
 5db:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5de:	8b 45 08             	mov    0x8(%ebp),%eax
 5e1:	8d 58 07             	lea    0x7(%eax),%ebx
 5e4:	c1 eb 03             	shr    $0x3,%ebx
 5e7:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5ea:	8b 0d 18 09 00 00    	mov    0x918,%ecx
 5f0:	85 c9                	test   %ecx,%ecx
 5f2:	74 04                	je     5f8 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5f4:	8b 01                	mov    (%ecx),%eax
 5f6:	eb 4b                	jmp    643 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 5f8:	c7 05 18 09 00 00 1c 	movl   $0x91c,0x918
 5ff:	09 00 00 
 602:	c7 05 1c 09 00 00 1c 	movl   $0x91c,0x91c
 609:	09 00 00 
    base.s.size = 0;
 60c:	c7 05 20 09 00 00 00 	movl   $0x0,0x920
 613:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 616:	b9 1c 09 00 00       	mov    $0x91c,%ecx
 61b:	eb d7                	jmp    5f4 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 61d:	74 1a                	je     639 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 61f:	29 da                	sub    %ebx,%edx
 621:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 624:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 627:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 62a:	89 0d 18 09 00 00    	mov    %ecx,0x918
      return (void*)(p + 1);
 630:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 633:	83 c4 04             	add    $0x4,%esp
 636:	5b                   	pop    %ebx
 637:	5d                   	pop    %ebp
 638:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 639:	8b 10                	mov    (%eax),%edx
 63b:	89 11                	mov    %edx,(%ecx)
 63d:	eb eb                	jmp    62a <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 63f:	89 c1                	mov    %eax,%ecx
 641:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 643:	8b 50 04             	mov    0x4(%eax),%edx
 646:	39 da                	cmp    %ebx,%edx
 648:	73 d3                	jae    61d <malloc+0x4a>
    if(p == freep)
 64a:	39 05 18 09 00 00    	cmp    %eax,0x918
 650:	75 ed                	jne    63f <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 652:	89 d8                	mov    %ebx,%eax
 654:	e8 2a ff ff ff       	call   583 <morecore>
 659:	85 c0                	test   %eax,%eax
 65b:	75 e2                	jne    63f <malloc+0x6c>
 65d:	eb d4                	jmp    633 <malloc+0x60>
