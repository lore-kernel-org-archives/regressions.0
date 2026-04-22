Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABB23C0621
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851457; cv=pass; b=Lr+CfRzWySg7ZyzgbYp22RthqaOHKIFTLtn38qYn/WSHvUg7oXKX3LVnDt7+cj2Pvi5K5JYcSPiccyYQ7nlNrbGPJttyKo52pdu+niFKVO0ThkNV/CVvfcdhuQSYKosL5dANmn72VspuYoM+MxbcuerakVEj8f/ztNQM7v1KAtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851457; c=relaxed/simple;
	bh=CD3Cziql/hKkXplbdlbmxy5qc5suIDlfvrnd8GAEDH0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VtNYyrYIJL2suCjbEvuvmPzLI1ee5LEthT6zCkA3/FqqmeN7onn+99x2WgJ/7dZya6X8uF1QhDhYdg2LAg3jMrtpuj0QnjCclejjq8VfdJ6pr7LhVOQm0IcPKf/ZapWHecvII6qHVw7ICJQ3+9FvvhAUCZD3kRTUip4hOXWmOSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com; spf=fail smtp.mailfrom=mongodb.com; dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b=WaFS2nsE; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mongodb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b="WaFS2nsE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ba92146cc86so344576466b.1
        for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 02:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776851454; cv=none;
        d=google.com; s=arc-20240605;
        b=h9i15URidG0nMxQ7niUGczd7azawuVN23bCFVQlTPSH8PSNMe0NKxtAq3/JuiVo6l2
         VaBEX2p9Kq0EUfysVXvvXNgsP8ziWcXuLhZHifnTHje1oTIAaPV6UloL4euQVR1pgXlf
         lyyPeCA+dalw2amiqXTx0YYt3pN/uVI0hVXQTHBQBjjeoxU9wXjBS6XgxYGoUIChWRpN
         Bg4HiqvP3IleN+yn23XdRVtur34bzynj/YpGh6p0AnBIGfuF+THPocVIFnvJoepUCPKR
         MWJl15Ve6M5G2L6zJEcFLxcOqclGFSSrBUVxtxsga4qe5Tj9dNIoxvXoxnHPWjV5oZXD
         93rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=UupnmiDdHUEKLwZg2yWB9e6teUe3IEKjLJ5/xmf/lJc=;
        fh=d9QCLXGquNhroThKtVUCuis2TAavap8Hz1MfMdmT3Bw=;
        b=V9DwpMEqWuCe8oIpQrcCw2PuIhYPbUaVZoLE3M7KOw3ZRrnuFyoJI3IaZj1NUaOr+r
         j+MH8w/yiY7H/SPuMFbTBrpXiPR4XQToUc91EQ1J8fEQmSHRX4Gw6OkuaJKmaRmfZyZl
         NYDwg/9j38OgPm5XVAt0YKGx+Us3F4E7KOE52FApdwm9tAB8Syp/QiZY6GtAo5mLlDxS
         YJRgMEU5FR6Ep+nrLjwagIHQpcUvcamKxgqrYYP3o+0L6/zO8MRmFbW9RT56tdHzHjs9
         GAMBhWJ/rKNSch1Ol7Iwa2sH5paBArUQ/F1z1OW5nt7cqFcMg/QPA5DGh37p7iLaMZ+y
         sSgA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1776851454; x=1777456254; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UupnmiDdHUEKLwZg2yWB9e6teUe3IEKjLJ5/xmf/lJc=;
        b=WaFS2nsEiItWW3C51HecDF1iS+Wn0ciw+FmkmUjUeMpVAo4bvcQBLkwt3nqN35se80
         i2dcDq02SAkYKn6mLYi9HSTWDyhbTn88dvjgQVGbmO1JuMJO25FUvruVCtTSW3KzePoF
         adwrUE5C/JGI0FO/Ot1BbpXS+hLPNuOO7KyEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851454; x=1777456254;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UupnmiDdHUEKLwZg2yWB9e6teUe3IEKjLJ5/xmf/lJc=;
        b=eItQY80Y8OOmWLbZxFxawUIg6R2EeWmP0q601xLQWX7/jiS8jX3DsCCU2gb3LWbfm2
         G6l0MkqAR2lKVW79V1DAKFhEcixDyVvbXEgWry7ayQCbmhYWquPpWeyCuse4QGDUi7nf
         Vj7mrJZFxr7EZJgsQprB7t/6MRm5AOvQ/Pjbl6gypOE+Y28709rz2gaUHBBxnGqauSG8
         UWftQwCIvgyJ4rIYmYPpK9lT5SkIvxdsinbtplEE3j86624L+YjiykXqF7filsmPk/p0
         UIhpj9i3+KCn73jgaI7R3H+oR79pYOQlyBBSxiZ2K5i/af3RfODJ9AUBNn8X+F3EQ4IH
         eFKA==
X-Forwarded-Encrypted: i=1; AFNElJ8scU3gBAa8esEdaCoKwHWOwxduu9V7U3ZqbUTyZfLZMsSdMKxCJY18eoFGmqqZ/8uhO38GD5y8jIoDtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YydNRMqlmlRyOpY0ZfBpG1Rn0hqdN8e0UzUAfOuTiwzMzxW3rAT
	/hCbPFgjx2iGUUI7MEeiVU1D3r9NcwQykdPVX3cMD511sgp8cOG87Q/NDkjU8csp8+3tYb5j3o3
	p3qyBo7IWg2BKVUs4kSB52HHvKMiQw4KU8gAym7hMRw==
