Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18063B71D3
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359473; cv=pass; b=GNnkBGis0VVHNwpdcesKtrXdJAbmHWKYAiraimcojLvwf1sFAFtmBb8yPhpl7VYr3J4A+UQLjP362rH/9/jFJCWNNV0dViTvIcn9VL9L1rqGfNDu7iB+Kr+HyeK9z6Z3zCcZyCkscVtqRTq2m7PRg4RVrg/fVpp7Sc1CO3h+w2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359473; c=relaxed/simple;
	bh=/ov/oJDajg60+/1Jf5V77ysbHovwMkIoCAEQSrYcsfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X42Y6PWNcDS7TgfzDPVPR/hNEcOBj8lm92P9OFxTlWGFlZh2QDhiqQcEG9ApJh4mfkPpC6RK/On19NQZ3mSCXTqVpuvR+GNLlXs0umxiKkS/YQDYId7kM/uS/q0Oa6DHjEUpQhMQahCaI6IJJD7RTR1vVLvZVZ/CGfW+5EX4Tiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oM2UNM2z; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oM2UNM2z"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698411099d6so2018a12.0
        for <regressions@lists.linux.dev>; Mon, 06 Jul 2026 10:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783359470; cv=none;
        d=google.com; s=arc-20260327;
        b=fy/73e3VihOSMkpF2qKGVvUPRjOx1KZ6vDExXyFf9cVXR7R2SRwEjw8gdbYUh7CaSw
         8thYTL7AVw7J9BvGV4RwrriGejsmrMV/IZNL5NmcKoDVUBxuqPSosDNI0Toz/05jOo1m
         MSn8aSYSTEa2kYIg1jgXWglg+t4exPU9EqaEwY/hyIpzu4JBWf9eVFjxMuRDkxQg9z5n
         zyKhLjvqZmWwpEHlQzuZhxTTMOoR6NbPLXXJGmXLzbRBDBOHTFo7mfcmFYsb7ubIyljP
         dqMMnjKJRihRGkH7ao6GxI42oXUhk7n6GWRJV0L6BATbwv4EyxorHBukxdBTLP4D1kN8
         LiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ToySm9sdXZDhUFhd22xgEZyfnQc2RHn2Z1qk1nCplc=;
        fh=VzirGC/YsEDFf+ebiSW3Baaz61rzfLmL2EAYTFQZMXc=;
        b=mpaBpgiMhzTvtiIu1a86jDxaIsjWL2QAnnqzTzJ7laU5Ow7+biN8grTSqQzLWABfe3
         /mMSMH6F/WQBZwYGHxoXZsuLKhsuOw4kuNqhIBOaVems0O23dyFQ4aMndjsOtVmfTG/1
         lOmgxYraDi/nV0kART7zYsFdsvnQXRbh9oDgOSCPRe7zTi1rpmk31lC6LodlkfmFV8kZ
         iEcfFA2RdNyRN3zfPICEdKTPlEbSKc+Lqrrp6JPj6toP08FdVgiil2FDiV+eOnAQudHH
         WIbBo53FWDbFNPl4lMnZ2O5i6wJ5aiOmEdRP9QjNRxtGPVtlbvTjFcNJNTUAvSHGUOCS
         /6Iw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783359470; x=1783964270; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ToySm9sdXZDhUFhd22xgEZyfnQc2RHn2Z1qk1nCplc=;
        b=oM2UNM2z12cEWXdV0w+Rvhpg9qQcqHsAj9AcAd1AdQPx54Mgc/9vyad2EnVzpxImnr
         fr9d/AUERAGb+i5Ko/Lvw5/sYLxD39J8DDmaKRCgHj1aZKS2TT4svlKOE3u5v8GSFcxe
         i5gJe7oUIdGGW0gEZ1iZUNBR3shrxpBY1Xfmstes6pjBkL/AK8m+SrqhLK8LGnDPhXnA
         mepdUtGGQhXYnnBdjphHQF6HJXRawcfNgYl8+uWo/cuS8bOkeuz803SoOp8ih29hTgUs
         NadPsqLB6wvspNZjXoyPJyA+GYAIR3ml7EGEc3i1MmNti3zXMBvnmZn9iQ9e+lrUXZhm
         n91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359470; x=1783964270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ToySm9sdXZDhUFhd22xgEZyfnQc2RHn2Z1qk1nCplc=;
        b=ccsqC3thUh122/FlH4oqsXlugcgMvLyjdVGoeotq6KZMzj51N4S4E3zCsvsxFH+OWd
         rRT4ZDI4hyYwEjtavBetAbzMt4znsvMlED9xHocB4J3oKC0Lj1npT4gOUUj1NffpNciv
         fBhMDCTxHNNfurXwI6PzAGXzYwPc44VXAlht1TtuCb3L3MyRuM7guTFC50USlfmsPhlv
         +U6/e6oVMqvuIGJdZpJJObV1t4xFYb8laxv19G0hVcQY1iOaur/eVEAI9qOZXiD/Mma4
         VIXKWbe7rcVjQXVZUI1RgxIhxeiW6gwEWgZIlq4gP8MjbTAuZuqOFTldTUHpQi5GhYVr
         5FUQ==
