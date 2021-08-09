Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C20772
	for <regressions@lists.linux.dev>; Mon,  9 Aug 2021 11:14:28 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id c16so33106864lfc.2
        for <regressions@lists.linux.dev>; Mon, 09 Aug 2021 04:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=++9WxWtP7BWvcumhHjIVKSc9eROW74NiYitJtZKDa+o=;
        b=Vncd1CTtXbkrwNHzYLRmJ4uuaHmDMi8Fg1TTCbFDjIXlo2eZ+iM1OpSO5OZgOXvmmV
         2ls2mfhniN8td5XH311KITxfv8sV6KP1AxBHhTWe4KJNW+db5MX5KVDl7HgTqR87KIGt
         RmhDrpw4l/kHiboQSAW4FnSxCdQizNp4fzM3sCjc2IHHihOIywBQT8zpf8qoAY88yzbN
         2/58ywmLWrCXhc6UmvAn2Zj2oyNPqAKx2ySgz/JR0Lowbkm+pQtKN7Sqfr9KHvzw4Ht2
         yoIiHlA4h3HfuQfK5D010m1+6ITgQsIPYGSORCMBWMYPYnZ3seRZTnj5sv6nTiZOgow6
         RWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=++9WxWtP7BWvcumhHjIVKSc9eROW74NiYitJtZKDa+o=;
        b=tNBetTYrNofwuaeIFP0RNkORbY/JhoqGMpri8xDekS/ANV6INgUMoBGbBvINe63Gg3
         9O0SpVUYj95Ixgq/ZS1LnJG97eT6Mm2JBXqW8zg9fVMJf1+QrYsivG5LH++05nMb6krj
         LutCmkbqK0NrtuYvTCdnTCPCkl5TDz+bzp3f/KvM2KJmTdQqNfZYfHITOblNl6TsgG65
         pQlc6tzStirbxX8yv/7D0OUaE7hbIsf+es1wyMUZOEoMjoh2yNlQRs2OM5s36b0BAC3f
         m1F/UKMC9Fl8XvkZ8y7eJ6oMcRm+FP1HUOcbGaTy6Acu6s5bt7nvKAAx1hHk2wSsX8tq
         75Bg==
X-Gm-Message-State: AOAM531tOdc/+WwuxkteXGdgimL+K15Omk0+23RVSmmo/0g/UDQAjx/M
	3QGxJC2Wgp+jhY20lntafViUK1QDuaOcshArdOI=
X-Google-Smtp-Source: ABdhPJy009Mzz/EOH2vr5aR8aaGAtnbG2tCJJESbFyYFhfkLdhx5ZvV1i0v0Do6ZFqgAW8b7BtVbpqp+7jmzIPlPjq4=
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr17429816lfg.259.1628507666330;
 Mon, 09 Aug 2021 04:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: nelakurthi koteswararao <koteswararao18@gmail.com>
Date: Mon, 9 Aug 2021 16:44:13 +0530
Message-ID: <CAGJbQdfVXdjcDjwUae9QdWWu8MJM5EamN4S1pQCRZO2KwjeFaA@mail.gmail.com>
Subject: Futex crash in Normal 4.9 Kernel
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000f751f005c91e7cda"

--000000000000f751f005c91e7cda
Content-Type: multipart/alternative; boundary="000000000000f751ed05c91e7cd8"

--000000000000f751ed05c91e7cd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Stable kernel Contributors