X-Gm-Gg: AeBDieso9c+9MyVVRLXEefmwiAfs7GsdyVRVbqfhitGQShKnHrQtD7DftFXwWwOcp+3
	ZjDsBhypowTRRXe8UTndsku95BQ2dT6kudBoPI4D08d77wrncABNgZqjYQSUuQ1CUZK7LcTIJyp
	Ix2m3TfhnerdVPwVuiHIRW9F4R+VrU3WQFQAWnGwFPdch9PVFYCK8IgsorPw4zgt1uVGWbZZjLs
	6YCdYxbW4f8eKvODUv5EWFr9ak6JMNuFscp4bWgvBVCKF8M3WdQusXCkFltJ4uLESn+q1vyJ6Cd
	U5sziHTkGH+r8OcR
X-Received: by 2002:a17:907:7295:b0:ba7:3d21:c136 with SMTP id
 a640c23a62f3a-ba73d3108d8mr702188566b.18.1776851453919; Wed, 22 Apr 2026
 02:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mathias Stearn <mathias@mongodb.com>
Date: Wed, 22 Apr 2026 11:50:26 +0200
X-Gm-Features: AQROBzDhMsHqdNPKSe11Qbhfa2UYC4rlul_krCZcmg-Bg-A_2qGhn7D5Qqy-wXc
Message-ID: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
Subject: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64 and
 tcmalloc everywhere
To: Thomas Gleixner <tglx@linutronix.de>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Chris Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: multipart/mixed; boundary="000000000000bb1c2e0650097725"

--000000000000bb1c2e0650097725
Content-Type: multipart/alternative; boundary="000000000000bb1c2d0650097723"

--000000000000bb1c2d0650097723
Content-Type: text/plain; charset="UTF-8"

TL;DR: As of 6.19, rseq no longer provides the documented atomicity
guarantees on arm64 by failing to abort the critical section on same-core
preemption/resumption. Additionally, it breaks tcmalloc specifically by
failing to overwrite the cpu_id_start field at points where it was relied
on for correctness.

This is a SEVERE breakage for MongoDB. We received several user reports of
crashes on 6.19. I made a stress test that showed that 6.19 can cause
malloc to return the same pointer twice without it being freed. Because
that can cause arbitrary corruption, our latest releases have all been
patched to refuse to start at all on 6.19+.