X-Forwarded-Encrypted: i=1; AHgh+RouzgOuxbVKmDd8Q2RKwAT/eapMbJIUghf4dUax14stuJe2BImeSSQBZLnxPRJSBb+ibYTF5fec0qWN+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzX6VRu5WkNG6Ja/C4xhiYbYghO9HKhh2ogO3la0Ou5BI+S217C
	m3F4qKv0VF7Fm2EN05RKkHqbxVwzJe2wp+dn9R4YR4tTpp7QKLhyMb7iozacZFP8M9n12mkrGmP
	WKtZdTr7Aw5VLlCbpS0tl0PKQ/4Sz0Ao6A9Ju9+SK
X-Gm-Gg: AfdE7ckKqGn2JtdXcCr6Bbtr9fC+AtL6KyKaCnXu8N4gguIzu5gLzi1neuNF4i8d9lO
	WNDCbtetFcryMRnB7wctg4awxX2c6nKgcKJkUpHjfZVImi9iHS9nGsYHR7Jfzxn6zQkpgi+Wc5n
	a+qpIL7y6bWuSZLrk0FQ2KQ0VU8lYhyKWCtEmrHBl6mQ/RQC0IbVAjCCtqYdjZJ9yQuj0qg3hY8
	Wev44BJeMEEA9LX2NueEB8Mv3HimaGGj/vtRr9+1PUsgHYdLHf/YDIIrmQxtjMgmuZBfdgOzj8h
	6vYL2RQvIJLgX2+1zPteJatBF902+zTIxBOm1t0Q/0LDNBnCGypMHd1qug==
X-Received: by 2002:aa7:cf8f:0:b0:697:df76:63f8 with SMTP id
 4fb4d7f45d1cf-69a8d621d82mr8737a12.3.1783359469595; Mon, 06 Jul 2026 10:37:49
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518-procfs-lockfix-part1-v1-1-5c3d20e0ac33@google.com> <20260706170735.2941493-1-linmag7@gmail.com>
In-Reply-To: <20260706170735.2941493-1-linmag7@gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 6 Jul 2026 19:37:13 +0200
X-Gm-Features: AVVi8CcVJXVs9Za7dkHp0FtOPRhNOtgRYHBgVe072i_oqyBaAQXTbXT7u5mkRfg
Message-ID: <CAG48ez0ebrMy8QGKLuz0Qwao_Eiav6e5pAJ5f6GrUPJLRkwNnw@mail.gmail.com>
Subject: Re: [PATCH] proc: protect ptrace_may_access() with exec_update_lock
 (part 1)
To: Magnus Lindholm <linmag7@gmail.com>
Cc: arjan@linux.intel.com, brauner@kernel.org, ebiederm@xmission.com, 
	jack@suse.cz, jake@lwn.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 7:07=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi,