Observed Futex kernel crash while using navigation app in Broxton Device
flashed with Normal 4.9.x kernel.
Futex Crash details are given below.
{{
1>[ 1383.591633] Time of kernel crash: (2021-02-16 12:04:19)
<1>[ 1383.597480] BUG: unable to handle kernel NULL pointer dereference at
          (null)
<1>[ 1383.606247] IP: [<ffffffffa211c271>] futex_wake+0xe1/0x180
<4>[ 1383.612386] PGD 130f62067
<4>[ 1383.615209] PUD 130f61067
<4>[ 1383.618230] PMD 0
<4>[ 1383.620275]
<4>[ 1383.621926] Oops: 0000 [#1] PREEMPT SMP
<4>[ 1383.626211] Modules linked in: bcmdhd(O) sxmio(C) rfkill_gpio
cfg80211 ehset dwc3_pci dwc3 ishtp_tty_client dabridge camera_status mei_me
anc_ipc igb_avb(O) mei xhci_pci xhci_hcd intel_ish_ipc intel_ishtp
snd_soc_bxt_ivi_ull trusty_timer trusty_wall trusty_log trusty_virtio
trusty_ipc dcsd_ts trusty_mem cyttsp6_i2c snd_soc_skl trusty
snd_soc_skl_ipc snd_soc_sst_ipc cyttsp6_device_access snd_soc_sst_dsp
snd_soc_sst_acpi virtio_ring snd_soc_sst_match snd_hda_ext_core
cyttsp6_debug snd_hda_core dcsd_display virtio cyttsp6 [last unloaded:
bcmdhd]
<4>[ 1383.680139] CPU: 2 PID: 7292 Comm: Thread-48 Tainted: G     U   C O
 4.9.232-quilt-2e5dc0ac-g33302ae #1
<4>[ 1383.690832] task: ffff8cf005907040 task.stack: ffff9e25a64a0000
<4>[ 1383.697445] RIP: 0010:[<ffffffffa211c271>]  [<ffffffffa211c271>]
futex_wake+0xe1/0x180
<4>[ 1383.706302] RSP: 0018:ffff9e25a64a3d58  EFLAGS: 00010287
<4>[ 1383.712234] RAX: 000079068685e000 RBX: 0000000000000000 RCX:
ffff9e258eb33cd8
<4>[ 1383.720196] RDX: ffffffffffffffe8 RSI: ffff9e258eb33cc0 RDI:
0000000000000000
<4>[ 1383.728165] RBP: ffff9e25a64a3dc0 R08: ffff8cf0b7c5cac8 R09:
0000000000000000
<4>[ 1383.736137] R10: 000000007fffffff R11: 0000000000000000 R12:
ffff9e25a64a3d68
<4>[ 1383.744108] R13: 00000000ffffffff R14: 000000007fffffff R15:
ffff8cf0b7c5cac4
<4>[ 1383.752082] FS:  0000790670203588(0000) GS:ffff8cf0bfd00000(0000)
knlGS:000079066c642a00
<4>[ 1383.761125] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[ 1383.767556] CR2: 0000000000000000 CR3: 0000000130f63000 CR4:
00000000003406f0
<4>[ 1383.775530] Stack:
<4>[ 1383.777772]  ffffffffa20cd4d1 ffff8cf0b7c5cac0 0000000000000001
ffff9e25a64a3d68
<4>[ 1383.786042]  ffff8cf04c4d70c0 000079068685e000 0000000000000280
3d49d5e64c9b1e3b
<4>[ 1383.794328]  0000000000000000 0000000000000000 000079068685e280
000000007fffffff
<4>[ 1383.802614] Call Trace:
<4>[ 1383.805345]  [<ffffffffa20cd4d1>] ? ttwu_do_wakeup+0xd1/0x100
<4>[ 1383.811764]  [<ffffffffa211e638>] do_futex+0x658/0xbf0
<4>[ 1383.817506]  [<ffffffffa214496d>] ? __seccomp_filter+0x6d/0x290
<4>[ 1383.824122]  [<ffffffffa211ed0d>] SyS_futex+0x13d/0x190
<4>[ 1383.829960]  [<ffffffffa200204e>] do_syscall_64+0x6e/0xe0
<4>[ 1383.835993]  [<ffffffffa2a95220>]
entry_SYSCALL_64_after_swapgs+0x5d/0xd7
<4>[ 1383.843578] Code: 04 48 89 45 a0 4c 89 ff e8 8d 8d 97 00 48 8b 45 a0
48 8b 48 08 4c 8d 40 08 48 8b 39 48 8d 71 e8 49 39 c8 48 8d 57 e8 75 16 eb
6a <48> 8b 4a 18 48 8d 42 18 48 89 d6 4c 39 c0 48 8d 51 e8 74 56 48
<1>[ 1383.865005] RIP  [<ffffffffa211c271>] futex_wake+0xe1/0x180
<4>[ 1383.871238]  RSP <ffff9e25a64a3d58>
<4>[ 1383.875122] CR2: 0000000000000000
}}

Using GDB, identified crash code location as given below.
{{
(gdb) list *(futex_wake+0xe1)
0xffffffff812cce51 is in futex_wake
(../../../../../../kernel/bxt/kernel/futex.c:1445).
1440
1441            ret =3D get_futex_key(uaddr, flags & FLAGS_SHARED, &key,
VERIFY_READ);
1442            if (unlikely(ret !=3D 0))
1443                    goto out;
1444
1445            hb =3D hash_futex(&key); * // crash in hash_futex() executi=
on*
1446
1447            /* Make sure we really have tasks to wakeup */
1448            if (!hb_waiters_pending(hb))
1449                    goto out_put_key;
(gdb)
No Futex code changes are introduced by myself.
Referred git.kernel.org  and confirmed up to below commit id are present in
kernel source that reported with above crash.
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/kernel=
/futex.c?h=3Dlinux-4.9.
<https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/kerne=
l/futex.c?h=3Dlinux-4.9.y>
y
<https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/kerne=
l/futex.c?h=3Dlinux-4.9.y>
{{
2020-04-02 futex: Unbreak futex hashing
<https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/ke=
rnel/futex.c?h=3Dlinux-4.9.y&id=3D95c5383499d656599edeb0d391592a99c5736d80>
Thomas
Gleixner
}}
No Real Time (RT) kernel config is enabled and the above crash is noticed
in the Normal 4.9 Kernel. From disassembler output,
{{

(gdb) disassemble /s futex_wake+0xe1                   // 0xe1 is 225 in
decimal.

=E2=80=A6.

1445            hb =3D hash_futex(&key);

   0xffffffff812cce47 <+215>:   lea    -0x68(%rbp),%rdi

   0xffffffff812cce4b <+219>:   callq  0xffffffff812ca980 <hash_futex>

   0xffffffff812cce50 <+224>:   lea    -0x28(%rbp),%r15



../../../../../../kernel/bxt/include/linux/compiler.h:

264             __READ_ONCE_SIZE;

   0xffffffff812cce54 <+228>:   mov    %rax,%rdx

   0xffffffff812cce57 <+231>:   shr    $0x3,%rdx

   0xffffffff812cce5b <+235>:   movzbl (%rdx,%r13,1),%ecx

..

}}
From above assembler code, 225 decimal offset points to compiler
optimization macro READ_ONCE() i.e triggered by compiler by one of nested
function in hash_futex() triggered crash?
Request to provide input for further analysis on this crash? Attached crash
log for reference.

Regards
Koteswara

--000000000000f751ed05c91e7cd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Stable kernel Contributors<div><br></div><div><div>Ob=
served Futex kernel crash while using navigation app in Broxton Device flas=
hed with Normal 4.9.x kernel.</div><div>Futex Crash details are given below=
.</div><div>{{</div><div>1&gt;[ 1383.591633] Time of kernel crash: (2021-02=
-16 12:04:19)<br>&lt;1&gt;[ 1383.597480] BUG: unable to handle kernel NULL =
pointer dereference at =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (null)<br>&lt;1&g=
t;[ 1383.606247] IP: [&lt;ffffffffa211c271&gt;] futex_wake+0xe1/0x180<br>&l=
t;4&gt;[ 1383.612386] PGD 130f62067<br>&lt;4&gt;[ 1383.615209] PUD 130f6106=
7<br>&lt;4&gt;[ 1383.618230] PMD 0<br>&lt;4&gt;[ 1383.620275]<br>&lt;4&gt;[=
 1383.621926] Oops: 0000 [#1] PREEMPT SMP<br>&lt;4&gt;[ 1383.626211] Module=
s linked in: bcmdhd(O) sxmio(C) rfkill_gpio cfg80211 ehset dwc3_pci dwc3 is=
htp_tty_client dabridge camera_status mei_me anc_ipc igb_avb(O) mei xhci_pc=
i xhci_hcd intel_ish_ipc intel_ishtp snd_soc_bxt_ivi_ull trusty_timer trust=
y_wall trusty_log trusty_virtio trusty_ipc dcsd_ts trusty_mem cyttsp6_i2c s=
nd_soc_skl trusty snd_soc_skl_ipc snd_soc_sst_ipc cyttsp6_device_access snd=
_soc_sst_dsp snd_soc_sst_acpi virtio_ring snd_soc_sst_match snd_hda_ext_cor=
e cyttsp6_debug snd_hda_core dcsd_display virtio cyttsp6 [last unloaded: bc=
mdhd]<br>&lt;4&gt;[ 1383.680139] CPU: 2 PID: 7292 Comm: Thread-48 Tainted: =
G =C2=A0 =C2=A0 U =C2=A0 C O =C2=A0 =C2=A04.9.232-quilt-2e5dc0ac-g33302ae #=
1<br>&lt;4&gt;[ 1383.690832] task: ffff8cf005907040 task.stack: ffff9e25a64=
a0000<br>&lt;4&gt;[ 1383.697445] RIP: 0010:[&lt;ffffffffa211c271&gt;] =C2=
=A0[&lt;ffffffffa211c271&gt;] futex_wake+0xe1/0x180<br>&lt;4&gt;[ 1383.7063=
02] RSP: 0018:ffff9e25a64a3d58 =C2=A0EFLAGS: 00010287<br>&lt;4&gt;[ 1383.71=
2234] RAX: 000079068685e000 RBX: 0000000000000000 RCX: ffff9e258eb33cd8<br>=
&lt;4&gt;[ 1383.720196] RDX: ffffffffffffffe8 RSI: ffff9e258eb33cc0 RDI: 00=
00000000000000<br>&lt;4&gt;[ 1383.728165] RBP: ffff9e25a64a3dc0 R08: ffff8c=
f0b7c5cac8 R09: 0000000000000000<br>&lt;4&gt;[ 1383.736137] R10: 000000007f=
ffffff R11: 0000000000000000 R12: ffff9e25a64a3d68<br>&lt;4&gt;[ 1383.74410=
8] R13: 00000000ffffffff R14: 000000007fffffff R15: ffff8cf0b7c5cac4<br>&lt=
;4&gt;[ 1383.752082] FS: =C2=A00000790670203588(0000) GS:ffff8cf0bfd00000(0=
000) knlGS:000079066c642a00<br>&lt;4&gt;[ 1383.761125] CS: =C2=A00010 DS: 0=
000 ES: 0000 CR0: 0000000080050033<br>&lt;4&gt;[ 1383.767556] CR2: 00000000=
00000000 CR3: 0000000130f63000 CR4: 00000000003406f0<br>&lt;4&gt;[ 1383.775=
530] Stack:<br>&lt;4&gt;[ 1383.777772] =C2=A0ffffffffa20cd4d1 ffff8cf0b7c5c=
ac0 0000000000000001 ffff9e25a64a3d68<br>&lt;4&gt;[ 1383.786042] =C2=A0ffff=
8cf04c4d70c0 000079068685e000 0000000000000280 3d49d5e64c9b1e3b<br>&lt;4&gt=
;[ 1383.794328] =C2=A00000000000000000 0000000000000000 000079068685e280 00=
0000007fffffff<br>&lt;4&gt;[ 1383.802614] Call Trace:<br>&lt;4&gt;[ 1383.80=
5345] =C2=A0[&lt;ffffffffa20cd4d1&gt;] ? ttwu_do_wakeup+0xd1/0x100<br>&lt;4=
&gt;[ 1383.811764] =C2=A0[&lt;ffffffffa211e638&gt;] do_futex+0x658/0xbf0<br=
>&lt;4&gt;[ 1383.817506] =C2=A0[&lt;ffffffffa214496d&gt;] ? __seccomp_filte=
r+0x6d/0x290<br>&lt;4&gt;[ 1383.824122] =C2=A0[&lt;ffffffffa211ed0d&gt;] Sy=
S_futex+0x13d/0x190<br>&lt;4&gt;[ 1383.829960] =C2=A0[&lt;ffffffffa200204e&=
gt;] do_syscall_64+0x6e/0xe0<br>&lt;4&gt;[ 1383.835993] =C2=A0[&lt;ffffffff=
a2a95220&gt;] entry_SYSCALL_64_after_swapgs+0x5d/0xd7<br>&lt;4&gt;[ 1383.84=
3578] Code: 04 48 89 45 a0 4c 89 ff e8 8d 8d 97 00 48 8b 45 a0 48 8b 48 08 =
4c 8d 40 08 48 8b 39 48 8d 71 e8 49 39 c8 48 8d 57 e8 75 16 eb 6a &lt;48&gt=
; 8b 4a 18 48 8d 42 18 48 89 d6 4c 39 c0 48 8d 51 e8 74 56 48<br>&lt;1&gt;[=
 1383.865005] RIP =C2=A0[&lt;ffffffffa211c271&gt;] futex_wake+0xe1/0x180<br=
>&lt;4&gt;[ 1383.871238] =C2=A0RSP &lt;ffff9e25a64a3d58&gt;<br>&lt;4&gt;[ 1=
383.875122] CR2: 0000000000000000<br></div><div>}}</div><div><br></div><div=
>Using GDB, identified crash code location as given below.</div><div>{{</di=
v><div>(gdb) list *(futex_wake+0xe1)<br>0xffffffff812cce51 is in futex_wake=
 (../../../../../../kernel/bxt/kernel/futex.c:1445).<br>1440<br>1441 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D get_futex_key(uaddr, flags &amp;=
 FLAGS_SHARED, &amp;key, VERIFY_READ);<br>1442 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (unlikely(ret !=3D 0))<br>1443 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>1444<br>1445 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hb =3D hash_futex(&amp;key);=C2=A0<b>=C2=
=A0// crash in hash_futex() execution</b><br>1446<br>1447 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* Make sure we really have tasks to wakeup */<br>1=
448 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hb_waiters_pending(hb))<b=
r>1449 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0goto out_put_key;<br>(gdb)</div></div><div>No Futex code changes are int=
roduced by myself.</div><div>Referred <a href=3D"http://git.kernel.org">git=
.kernel.org</a>=C2=A0 and confirmed up to below commit id are present in ke=
rnel source that reported with above crash.</div><div><a href=3D"https://gi=
t.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/kernel/futex.c?h=
=3Dlinux-4.9.y" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kern=
el/git/stable/linux.git/log/kernel/futex.c?h=3Dlinux-4.9.</a><a href=3D"htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/kernel/fu=
tex.c?h=3Dlinux-4.9.y" target=3D"_blank">y</a></div><div>{{</div><div><tabl=
e style=3D"border-collapse:collapse;width:1457.88px;border:none;color:rgb(5=
1,51,51);font-family:sans-serif;font-size:13.3333px"><tbody><tr style=3D"ba=
ckground:rgb(247,247,247)"><td style=3D"border:none;padding:0.1em 0.5em;whi=
te-space:nowrap"><span title=3D"2020-04-02 17:20:28 +0200">2020-04-02</span=
></td><td style=3D"border:none;padding:0.1em 0.5em;white-space:nowrap"><a h=
ref=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/kernel/futex.c?h=3Dlinux-4.9.y&amp;id=3D95c5383499d656599edeb0d391592a9=
9c5736d80" target=3D"_blank" style=3D"color:black;text-decoration-line:none=
">futex: Unbreak futex hashing</a></td><td style=3D"border:none;padding:0.1=
em 0.5em;white-space:nowrap">Thomas Gleixner=C2=A0<br></td></tr></tbody></t=
able></div><div>}}</div><div>No Real Time (RT) kernel config is enabled and=
 the above crash is noticed in the Normal 4.9 Kernel. From disassembler out=
put,</div><div>{{</div><div><p class=3D"MsoNormal" style=3D"margin:0in 0in =
0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font=
-size:10pt;font-family:&quot;Lucida Console&quot;;color:rgb(33,33,33);backg=
round-image:initial;background-position:initial;background-size:initial;bac=
kground-repeat:initial;background-origin:initial;background-clip:initial">(=
gdb) disassemble /s futex_wake+0xe1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// 0xe1 is 225 in decimal.</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">=E2=80=A6.</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">1445=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
hb =3D hash_futex(&amp;key);</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">=C2=A0=C2=A0 0xffffffff812cce=
47
&lt;+215&gt;:=C2=A0=C2=A0 lea=C2=A0=C2=A0=C2=A0 -0x68(%rbp),%rdi</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">=C2=A0=C2=A0 0xffffffff812cce=
4b
&lt;+219&gt;:=C2=A0=C2=A0 callq=C2=A0 0xffffffff812ca980 &lt;hash_futex&gt;=
</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">=C2=A0=C2=A0 0xffffffff812cce=
50
&lt;+224&gt;:=C2=A0=C2=A0 lea=C2=A0=C2=A0=C2=A0 -0x28(%rbp),%r15</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">../../../../../../kernel/bxt/=
include/linux/compiler.h:</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">264=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
__READ_ONCE_SIZE;</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">=C2=A0=C2=A0 0xffffffff812cce=
54
&lt;+228&gt;:=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %rax,%rdx</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">=C2=A0=C2=A0 0xffffffff812cce=
57
&lt;+231&gt;:=C2=A0=C2=A0 shr=C2=A0=C2=A0=C2=A0 $0x3,%rdx</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot=
;Lucida Console&quot;;color:rgb(33,33,33);background-image:initial;backgrou=
nd-position:initial;background-size:initial;background-repeat:initial;backg=
round-origin:initial;background-clip:initial">=C2=A0=C2=A0 0xffffffff812cce=
5b
&lt;+235&gt;:=C2=A0=C2=A0 movzbl (%rdx,%r13,1),%ecx</span></p><p class=3D"M=
soNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calib=
ri,sans-serif"><span style=3D"font-size:10pt;font-family:&quot;Lucida Conso=
le&quot;;color:rgb(33,33,33);background-image:initial;background-position:i=
nitial;background-size:initial;background-repeat:initial;background-origin:=
initial;background-clip:initial">..</span></p><p class=3D"MsoNormal" style=
=3D"margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">=
<span style=3D"font-size:10pt;font-family:&quot;Lucida Console&quot;;color:=
rgb(33,33,33);background-image:initial;background-position:initial;backgrou=
nd-size:initial;background-repeat:initial;background-origin:initial;backgro=
und-clip:initial">}}</span></p></div><div>From above assembler code, 225 de=
cimal offset points to compiler optimization macro READ_ONCE() i.e=C2=A0<sp=
an style=3D"color:rgb(31,73,125);font-family:Calibri,sans-serif;font-size:1=
1pt">triggered by compiler by one of nested function in
hash_futex() triggered crash?</span></div><div><span style=3D"color:rgb(31,=
73,125);font-family:Calibri,sans-serif;font-size:11pt">Request to provide i=
nput for further analysis on this crash? Attached crash log for reference.<=
/span></div><div><span style=3D"color:rgb(31,73,125);font-family:Calibri,sa=
ns-serif;font-size:11pt"><br></span></div><div><span style=3D"color:rgb(31,=
73,125);font-family:Calibri,sans-serif;font-size:11pt">Regards</span></div>=
<div><span style=3D"color:rgb(31,73,125);font-family:Calibri,sans-serif;fon=
t-size:11pt">Koteswara</span></div><div><br></div><div><br></div><div><br><=
/div><div><br></div></div>

--000000000000f751ed05c91e7cd8--
--000000000000f751f005c91e7cda
Content-Type: application/octet-stream; name=KernelCrash
Content-Disposition: attachment; filename=KernelCrash
Content-Transfer-Encoding: base64
Content-ID: <f_ks4jejgj0>
X-Attachment-Id: f_ks4jejgj0

PDMxPlsgMTM2Mi45OTg2MzFdIGxvZ2Q6IGxvZ2RyOiBVSUQ9MTAwMCBHSUQ9MTAwMCBQSUQ9NTg1
NyBuIHRhaWw9MCBsb2dNYXNrPTQgcGlkPTAgc3RhcnQ9MG5zIHRpbWVvdXQ9MG5zCjw2PlsgMTM3
Mi45MjA2NDhdIENGRzgwMjExLUVSUk9SKSB3bF9ydW5fZXNjYW4gOiAKPDQ+WyAxMzcyLjkyMDY1
Ml0gIExFR0FDWSBFLVNDQU4gU1RBUlQKPDY+WyAxMzcyLjkyMjg0Nl0gQ0ZHODAyMTEtRVJST1Ip
IHdsX3J1bl9lc2NhbiA6IAo8ND5bIDEzNzIuOTIzMzY2XSBMRUdBQ1lfU0NBTiBzeW5jIElEOiA0
NjYwLCBic3NpZHg6IDAKPDE+WyAxMzgzLjU5MTYzM10gVGltZSBvZiBrZXJuZWwgY3Jhc2g6ICgy
MDIxLTAyLTE2IDEyOjA0OjE5KQo8MT5bIDEzODMuNTk3NDgwXSBCVUc6IHVuYWJsZSB0byBoYW5k
bGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCAgICAgICAgICAgKG51bGwpCjwx
PlsgMTM4My42MDYyNDddIElQOiBbPGZmZmZmZmZmYTIxMWMyNzE+XSBmdXRleF93YWtlKzB4ZTEv
MHgxODAKPDQ+WyAxMzgzLjYxMjM4Nl0gUEdEIDEzMGY2MjA2NyAKPDQ+WyAxMzgzLjYxNTIwOV0g
UFVEIDEzMGY2MTA2NyAKPDQ+WyAxMzgzLjYxODIzMF0gUE1EIDAgCjw0PlsgMTM4My42MjAyNzVd
IAo8ND5bIDEzODMuNjIxOTI2XSBPb3BzOiAwMDAwIFsjMV0gUFJFRU1QVCBTTVAKPDQ+WyAxMzgz
LjYyNjIxMV0gTW9kdWxlcyBsaW5rZWQgaW46IGJjbWRoZChPKSBzeG1pbyhDKSByZmtpbGxfZ3Bp
byBjZmc4MDIxMSBlaHNldCBkd2MzX3BjaSBkd2MzIGlzaHRwX3R0eV9jbGllbnQgZGFicmlkZ2Ug
Y2FtZXJhX3N0YXR1cyBtZWlfbWUgYW5jX2lwYyBpZ2JfYXZiKE8pIG1laSB4aGNpX3BjaSB4aGNp
X2hjZCBpbnRlbF9pc2hfaXBjIGludGVsX2lzaHRwIHNuZF9zb2NfYnh0X2l2aV91bGwgdHJ1c3R5
X3RpbWVyIHRydXN0eV93YWxsIHRydXN0eV9sb2cgdHJ1c3R5X3ZpcnRpbyB0cnVzdHlfaXBjIGRj
c2RfdHMgdHJ1c3R5X21lbSBjeXR0c3A2X2kyYyBzbmRfc29jX3NrbCB0cnVzdHkgc25kX3NvY19z
a2xfaXBjIHNuZF9zb2Nfc3N0X2lwYyBjeXR0c3A2X2RldmljZV9hY2Nlc3Mgc25kX3NvY19zc3Rf
ZHNwIHNuZF9zb2Nfc3N0X2FjcGkgdmlydGlvX3Jpbmcgc25kX3NvY19zc3RfbWF0Y2ggc25kX2hk
YV9leHRfY29yZSBjeXR0c3A2X2RlYnVnIHNuZF9oZGFfY29yZSBkY3NkX2Rpc3BsYXkgdmlydGlv
IGN5dHRzcDYgW2xhc3QgdW5sb2FkZWQ6IGJjbWRoZF0KPDQ+WyAxMzgzLjY4MDEzOV0gQ1BVOiAy
IFBJRDogNzI5MiBDb21tOiBUaHJlYWQtNDggVGFpbnRlZDogRyAgICAgVSAgIEMgTyAgICA0Ljku
MjMyLXF1aWx0LTJlNWRjMGFjLWczMzMwMmFlICMxCjw0PlsgMTM4My42OTA4MzJdIHRhc2s6IGZm
ZmY4Y2YwMDU5MDcwNDAgdGFzay5zdGFjazogZmZmZjllMjVhNjRhMDAwMAo8ND5bIDEzODMuNjk3
NDQ1XSBSSVA6IDAwMTA6WzxmZmZmZmZmZmEyMTFjMjcxPl0gIFs8ZmZmZmZmZmZhMjExYzI3MT5d
IGZ1dGV4X3dha2UrMHhlMS8weDE4MAo8ND5bIDEzODMuNzA2MzAyXSBSU1A6IDAwMTg6ZmZmZjll
MjVhNjRhM2Q1OCAgRUZMQUdTOiAwMDAxMDI4Nwo8ND5bIDEzODMuNzEyMjM0XSBSQVg6IDAwMDA3
OTA2ODY4NWUwMDAgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDogZmZmZjllMjU4ZWIzM2NkOAo8
ND5bIDEzODMuNzIwMTk2XSBSRFg6IGZmZmZmZmZmZmZmZmZmZTggUlNJOiBmZmZmOWUyNThlYjMz
Y2MwIFJESTogMDAwMDAwMDAwMDAwMDAwMAo8ND5bIDEzODMuNzI4MTY1XSBSQlA6IGZmZmY5ZTI1
YTY0YTNkYzAgUjA4OiBmZmZmOGNmMGI3YzVjYWM4IFIwOTogMDAwMDAwMDAwMDAwMDAwMAo8ND5b
IDEzODMuNzM2MTM3XSBSMTA6IDAwMDAwMDAwN2ZmZmZmZmYgUjExOiAwMDAwMDAwMDAwMDAwMDAw
IFIxMjogZmZmZjllMjVhNjRhM2Q2OAo8ND5bIDEzODMuNzQ0MTA4XSBSMTM6IDAwMDAwMDAwZmZm
ZmZmZmYgUjE0OiAwMDAwMDAwMDdmZmZmZmZmIFIxNTogZmZmZjhjZjBiN2M1Y2FjNAo8ND5bIDEz
ODMuNzUyMDgyXSBGUzogIDAwMDA3OTA2NzAyMDM1ODgoMDAwMCkgR1M6ZmZmZjhjZjBiZmQwMDAw
MCgwMDAwKSBrbmxHUzowMDAwNzkwNjZjNjQyYTAwCjw0PlsgMTM4My43NjExMjVdIENTOiAgMDAx
MCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPDQ+WyAxMzgzLjc2NzU1
Nl0gQ1IyOiAwMDAwMDAwMDAwMDAwMDAwIENSMzogMDAwMDAwMDEzMGY2MzAwMCBDUjQ6IDAwMDAw
MDAwMDAzNDA2ZjAKPDQ+WyAxMzgzLjc3NTUzMF0gU3RhY2s6Cjw0PlsgMTM4My43Nzc3NzJdICBm
ZmZmZmZmZmEyMGNkNGQxIGZmZmY4Y2YwYjdjNWNhYzAgMDAwMDAwMDAwMDAwMDAwMSBmZmZmOWUy
NWE2NGEzZDY4Cjw0PlsgMTM4My43ODYwNDJdICBmZmZmOGNmMDRjNGQ3MGMwIDAwMDA3OTA2ODY4
NWUwMDAgMDAwMDAwMDAwMDAwMDI4MCAzZDQ5ZDVlNjRjOWIxZTNiCjw0PlsgMTM4My43OTQzMjhd
ICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDc5MDY4Njg1ZTI4MCAwMDAw
MDAwMDdmZmZmZmZmCjw0PlsgMTM4My44MDI2MTRdIENhbGwgVHJhY2U6Cjw0PlsgMTM4My44MDUz
NDVdICBbPGZmZmZmZmZmYTIwY2Q0ZDE+XSA/IHR0d3VfZG9fd2FrZXVwKzB4ZDEvMHgxMDAKPDQ+
WyAxMzgzLjgxMTc2NF0gIFs8ZmZmZmZmZmZhMjExZTYzOD5dIGRvX2Z1dGV4KzB4NjU4LzB4YmYw
Cjw0PlsgMTM4My44MTc1MDZdICBbPGZmZmZmZmZmYTIxNDQ5NmQ+XSA/IF9fc2VjY29tcF9maWx0
ZXIrMHg2ZC8weDI5MAo8ND5bIDEzODMuODI0MTIyXSAgWzxmZmZmZmZmZmEyMTFlZDBkPl0gU3lT
X2Z1dGV4KzB4MTNkLzB4MTkwCjw0PlsgMTM4My44Mjk5NjBdICBbPGZmZmZmZmZmYTIwMDIwNGU+
XSBkb19zeXNjYWxsXzY0KzB4NmUvMHhlMAo8ND5bIDEzODMuODM1OTkzXSAgWzxmZmZmZmZmZmEy
YTk1MjIwPl0gZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9zd2FwZ3MrMHg1ZC8weGQ3Cjw0PlsgMTM4
My44NDM1NzhdIENvZGU6IDA0IDQ4IDg5IDQ1IGEwIDRjIDg5IGZmIGU4IDhkIDhkIDk3IDAwIDQ4
IDhiIDQ1IGEwIDQ4IDhiIDQ4IDA4IDRjIDhkIDQwIDA4IDQ4IDhiIDM5IDQ4IDhkIDcxIGU4IDQ5
IDM5IGM4IDQ4IDhkIDU3IGU4IDc1IDE2IGViIDZhIDw0OD4gOGIgNGEgMTggNDggOGQgNDIgMTgg
NDggODkgZDYgNGMgMzkgYzAgNDggOGQgNTEgZTggNzQgNTYgNDggCjwxPlsgMTM4My44NjUwMDVd
IFJJUCAgWzxmZmZmZmZmZmEyMTFjMjcxPl0gZnV0ZXhfd2FrZSsweGUxLzB4MTgwCjw0PlsgMTM4
My44NzEyMzhdICBSU1AgPGZmZmY5ZTI1YTY0YTNkNTg+Cjw0PlsgMTM4My44NzUxMjJdIENSMjog
MDAwMDAwMDAwMDAwMDAwMAo8ND5bIDEzODMuODk1ODI2XSAtLS1bIGVuZCB0cmFjZSBiNDNiMzFi
NWU3ZTlhYWU4IF0tLS0KPDA+WyAxMzgzLjkwNjk0N10gS2VybmVsIHBhbmljIC0gbm90IHN5bmNp
bmc6IEZhdGFsIGV4Y2VwdGlvbgo8Nj5bIDEzODMuOTEzMTA3XSByZWJvb3Q6IHBhbmljIG1vZGUg
c2V0OiBwLHcKPDA+WyAxMzgzLjkxNzQwMV0gS2VybmVsIE9mZnNldDogMHgyMTAwMDAwMCBmcm9t
IDB4ZmZmZmZmZmY4MTAwMDAwMCAocmVsb2NhdGlvbiByYW5nZTogMHhmZmZmZmZmZjgwMDAwMDAw
LTB4ZmZmZmZmZmZiZmZmZmZmZik=
--000000000000f751f005c91e7cda--