TCMalloc uses rseq in a "creative" way described at
https://github.com/google/tcmalloc/blob/master/docs/rseq.md. In particular,
the "Current CPU Slabs Pointer Caching" section describes an optimization
that relies on an undocumented fact that the kernel was always overwriting
cpu_id_start (even when it wouldn't change) to invalidate a user-space
cache. Since the change to stop writing cpu_id_start seemed to be
intentional as part of a refactoring merged in 2b09f480f0a1, I started
working on a userspace patch to stop relying on that. Unfortunately when
that was complete I ran into a wall that is impossible to work around from
userspace.

On arm64, the kernel no longer meets the documented guarantee that rseq
critical sections are atomic with respect to preemption. It seems to only
abort the critical section when the thread is migrated to a different core.
The attached test proves it and passes on x86 both before and after 6.19,
and on arm before 6.19, but fails on arm with 6.19. It pins the process to
a single core and then has an rseq critical section that observes a change
made by another thread which is supposed to be impossible. I think this
will break basically any real usage of rseq, other than just reading the
current cpu_id.

An LLM pointed to these two specific commits in the refactor as causing
this (oldest first):
- 39a167560a61 rseq: Optimize event setting
This assumed that user_irq would be set on preemption but it wasn't on
arm64, so TIF_NOTIFY_RESUME isn't raised on same cpu preemption.
- 566d8015f7ee rseq: Avoid CPU/MM CID updates when no event pending
This broke TCMalloc slab caching trick by not overwriting cpu_id_start on
every return to userspace

(I have a lot more analysis and suggested fixes from LLMs since I used them
heavily in this testing and analysis, but I won't spam you with the slop
unless requested)

The arm64 change is a clear breakage and I'm sure it will be
uncontroversial to fix. I can imagine more resistance to reverting to the
old behavior of always overwriting the cpu_id_start field since that seems
to have been an intentional optimization choice. I have reached out to the
TCMalloc maintainers (CC'd) and believe there is a solution that gets the
vast majority of the optimization while still preserving the behavior that
TCMalloc currently relies on[1].

Any time a critical section might be aborted (migration, preemption, signal
delivery, and membarrier IPI), the kernel already must (but doesn't on
arm64 at the moment) check the rseq_cs field to see if the thread is in a
critical section, and is documented as nulling the pointer after (I assume
to make later checks cheaper). It would be sufficient for tcmalloc's
internal usage if every time the kernel nulled out rseq_cs, it also wrote
the cpu id to cpu_id_start. That should be essentially free since you are
already writing to the same cache line. It was pointed out that that could
be an issue if another rseq user in the same thread nulled rseq_cs after
its critical section, which would require the kernel to update cpu_id_start
each time it checks rseq_cs, regardless of whether it nulls it. We aren't
aware of any processes that mix tcmalloc with other rseq usages that null
out the field from userspace, but we can't rule them out since it is open
source. Either way, this preserves the property of not updating
cpu_id_start on every syscall return and non-membarrier interrupts, which I
assume is where the majority of the optimization win was from.

All testing of problematic versions was performed on x86_64 and
aarch64 Ubuntu 24.04.4 with the kernel manually upgraded to
6.19.8-061908-generic. Source analysis was performed on the v6.19 tag. I
had a few AI agents confirm that nothing in the relevant changes to master
should have solved this, but I have not yet tested there.

$ cat /proc/version
Linux version 6.19.8-061908-generic (kernel@balboa)
(aarch64-linux-gnu-gcc-15 (Ubuntu 15.2.0-15ubuntu1) 15.2.0, GNU ld (GNU
Binutils for Ubuntu) 2.46) #202603131837 SMP PREEMPT_DYNAMIC Sat Mar 14
00:00:07 UTC 2026

[1]  There is also an exploration of some options to make tcmalloc not rely
on the cpu_id_start overwriting. However we would strongly prefer that
existing binaries continue to work on 6.19 kernels, even if newer binaries
don't need that. At least for a good while.

--000000000000bb1c2d0650097723
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>TL;DR: As of 6.19, rseq no longer provides the docume=
nted atomicity guarantees on arm64 by failing to abort the critical section=
 on same-core preemption/resumption. Additionally, it breaks tcmalloc speci=
fically by failing to overwrite=C2=A0the cpu_id_start field at points where=
 it was relied on for correctness.=C2=A0</div><div><br></div><div>This is a=
 SEVERE breakage for MongoDB. We received several user reports of crashes o=
n 6.19. I made a stress test that showed that 6.19 can cause malloc to retu=
rn the same pointer twice without it being freed. Because that can cause ar=
bitrary corruption, our latest releases have all been patched to refuse to =
start at all on 6.19+.</div><div><br></div><div>TCMalloc uses rseq in a &qu=
ot;creative&quot; way described at=C2=A0<a href=3D"https://github.com/googl=
e/tcmalloc/blob/master/docs/rseq.md">https://github.com/google/tcmalloc/blo=
b/master/docs/rseq.md</a>. In particular, the &quot;Current CPU Slabs Point=
er Caching&quot; section describes an optimization that relies on an undocu=
mented fact that the kernel was always overwriting cpu_id_start (even when =
it wouldn&#39;t change) to invalidate a user-space cache. Since the change =
to stop writing cpu_id_start seemed to be intentional as part of a refactor=
ing merged in=C2=A02b09f480f0a1, I started working on a userspace patch to =
stop relying on that. Unfortunately when that was complete I ran into a wal=
l that is impossible to work around from userspace.</div><div><br></div><di=
v>On arm64, the kernel no longer meets the documented guarantee that rseq c=
ritical sections are atomic with respect to preemption. It seems to only ab=
ort the critical section when the thread is migrated to a different core. T=
he attached test proves it and passes on x86 both before and after 6.19, an=
d on arm before 6.19, but fails on arm with 6.19. It pins the process to a =
single core and then has an rseq critical section that observes a change ma=
de by another thread which is supposed to be impossible. I think this will =
break basically any real usage of rseq, other than just reading the current=
 cpu_id.<br><br></div><div>An LLM pointed to these two specific commits in =
the refactor as causing this (oldest first):<br>- 39a167560a61 rseq: Optimi=
ze event setting</div><div>This assumed that user_irq would be set on preem=
ption but it wasn&#39;t on arm64, so TIF_NOTIFY_RESUME isn&#39;t raised on =
same cpu preemption.</div><div>- 566d8015f7ee rseq: Avoid CPU/MM CID update=
s when no event pending</div><div>This broke TCMalloc slab caching trick by=
 not overwriting cpu_id_start on every return to userspace</div><div><br></=
div><div>(I have a lot more analysis and suggested fixes from LLMs since I =
used them heavily in this testing and analysis, but I won&#39;t spam you wi=
th the slop unless requested)</div><div><br></div><div>The arm64 change is =
a clear breakage and I&#39;m sure it will be uncontroversial to fix.=C2=A0I=
 can imagine more resistance to reverting to the old behavior of always ove=
rwriting the cpu_id_start field since that seems to have been an intentiona=
l optimization choice. I have reached out to the TCMalloc maintainers (CC&#=
39;d) and believe there is a solution that gets the vast majority of the op=
timization while still preserving the behavior that TCMalloc currently reli=
es on[1].=C2=A0</div><div><br></div><div>Any time a critical section might =
be aborted (migration, preemption,=20
signal delivery, and membarrier IPI), the kernel already must (but doesn&#3=
9;t on arm64 at the moment) check the rseq_cs=20
field to see if the thread is in a critical section, and is documented=20
as nulling the pointer after (I assume to make later checks cheaper). It wo=
uld be sufficient for tcmalloc&#39;s internal usage if every time the kerne=
l nulled out rseq_cs, it also wrote the cpu id to cpu_id_start. That should=
 be essentially free since you are already writing to the same cache line. =
It was pointed out that that could be an issue if another rseq user in the =
same thread nulled rseq_cs after its critical section, which would require =
the kernel to update cpu_id_start each time it checks rseq_cs, regardless o=
f whether it nulls it. We aren&#39;t aware of any processes that mix tcmall=
oc with other rseq usages that null out the field from userspace, but we ca=
n&#39;t rule them out since it is open source. Either way, this preserves t=
he property of not updating cpu_id_start on every syscall return and non-me=
mbarrier interrupts, which I assume is where the majority of the optimizati=
on win was from.</div><div><br></div><div>All testing of problematic versio=
ns was performed on=C2=A0x86_64 and aarch64=C2=A0Ubuntu 24.04.4 with the ke=
rnel manually upgraded to 6.19.8-061908-generic. Source analysis was perfor=
med on the=C2=A0v6.19 tag. I had a few AI agents confirm that nothing in th=
e relevant changes to master should have solved this, but I have not yet te=
sted there.</div><div><br></div><div>$ cat /proc/version<br>Linux version 6=
.19.8-061908-generic (kernel@balboa) (aarch64-linux-gnu-gcc-15 (Ubuntu 15.2=
.0-15ubuntu1) 15.2.0, GNU ld (GNU Binutils for Ubuntu) 2.46) #202603131837 =
SMP PREEMPT_DYNAMIC Sat Mar 14 00:00:07 UTC 2026</div><div><br></div><div>[=
1]=C2=A0 There is also an exploration of some options to make tcmalloc not =
rely on the cpu_id_start overwriting. However we would strongly prefer that=
 existing binaries continue to work on 6.19 kernels, even if newer binaries=
 don&#39;t need that. At least for a good while.</div></div>

--000000000000bb1c2d0650097723--
--000000000000bb1c2e0650097725
Content-Type: application/octet-stream; name="rseq_same_cpu_preempt_test.cc"
Content-Disposition: attachment; filename="rseq_same_cpu_preempt_test.cc"
Content-Transfer-Encoding: base64
Content-ID: <f_mo9s5m650>
X-Attachment-Id: f_mo9s5m650

Ly8gTWluaW1hbCBzaW5nbGUtZmlsZSByc2VxIHJlcHJvIGZvciBzYW1lLUNQVSBwcmVlbXB0aW9u
IGhhbmRsaW5nLgovLwovLyBCdWlsZDoKLy8gICBnKysgLU8yIC1zdGQ9YysrMjAgLXB0aHJlYWQg
cnNlcV9zYW1lX2NwdV9wcmVlbXB0X3Rlc3QuY2MgLW8gcnNlcV9zYW1lX2NwdV9wcmVlbXB0X3Rl
c3QKLy8KLy8gVGhlIG1haW4gdGhyZWFkIHBpbnMgaXRzZWxmIGFuZCBhIHdyaXRlciB0aHJlYWQg
dG8gb25lIENQVS4gSXQgdGhlbiBlbnRlcnMgYW4KLy8gcnNlcSBjcml0aWNhbCBzZWN0aW9uIHRo
YXQgc3RvcmVzIDAgdG8gYSBzaGFyZWQgZmxhZyBhbmQgc3BpbnMgdW50aWwgaXQgc2VlcwovLyB0
aGUgZmxhZyBiZWNvbWUgMS4gSWYgdGhlIGNyaXRpY2FsIHNlY3Rpb24gcmVzdW1lcyBhZnRlciBh
IHByZWVtcHRpb24gd2l0aG91dAovLyBiZWluZyBhYm9ydGVkLCBpdCB3aWxsIGV2ZW50dWFsbHkg
b2JzZXJ2ZSB0aGUgd3JpdGVyJ3MgMSBhbmQgYWJvcnQuCi8vCi8vIFRoZSB3cml0ZXIgdGhyZWFk
IHdha2VzIGV2ZXJ5IDEwIHVzZWMgYW5kIHN0b3JlcyAxIHRvIHRoZSBzaGFyZWQgZmxhZy4KLy8K
Ly8gRXhwZWN0ZWQgYmVoYXZpb3IgaWYgcnNlcSBwcmVlbXB0aW9uIGFib3J0cyB3b3JrIGNvcnJl
Y3RseToKLy8gICB0aGUgcHJvZ3JhbSBydW5zIGZvciAxMCBzZWNvbmRzIGFuZCBleGl0cyAwLgov
LwovLyBFeHBlY3RlZCBiZWhhdmlvciBpZiBzYW1lLUNQVSBwcmVlbXB0aW9uIGNhbiByZXN1bWUg
aW5zaWRlIHRoZSBDUzoKLy8gICB0aGUgbWFpbiB0aHJlYWQgZXZlbnR1YWxseSByZWFkcyAxIGlu
c2lkZSB0aGUgQ1MgYW5kIGFib3J0cy4KLy8KLy8gTm90ZSB0byByZWFkZXJzOiB0aGUgdG9wIG9m
IHRoaXMgZmlsZSBpcyBib3Jpbmcgc2V0dXAgY29kZS4gVGhlIGludGVyZXN0aW5nCi8vIGNvZGUg
c3RhcnRzIGF0IHJ1bl9vbmVfcnNlcV9hdHRlbXB0KCkgc28geW91IHNob3VsZCBza2lwIGRvd24g
dGhlcmUgZmlyc3QuCgojaW5jbHVkZSA8ZXJybm8uaD4KI2luY2x1ZGUgPGxpbnV4L3JzZXEuaD4K
I2luY2x1ZGUgPHNjaGVkLmg+CiNpbmNsdWRlIDxzeXMvcnNlcS5oPgojaW5jbHVkZSA8dW5pc3Rk
Lmg+CgojaW5jbHVkZSA8Y2hyb25vPgojaW5jbHVkZSA8Y3N0ZGFyZz4KI2luY2x1ZGUgPGNzdGRp
bnQ+CiNpbmNsdWRlIDxjc3RkaW8+CiNpbmNsdWRlIDxjc3RkbGliPgojaW5jbHVkZSA8Y3N0cmlu
Zz4KI2luY2x1ZGUgPHRocmVhZD4KCiNpZiAhZGVmaW5lZChfX2FhcmNoNjRfXykgJiYgIWRlZmlu
ZWQoX194ODZfNjRfXykKI2Vycm9yICJUaGlzIHJlcHJvIGlzIGN1cnJlbnRseSBpbXBsZW1lbnRl
ZCBmb3IgYWFyY2g2NCBhbmQgeDg2XzY0IG9ubHkuIgojZW5kaWYKCm5hbWVzcGFjZSB7Cgpjb25z
dGV4cHIgc3RkOjpjaHJvbm86OnNlY29uZHMga1J1bnRpbWV7MTB9Owpjb25zdGV4cHIgbG9uZyBr
V3JpdGVyU2xlZXBOcyA9IDEwJzAwMDsgIC8vIDEwIHVzZWMKCmFsaWduYXMoNCkgdWludDMyX3Qg
Z19zaGFyZWRfZmxhZyA9IDA7CgpzdHJ1Y3QgcnNlcSogY3VycmVudF9yc2VxX2FiaSgpIHsKICAg
IGF1dG8qIHRocmVhZF9wdHIgPSByZWludGVycHJldF9jYXN0PGNoYXIqPihfX2J1aWx0aW5fdGhy
ZWFkX3BvaW50ZXIoKSk7CiAgICByZXR1cm4gcmVpbnRlcnByZXRfY2FzdDxzdHJ1Y3QgcnNlcSo+
KHRocmVhZF9wdHIgKyBfX3JzZXFfb2Zmc2V0KTsKfQoKW1tub3JldHVybiwgZ251Ojpmb3JtYXQo
cHJpbnRmLCAxLCAyKV1dIHZvaWQgZGllKGNvbnN0IGNoYXIqIGZtdCwgLi4uKSB7CiAgICB2YV9s
aXN0IGFyZ3M7CiAgICB2YV9zdGFydChhcmdzLCBmbXQpOwogICAgc3RkOjp2ZnByaW50ZihzdGRl
cnIsIGZtdCwgYXJncyk7CiAgICB2YV9lbmQoYXJncyk7CiAgICBzdGQ6OmZwcmludGYoc3RkZXJy
LCAiXG4iKTsKICAgIF9FeGl0KDEpOwp9CgpbW25vcmV0dXJuXV0gdm9pZCBkaWVfZXJybm8oY29u
c3QgY2hhciogd2hhdCkgewogICAgZGllKCIlcyBmYWlsZWQ6ICVzIiwgd2hhdCwgc3RkOjpzdHJl
cnJvcihlcnJubykpOwp9CgppbnQgcGlja19hbmRfcGluX2ZpcnN0X2FsbG93ZWRfY3B1KCkgewog
ICAgY3B1X3NldF90IHNldDsKICAgIENQVV9aRVJPKCZzZXQpOwogICAgaWYgKHNjaGVkX2dldGFm
ZmluaXR5KDAsIHNpemVvZihzZXQpLCAmc2V0KSAhPSAwKSB7CiAgICAgICAgZGllX2Vycm5vKCJz
Y2hlZF9nZXRhZmZpbml0eSIpOwogICAgfQoKICAgIGZvciAoaW50IGNwdSA9IDA7IGNwdSA8IENQ
VV9TRVRTSVpFOyArK2NwdSkgewogICAgICAgIGlmIChDUFVfSVNTRVQoY3B1LCAmc2V0KSkgewog
ICAgICAgICAgICBDUFVfWkVSTygmc2V0KTsKICAgICAgICAgICAgQ1BVX1NFVChjcHUsICZzZXQp
OwogICAgICAgICAgICBpZiAoc2NoZWRfc2V0YWZmaW5pdHkoMCwgc2l6ZW9mKHNldCksICZzZXQp
ICE9IDApIHsKICAgICAgICAgICAgICAgIGRpZV9lcnJubygic2NoZWRfc2V0YWZmaW5pdHkiKTsK
ICAgICAgICAgICAgfQogICAgICAgICAgICByZXR1cm4gY3B1OwogICAgICAgIH0KICAgIH0KICAg
IGRpZSgiTm8gYWxsb3dlZCBDUFUgZm91bmQiKTsKfQoKI2RlZmluZSBSU0VRX1NUUl8xKHgpICN4
CiNkZWZpbmUgUlNFUV9TVFIoeCkgUlNFUV9TVFJfMSh4KQoKI2RlZmluZSBSU0VRX0FTTV9ERUZJ
TkVfVEFCTEUobGFiZWwsIHN0YXJ0X2lwLCBwb3N0X2NvbW1pdF9pcCwgYWJvcnRfaXApIFwKICAg
ICIucHVzaHNlY3Rpb24gX19yc2VxX2NzLCBcImF3XCIgIFxuXHQiICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICIuYmFsaWduIDMyICBcblx0IiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKICAgIFJTRVFfU1RSKGxhYmVsKSAiOiAgXG5cdCIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICIubG9uZyAwICBcblx0
IiAgLyogdmVyc2lvbiAqLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKICAgICIubG9uZyAwICBcblx0IiAgLyogZmxhZ3MgKi8gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICIucXVh
ZCAiIFJTRVFfU1RSKHN0YXJ0X2lwKSAiICBcblx0IiAgLyogc3RhcnRfaXAgKi8gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKICAgICIucXVhZCAiIFJTRVFfU1RSKChwb3N0X2NvbW1p
dF9pcCkgLSAoc3RhcnRfaXApKSAiICBcblx0IiAgLyogcG9zdF9jb21taXRfb2Zmc2V0ICovIFwK
ICAgICIucXVhZCAiIFJTRVFfU1RSKGFib3J0X2lwKSAiICBcblx0IiAgLyogYWJvcnRfaXAgKi8g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICIucG9wc2VjdGlvbiAgXG5cdCIK
CmludCBydW5fb25lX3JzZXFfYXR0ZW1wdChzdHJ1Y3QgcnNlcSogYWJpLCB1aW50MzJfdCogc2hh
cmVkX2ZsYWcpIHsKICAgIGludCByZXN1bHQgPSAwOwoKI2lmZGVmIENfRVFVSVZBTEVOVCAgLy8g
QyBlcXVpdmFsZW50OgogICAgLy8gQ3JpdGljYWwgc2VjdGlvbjogc3RvcmUgMCwgdGhlbiBzcGlu
IHVudGlsIGZsYWcgYmVjb21lcyAxCiAgICAqc2hhcmVkX2ZsYWcgPSAwOwogICAgd2hpbGUgKCpz
aGFyZWRfZmxhZyA9PSAwKSB7CiAgICAgICAgLy8gc3BpbgogICAgfQogICAgcmVzdWx0ID0gMTsg
ICAvLyBPYnNlcnZlZCBmbGFnID09IDEKYWJvcnQ6ICAgICAgICAgICAgLy8gQWJvcnQgaGFuZGxl
ciAoa2VybmVsIGp1bXBzIGhlcmUgaWYgcHJlZW1wdGVkIGluc2lkZSBDUykKICAgIHJlc3VsdCA9
IC0xOyAgLy8gV2UgY29ycmVjdGx5IG9ic2VydmVkIGEgcHJlZW1wdGlvbiBpbnNpZGUgdGhlIENT
CiNlbGlmIGRlZmluZWQoX19hYXJjaDY0X18pCiAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXygKICAg
ICAgICBSU0VRX0FTTV9ERUZJTkVfVEFCTEUoMSwgMmYsIDNmLCA0ZikKICAgICAgICAvLyAgU3Rv
cmUgYWRkcmVzcyBvZiByc2VxX2NzIGRlc2NyaXB0b3IgaW50byBhYmktPnJzZXFfY3MKICAgICAg
ICAiICBhZHJwIHgxNSwgMWIgIFxuIgogICAgICAgICIgIGFkZCB4MTUsIHgxNSwgOmxvMTI6MWIg
IFxuIgogICAgICAgICIgIHN0ciB4MTUsICVbcnNlcV9jc10gIFxuIgogICAgICAgICIyOiAgXG4i
ICAgICAgICAgICAgICAgICAgICAgICAgIC8vICBDcml0aWNhbCBzZWN0aW9uIHN0YXJ0IChsYWJl
bCAyKQogICAgICAgICIgIHN0ciB3enIsICVbc2hhcmVkX2ZsYWddICBcbiIgIC8vICAqc2hhcmVk
X2ZsYWcgPSAwCiAgICAgICAgIjU6ICBcbiIgICAgICAgICAgICAgICAgICAgICAgICAgLy8gIFNw
aW4gbG9vcDogd2hpbGUgKCpzaGFyZWRfZmxhZyA9PSAwKSB7fQogICAgICAgICIgIGxkciB3MTUs
ICVbc2hhcmVkX2ZsYWddICBcbiIgIC8vICB3MTUgPSAqc2hhcmVkX2ZsYWcKICAgICAgICAiICBj
YnogdzE1LCA1YiAgXG4iICAgICAgICAgICAgICAvLyAgaWYgKHcxNSA9PSAwKSBnb3RvIDUgKHNw
aW4pCiAgICAgICAgIiAgbW92ICV3W3Jlc3VsdF0sICMxICBcbiIgICAgICAgLy8gIHJlc3VsdCA9
IDEgKG9ic2VydmVkIGZsYWcgPT0gMSkKICAgICAgICAiMzogIFxuIiAgICAgICAgICAgICAgICAg
ICAgICAgICAvLyAgQ3JpdGljYWwgc2VjdGlvbiBlbmQgLSBmYWxsIHRocm91Z2gKICAgICAgICAi
ICBiIDk5ZiAgXG4iICAgICAgICAgICAgICAgICAgICAvLyAgSnVtcCBwYXN0IGFib3J0IGhhbmRs
ZXIKICAgICAgICAiICAubG9uZyAlY1tzaWddICBcbiIgICAgICAgICAgICAvLyAgUlNFUSBzaWdu
YXR1cmUgKG1hZ2ljIGJ5dGVzIHJlcXVpcmVkIGJ5IGtlcm5lbCkKICAgICAgICAiNDogIFxuIiAg
ICAgICAgICAgICAgICAgICAgICAgICAvLyAgQWJvcnQgaGFuZGxlciBlbnRyeSAobGFiZWwgNCkK
ICAgICAgICAiICBtb3YgJXdbcmVzdWx0XSwgIy0xICBcbiIgICAgICAvLyAgcmVzdWx0ID0gLTEK
ICAgICAgICAiOTk6ICBcbiIgICAgICAgICAgICAgICAgICAgICAgICAvLyAgRW5kIG9mIGFib3J0
IGhhbmRsZXIKICAgICAgICA6IFtyZXN1bHRdICIrciIocmVzdWx0KSwgW3JzZXFfY3NdICI9bSIo
YWJpLT5yc2VxX2NzKSwgW3NoYXJlZF9mbGFnXSAiK1EiKCpzaGFyZWRfZmxhZykKICAgICAgICA6
IFtzaWddICJpIihSU0VRX1NJRykKICAgICAgICA6ICJtZW1vcnkiLCAieDE1Iik7CiNlbGlmIGRl
ZmluZWQoX194ODZfNjRfXykKICAgIF9fYXNtX18gX192b2xhdGlsZV9fKAogICAgICAgIFJTRVFf
QVNNX0RFRklORV9UQUJMRSgxLCAyZiwgM2YsIDRmKQogICAgICAgIC8vICBTdG9yZSBhZGRyZXNz
IG9mIHJzZXFfY3MgZGVzY3JpcHRvciBpbnRvIGFiaS0+cnNlcV9jcwogICAgICAgICIgIGxlYXEg
MWIoJSVyaXApLCAlJXJheCAgXG5cdCIKICAgICAgICAiICBtb3ZxICUlcmF4LCAlW3JzZXFfY3Nd
ICBcblx0IgogICAgICAgICIyOiAgXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgLy8g
IENyaXRpY2FsIHNlY3Rpb24gc3RhcnQgKGxhYmVsIDIpCiAgICAgICAgIiAgbW92bCAkMCwgJVtz
aGFyZWRfZmxhZ10gIFxuXHQiICAgICAvLyAgKnNoYXJlZF9mbGFnID0gMAogICAgICAgICI1OiAg
XG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgLy8gIFNwaW4gbG9vcDogd2hpbGUgKCpz
aGFyZWRfZmxhZyA9PSAwKSB7fQogICAgICAgICIgIG1vdmwgJVtzaGFyZWRfZmxhZ10sICUlZWF4
ICBcblx0IiAgLy8gIGVheCA9ICpzaGFyZWRfZmxhZwogICAgICAgICIgIHRlc3RsICUlZWF4LCAl
JWVheCAgXG5cdCIgICAgICAgICAgLy8gIHRlc3QgZWF4ID09IDAKICAgICAgICAiICBqeiA1YiAg
XG5cdCIgICAgICAgICAgICAgICAgICAgICAgIC8vICBpZiAoZWF4ID09IDApIGdvdG8gNSAoc3Bp
bikKICAgICAgICAiICBtb3ZsICQxLCAlW3Jlc3VsdF0gIFxuXHQiICAgICAgICAgIC8vICByZXN1
bHQgPSAxIChvYnNlcnZlZCBmbGFnID09IDEpCiAgICAgICAgIjM6ICBcblx0IiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAvLyAgQ3JpdGljYWwgc2VjdGlvbiBlbmQgLSBmYWxsIHRocm91Z2gK
ICAgICAgICAiICBqbXAgOTlmICBcblx0IiAgICAgICAgICAgICAgICAgICAgIC8vICBKdW1wIHBh
c3QgYWJvcnQgaGFuZGxlcgogICAgICAgICIgIC5sb25nICVjW3NpZ10gIFxuXHQiICAgICAgICAg
ICAgICAgLy8gIFJTRVEgc2lnbmF0dXJlIChtYWdpYyBieXRlcyByZXF1aXJlZCBieSBrZXJuZWwp
CiAgICAgICAgIjQ6ICBcblx0IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyAgQWJvcnQg
aGFuZGxlciBlbnRyeSAobGFiZWwgNCkKICAgICAgICAiICBtb3ZsICQtMSwgJVtyZXN1bHRdICBc
blx0IiAgICAgICAgIC8vICByZXN1bHQgPSAtMQogICAgICAgICI5OTogIFxuXHQiICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLy8gIEVuZCBvZiBhYm9ydCBoYW5kbGVyCiAgICAgICAgOiBbcmVz
dWx0XSAiK3IiKHJlc3VsdCksIFtyc2VxX2NzXSAiPW0iKGFiaS0+cnNlcV9jcyksIFtzaGFyZWRf
ZmxhZ10gIittIigqc2hhcmVkX2ZsYWcpCiAgICAgICAgOiBbc2lnXSAiaSIoUlNFUV9TSUcpCiAg
ICAgICAgOiAibWVtb3J5IiwgImNjIiwgInJheCIpOwojZW5kaWYKCiAgICByZXR1cm4gcmVzdWx0
Owp9Cgp2b2lkIHdyaXRlcl90aHJlYWRfbWFpbigpIHsKICAgIHdoaWxlICh0cnVlKSB7CiAgICAg
ICAgc3RkOjp0aGlzX3RocmVhZDo6c2xlZXBfZm9yKHN0ZDo6Y2hyb25vOjpuYW5vc2Vjb25kcyhr
V3JpdGVyU2xlZXBOcykpOwogICAgICAgIF9fYXRvbWljX3N0b3JlX24oJmdfc2hhcmVkX2ZsYWcs
IDF1LCBfX0FUT01JQ19SRUxBWEVEKTsKICAgIH0KfQoKfSAgLy8gbmFtZXNwYWNlCgppbnQgbWFp
bigpIHsKICAgIGlmIChfX3JzZXFfc2l6ZSA9PSAwKSB7CiAgICAgICAgZGllKCJyc2VxIGlzIG5v
dCByZWdpc3RlcmVkIGZvciB0aGlzIHRocmVhZCAoZ2xpYmMgX19yc2VxX3NpemUgPT0gMCk7ICIK
ICAgICAgICAgICAgIm5lZWQgZ2xpYmMgPj0gMi4zNSB3aXRoIHJzZXEgc3VwcG9ydCBhbmQgYSBr
ZXJuZWwgdGhhdCBzdXBwb3J0cyByc2VxIik7CiAgICB9CiAgICBjb25zdCBpbnQgY3B1ID0gcGlj
a19hbmRfcGluX2ZpcnN0X2FsbG93ZWRfY3B1KCk7CiAgICBpZiAoKGludCljdXJyZW50X3JzZXFf
YWJpKCktPmNwdV9pZCAhPSBjcHUpIHsKICAgICAgICBkaWUoInJzZXEgYWJpIGNwdV9pZCBpcyAl
ZCBhZnRlciBwaW5uaW5nIHJhdGhlciB0aGFuICVkIiwKICAgICAgICAgICAgY3VycmVudF9yc2Vx
X2FiaSgpLT5jcHVfaWQsCiAgICAgICAgICAgIGNwdSk7CiAgICB9CgogICAgc3RkOjp0aHJlYWQo
d3JpdGVyX3RocmVhZF9tYWluKS5kZXRhY2goKTsKCiAgICBjb25zdCBhdXRvIGRlYWRsaW5lID0g
c3RkOjpjaHJvbm86OnN0ZWFkeV9jbG9jazo6bm93KCkgKyBrUnVudGltZTsKICAgIHVpbnQ2NF90
IGF0dGVtcHRzID0gMDsKICAgIHVpbnQ2NF90IGFib3J0X3JldHJpZXMgPSAwOwoKICAgIHdoaWxl
IChzdGQ6OmNocm9ubzo6c3RlYWR5X2Nsb2NrOjpub3coKSA8IGRlYWRsaW5lKSB7CiAgICAgICAg
KythdHRlbXB0czsKICAgICAgICBjb25zdCBpbnQgcmMgPSBydW5fb25lX3JzZXFfYXR0ZW1wdChj
dXJyZW50X3JzZXFfYWJpKCksICZnX3NoYXJlZF9mbGFnKTsKICAgICAgICBpZiAocmMgPT0gMSkg
ewogICAgICAgICAgICBkaWUoIk9ic2VydmVkIHNoYXJlZF9mbGFnID09IDEgaW5zaWRlIHRoZSBy
c2VxIGNyaXRpY2FsIHNlY3Rpb24gIgogICAgICAgICAgICAgICAgImFmdGVyICVsbHUgYXR0ZW1w
dHMgb24gY3B1ICVkIiwKICAgICAgICAgICAgICAgIHN0YXRpY19jYXN0PHVuc2lnbmVkIGxvbmcg
bG9uZz4oYXR0ZW1wdHMpLAogICAgICAgICAgICAgICAgY3B1KTsKICAgICAgICB9IGVsc2UgaWYg
KHJjICE9IC0xKSB7CiAgICAgICAgICAgIGRpZSgiVW5leHBlY3RlZCByZXR1cm4gdmFsdWUgZnJv
bSByc2VxOiAlZCBhZnRlciAlbGx1IGF0dGVtcHRzIiwKICAgICAgICAgICAgICAgIHJjLAogICAg
ICAgICAgICAgICAgc3RhdGljX2Nhc3Q8dW5zaWduZWQgbG9uZyBsb25nPihhdHRlbXB0cykpOwog
ICAgICAgIH0KICAgICAgICArK2Fib3J0X3JldHJpZXM7CiAgICB9CgogICAgc3RkOjpmcHJpbnRm
KHN0ZGVyciwKICAgICAgICAgICAgICAgICAiUEFTUzogcmFuIGZvciAlbGxkIHNlY29uZHMgb24g
Y3B1ICVkLCBhdHRlbXB0cz0lbGx1IGFib3J0X3JldHJpZXM9JWxsdVxuIiwKICAgICAgICAgICAg
ICAgICBzdGF0aWNfY2FzdDxsb25nIGxvbmc+KGtSdW50aW1lLmNvdW50KCkpLAogICAgICAgICAg
ICAgICAgIGNwdSwKICAgICAgICAgICAgICAgICBzdGF0aWNfY2FzdDx1bnNpZ25lZCBsb25nIGxv
bmc+KGF0dGVtcHRzKSwKICAgICAgICAgICAgICAgICBzdGF0aWNfY2FzdDx1bnNpZ25lZCBsb25n
IGxvbmc+KGFib3J0X3JldHJpZXMpKTsKICAgIF9FeGl0KDApOwp9Cg==
--000000000000bb1c2e0650097725--