>
> while testing my Alpha generic-entry series on top of v7.2-rc1, I noticed
> that several strace --pidns-translation tests started failing. The same
> generic-entry series on top of v7.1-rc1 passes these tests.
>
> I bisected the regression between v7.1-rc1 and v7.2-rc1, always applying
> the same generic-entry series before testing, and the first bad commit is=
:
>
>   6650527444dadc63d84aa939d14ecba4fadb2f69
>   proc: protect ptrace_may_access() with exec_update_lock (part 1)
>
> Examples of failing strace tests include:
>
>   signal_receive--pidns-translation.gen.test
>   so_peercred--pidns-translation.gen.test
>   tgkill--pidns-translation.gen.test
>   tkill--pidns-translation.gen.test
>   fcntl--pidns-translation.gen.test
>   xet_robust_list--pidns-translation.gen.test
>   xetpgid--pidns-translation.gen.test
>   xetpriority--pidns-translation.gen.test
>
> One simple reproducer is:
>
>   cd strace/tests
>   ./xetpgid--pidns-translation.gen.test
>
> The failure looks like this:
>
>   ../../src/strace: NS_* ioctl commands are not supported by the kernel
>
> and the decoded output lacks the expected pidns translation comments, e.g=
.:
>
>   - getpgid(2 /* 6 in strace's PID NS */) =3D 0
>   + getpgid(2) =3D 0
>
> Looking at the patch, the relevant part seems to be the change in
> fs/proc/namespaces.c: proc_ns_get_link() and proc_ns_readlink() now take
> task->signal->exec_update_lock around the ptrace_may_access() check and
> namespace link/readlink handling. strace's --decode-pids=3Dpidns code app=
ears
> to rely on accessing /proc/<pid>/ns/pid for short-lived tracees in a nest=
ed
> PID namespace, so this looks like a plausible connection to the failure.
>
> The kernel has the relevant namespace options enabled:
>
>   CONFIG_NAMESPACES=3Dy
>   CONFIG_USER_NS=3Dy
>   CONFIG_PID_NS=3Dy
>   CONFIG_CHECKPOINT_RESTORE=3Dy
>   CONFIG_PROC_FS=3Dy
>
> I also tested the basic nsfs ioctls with a small standalone program, both
> outside and inside "unshare -Urpf", and NS_GET_NSTYPE,
> NS_GET_PID_IN_PIDNS and NS_GET_PID_FROM_PIDNS all work there. So the fail=
ure
> does not look like missing namespace support or a simple ioctl-number iss=
ue;
> it seems specific to the proc/ns access pattern used by strace's pidns
> translation code.
>
> #regzbot introduced: 6650527444dadc63d84aa939d14ecba4fadb2f69

Hmm... running strace on strace, I see this:

669   openat(AT_FDCWD, "/proc/469/ns/pid", O_RDONLY) =3D 5
669   fstat(5, {st_dev=3Dmakedev(0, 0x15), st_ino=3D1792,
st_mode=3DS_IFDIR|0511, st_nlink=3D2, st_uid=3D1000, st_gid=3D1000,
st_blksize=3D1024, st_blocks=3D
0, st_size=3D0, st_atime=3D1783357140 /*
2026-07-06T16:59:00.713036792+0000 */, st_atime_nsec=3D713036792,
st_mtime=3D1783357140 /* 2026-07-06T16:59:
00.713036792+0000 */, st_mtime_nsec=3D713036792, st_ctime=3D1783357140 /*
2026-07-06T16:59:00.713036792+0000 */, st_ctime_nsec=3D713036792}) =3D 0
669   ioctl(5, NS_GET_PARENT)           =3D -1 ENOTTY (Inappropriate
ioctl for device)
669   write(2, ", child_tidptr=3D0x7faa62d54a10) =3D 7", 34) =3D 34
669   write(2, "strace: NS_* ioctl commands are not supported by the
kernel\n", 60) =3D 60

So... /proc/469/ns/pid resolves to a directory somehow? That seems very wro=
ng.

root@vm:~# cd /proc/496/ns/pid/
root@vm:/proc/496/ns/pid#

AAaaah, darn, ok, I see. The patch contains this change:

```
 static const char *proc_ns_get_link(struct dentry *dentry,
                                    struct inode *inode,
                                    struct delayed_call *done)
 {
        const struct proc_ns_operations *ns_ops =3D PROC_I(inode)->ns_ops;
        struct task_struct *task;
        struct path ns_path;
        int error =3D -EACCES;

        if (!dentry)
                return ERR_PTR(-ECHILD);

        task =3D get_proc_task(inode);
        if (!task)
                return ERR_PTR(-EACCES);

+       error =3D down_read_killable(&task->signal->exec_update_lock);
+       if (error)
+               goto out_put_task;
+
        if (!ptrace_may_access(task, PTRACE_MODE_READ_FSCREDS))
                goto out;
```

and that is wrong because previously, the ptrace_may_access() check
relied on "error" still being "error =3D -EACCES" from the
initialization at the top of the function, but now it is 0 from
down_read_killable(), so now a ptrace permission check failure causes
us to return with 0 without actually having called nd_jump_link(),
which I think means we end up staying in /proc/$pid/ns?

Sigh, I will send a fix.
