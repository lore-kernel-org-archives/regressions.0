Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0F83F0755
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493916; cv=pass; b=MociwIoGJn4/3aY5IkRecQ3KqDkhY72g8K/5CUvUIp0KJvEAuX39e/bZ4Z/gE+aDuzD7f/B5TfNGMNnskypOHMdSYujwgjvJKMYwJELIIoNVHi3rZdpdHhfrbaT2mZWe9qx/bGfexCQ9jEeBI3N4UFf5M4lLWV9frIN7fW1FDK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493916; c=relaxed/simple;
	bh=+3JOKZQTIXSiy7TPE+EiYNvh21Ntyyf/aSWG9sMXBzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tanvv05UWHE/1okNxv7UgjtGFnefjtnUeNp4mi5qN3SSKkWkIheXw4EwpxaO5ldslCR0ulWVLwm2lSFoM9GKGOjKiDx0jjjZ6sQL1cGpPGALEdlqxeN+G3TKYYlcnDTMpYt2Z7qQhSLvA6HthPBk0jwk+94YyionBHEh3VE+4Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okcWyqjA; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okcWyqjA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38175907a56so1254780a91.0
        for <regressions@lists.linux.dev>; Tue, 07 Jul 2026 23:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783493902; cv=none;
        d=google.com; s=arc-20260327;
        b=JaIKyxcMe2XMpGBTs+WMCpqmBIy/GbZ2FU0j8mJzHdtnWOexuJo+wDA47zDddoBQ55
         zmhjwU4sBF+XrYydVzAnK8RVNuS1qE9zl6KEiaRG4rntShh3aPAPa50J7hwW8VFQt6q0
         O3shijIvuhXwnVFGSxqhIc/QNhmWcSSQG2tmrbs4pbuTGLBtXMeFVPPHw5cLDxqrv32G
         VmUmGs5L21ngN24GzZQgRaA7y4a2QLK5pAfN5YuB9I94+mA1E3oRh7bIP4EuTc28Iw35
         oqXEjax20+d1a7RHvYaFpFnKpgMVYJg96tvF1yo+JpkEytntuPbOsz2KmdRlljlvaIw8
         mT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=++Np+i7QbYkMJq7srOxofh9iDJgIYXe+19kl+BTYoIk=;
        fh=3qD043o7EsInR0YhqtkIj9SRWxEq7ugo5tt0dnbNizI=;
        b=dBqdJaq6HvNif6S9xEmglxIi1hHL9qDPeQEE/VEv8Rxsab/5zppx5isL+RmWPzn58b
         qJ5bdgrmd6pFU1XFhhzC/bZY0zX4R2qP68EqheGNeGIV1onDBPuRxlb+z47FazM1F8Jf
         KK4HNeZDVGCzfR3+/pqXOTs/86tj5lcLrOhecUScwiaqfA3X5Yitn6IMM9HUrf4xdhHQ
         EvPqdMiZ2GvXlKXhJZ/x89LT30FhrIG5Pa62M/Vx4+LIuKyttfhEQ5nWiqUpksdVm1dk
         GULxpBVvDiBNNdy0Scpp03/BG90F8XGcHykeg/2mdtQPwn/ryUDRMJB2BLwhlU8WEET8
         likA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783493902; x=1784098702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=++Np+i7QbYkMJq7srOxofh9iDJgIYXe+19kl+BTYoIk=;
        b=okcWyqjAr8hfGk5f5u2aUj7ba1OaYC4XsaKOjPAlavDHaUtIpjO2m5EwL1HaQRhbyi
         GhSNVCm8QnAXnOeapQKlJ2FcisflGCGdCMPL6h4AsrxBzcpDFohJ/0Glgxew2w3yJeKd
         10IQtTUVoY4v/axVpEAewYMhcvkfRy9p5MGjjzS4ltbd5f9ueVzYSly9tnBzW/Mq25qt
         8n+GFPn15O6CJ7hkV8w67ApINfkPLr6oEL425fQEUXBA7KH8fWYmsamCc5dr6rlGVZDv
         /ehPSxrmb/Pe+5oZwFTZhsFQXwwdj5/bwF3DmoeMWLaxQWxZbqWMVRsuiiCQem0TzNCa
         cIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783493902; x=1784098702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++Np+i7QbYkMJq7srOxofh9iDJgIYXe+19kl+BTYoIk=;
        b=Il7P2TIVUshezjm5OXVIwi0ZAPdL/yX+zKD+Bd9tcAZcdtp0V8iJPZ2jmAHsXFe494
         Ji7Y7sgurtT/WxdIArEVnMniOvGh4NEf0VA3WFYuhRZIUdpz6d8k0bG4buTuuCIlpE5B
         900RTQukpEXORWSOfO/Esmabs61Ch4ElfAHB7j7VLQjvPG1M+r1ZhM/KQraaUoy4mUgX
         ENYw2/KHg+TZ3dHbypu14q3AvCD2XtwFlBsTH7gZ1JDzWoPsxk2i8Th/F8eX0IkHM+Mw
         wMLL9nkhh00XjfXb6VBZYsR/oD4lvuPG9/IH44cvdRoBJ9vmR5rxfWlkZUoPzROgT4we
         tjhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTwLnjk0hegIWggTijV1GNqQL1WRT7/qiOAOlfDMlm7dM+f9r1qgQkaW8+Owx71n36GmW7p/OxQooEdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgQ4pOME4c4m4npBSceY7e2Z2tgMMJYVyluACYGp7BhM/okY8p
	0TTAXFbigew2WHhEyA+KJC+abzlC27y46k/5BBtGsvU0lq4Alp0+S1O1zA2B4TrIj5sqpTW0c/w
	5cBu/tp+LrgYOhesggVIoc3hhbn3j1gY=
X-Gm-Gg: AfdE7cl9n1HBCJEb1R1XJJYZAsU4Rp2Nxn/g52Vb++6e3lrPgQDb+Ap4ysGyfhaujB1
	70Xr6kA9+5v7y9ZIHOZ4C33kUIWJfjC4ld3/E1/Lt5cVJBABCm91ltW54n/o+a5Emm/ToZ7SWLf
	9K2h7oT8TJEJfLaCKsumZ8OS9yuCbrF/eBhYQ3UDWl3yRt7NmL1OsDONRQJy2XpdxVTJi/TCMR6
	DBPmFmasasHdJSyYC2mM3i/XjxGFh2XvgLoUzhyLXBrPAxo6viwK42G9tXs4t3FYoXrFp7Y
X-Received: by 2002:a05:6a21:168b:b0:3b4:8c67:51d4 with SMTP id
 adf61e73a8af0-3c09b4ab238mr8981970637.39.1783493901839; Tue, 07 Jul 2026
 23:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ab2yd35rm6OgZUmb@gpd4> <20260320222916.19987-1-boqun@kernel.org>
 <CAJM55Z-hiNDuu5UwoBe7m0wq+_WJrRY0cwopALUgpG+r3ixj8g@mail.gmail.com>
 <ajQPAk_ALP-84obp@MacBook-0RXW5> <CAJM55Z_15U7GssTOims1=J34CYSj=8CDE_di1kJYs5hE3=J53w@mail.gmail.com>
 <ajlW4oSzEqav6gxc@MacBook-0RXW5> <CAJM55Z_7N40ARWGoZg04p-NnAy-w10v4=Em-e4Bx4+oNYMGBLg@mail.gmail.com>
 <80773b89-f333-4c82-99b5-3fca44ea93b3@sifive.com> <CAJM55Z_aUzPieiGKPgr_iETovgyGB0EUFau+=tLxZksT9CkpYQ@mail.gmail.com>
 <1a9a672d-914d-43c2-b1da-6a0deede4dac@leemhuis.info>
In-Reply-To: <1a9a672d-914d-43c2-b1da-6a0deede4dac@leemhuis.info>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Wed, 8 Jul 2026 09:58:08 +0300
X-Gm-Features: AVVi8CcDPihGLFO6KDd2QFz3SBo9Xu3AC0vfTDbgAUFDI1HQZllfyXn0bskFxwc
Message-ID: <CA+fTLhissp1Vrezd73iEzjrO808W1hrOF4ry-Tc0VrbqDsRKQw@mail.gmail.com>
Subject: Re: [PATCH v2] rcu: Use an intermediate irq_work to start process_srcu()
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Boqun Feng <boqun@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, frederic@kernel.org, neeraj.iitr10@gmail.com, 
	urezki@gmail.com, boqun.feng@gmail.com, rcu@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrea Righi <arighi@nvidia.com>, Zqiang <qiang.zhang@linux.dev>, 
	linux-riscv@lists.infradead.org, Sarah Emery <sarah.emery@canonical.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Thorsten Leemhuis (<regressions@leemhuis.info>) kirjutas
kuup=C3=A4eval E, 6. juuli 2026 kell 14:33:
>
> On 6/24/26 10:55, Emil Renner Berthing wrote:
> > Quoting Samuel Holland (2026-06-23 17:53:19)
> >> On 2026-06-23 4:34 AM, Emil Renner Berthing wrote:
> >>> Quoting Boqun Feng (2026-06-22 17:38:10)
> >>>> On Sat, Jun 20, 2026 at 05:25:25AM -0400, Emil Renner Berthing wrote=
:
> >>>>> Quoting Boqun Feng (2026-06-18 17:30:10)
> >>>>>> On Thu, Jun 18, 2026 at 08:11:36AM -0500, Emil Renner Berthing wro=
te:
> >>>>>>> Quoting Boqun Feng (2026-03-20 23:29:16)
> >>>>>>>> Since commit c27cea4416a3 ("rcu: Re-implement RCU Tasks Trace in=
 terms
> >>>>>>>> of SRCU-fast") we switched to SRCU in BPF. However as BPF instru=
ment can
> >>>>>>>> happen basically everywhere (including where a scheduler lock is=
 held),
> >>>>>>>> call_srcu() now needs to avoid acquiring scheduler lock because
> >>>>>>>> otherwise it could cause deadlock [1]. Fix this by following wha=
t the
> >>>>>>>> previous RCU Tasks Trace did: using an irq_work to delay the que=
uing of
> >>>>>>>> the work to start process_srcu().
> >>>>>>>>
> >>>>>>>> [boqun: Apply Joel's feedback]
> >>>>>>>> [boqun: Apply Andrea's test feedback]
> >>>>>>>>
> >>>>>>>> Reported-by: Andrea Righi <arighi@nvidia.com>
> >>>>>>>> Closes: https://lore.kernel.org/all/abjzvz_tL_siV17s@gpd4/
> >>>>>>>> Fixes: commit c27cea4416a3 ("rcu: Re-implement RCU Tasks Trace i=
n terms of SRCU-fast")
> >>>>>>>> Link: https://lore.kernel.org/rcu/3c4c5a29-24ea-492d-aeee-e0d960=
5b4183@nvidia.com/ [1]
> >>>>>>>> Suggested-by: Zqiang <qiang.zhang@linux.dev>
> >>>>>>>> Tested-by: Andrea Righi <arighi@nvidia.com>
> >>>>>>>> Signed-off-by: Boqun Feng <boqun@kernel.org>
> >>>>>>>
> >>>>>>> Thanks for the patch, which is now upstream as
> >>>>>>> 7c405fb3279b ("rcu: Use an intermediate irq_work to start process=
_srcu()")
> >>>>>>>
> >>>>>>> Unfortunately it seems to halt booting on the Allwinner D1 single=
-core RISC-V
> >>>>>>> SoC both on the 7.0 and 7.1 kernels:
> >>>>>>>
> >>>>>>
> >>>>>> By "single-core", is it only one CPU in that system?
> >>>>>>
> >>>>>>> https://esmil.dk/d1-7.0.txt
> >>>>>>> https://esmil.dk/d1-7.1.txt
> >>>>>>>
> >>>>>
> >>>>> Yes, the SoC only has one CPU core capable of running Linux at leas=
t.
> >>>>>
> >>>>>> From the callstack,
> >>>>>>
> >>>>>> [  243.002818] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" =
disables this message.
> >>>>>> [  243.010681] task:kworker/0:0     state:D stack:0     pid:9     =
tgid:9     ppid:2      task_flags:0x4208060 flags:0x00000000
> >>>>>> [  243.021858] Workqueue: device_link_wq device_link_release_fn
> >>>>>> [  243.027587] Call Trace:
> >>>>>> [  243.030079] [<ffffffff80745b66>] __schedule+0x232/0x530
> >>>>>> [  243.035365] [<ffffffff80745e82>] schedule+0x1e/0x94
> >>>>>> [  243.040298] [<ffffffff8074aa7a>] schedule_timeout+0x6e/0xa8
> >>>>>> [  243.045929] [<ffffffff8004d6a0>] wakeup_preempt+0x8c/0x98
> >>>>>> [  243.051380] [<ffffffff80746aee>] wait_for_completion+0x3a/0xb0
> >>>>>> [  243.057267] [<ffffffff80087226>] __synchronize_srcu.part.0+0x4e=
/0x60
> >>>>>> [  243.063712] [<ffffffff80084414>] rcu_tasks_get_gp_data+0xc/0x10
> >>>>>> [  243.069699] [<ffffffff80490898>] device_link_release_fn+0x14/0x=
80
> >>>>>> [  243.075850] [<ffffffff8003dbd0>] process_one_work+0xf8/0x1c8
> >>>>>> [  243.081583] [<ffffffff8003e282>] worker_thread+0x11a/0x254
> >>>>>> [  243.087127] [<ffffffff8003e164>] rescuer_thread+0x3a0/0x3a4
> >>>>>> [  243.092755] [<ffffffff8003e164>] rescuer_thread+0x3a0/0x3a4
> >>>>>> [  243.098381] [<ffffffff8004499e>] kthread+0xbe/0xe4
> >>>>>> [  243.103231] [<ffffffff8001349e>] ret_from_fork_kernel+0x6/0xd0
> >>>>>> [  243.109127] [<ffffffff800517a8>] schedule_tail+0x8/0xac
> >>>>>> [  243.114410] [<ffffffff800448dc>] kthreads_online_cpu+0x0/0x4
> >>>>>> [  243.120121] [<ffffffff8074be0a>] ret_from_fork_kernel_asm+0x12/=
0x18
> >>>>>>
> >>>>>> I will guess for some reasons the irq_work was missed or the IPI n=
ever
> >>>>>> happened. Is it possible for you to enable trace points ipi_send_c=
pu and
> >>>>>> ipi_entry to get more information?
> >>>>>
> >>>>> I have to admit I've not used tracepoints before, but it seems like=
 only
> >>>>> ipi_send_cpu and ipi_send_cpumask is available on RISC-V.
> >>>>> I've now added trace_event=3Dipi:* and tp_printk to the command lin=
e, and this
> >>>>
> >>>> Thank you! Yeah, this is what I meant ;-)
> >>>>
> >>>>> is what I get:
> >>>>> https://esmil.dk/d1-7.0-2.txt
> >>>>>
> >>>>
> >>>>
> >>>> [    0.071132] rcu:     Max phase no-delay instances is 1000.
> >>>> [    0.077837] ipi_send_cpu: cpu=3D0 callsite=3Dirq_work_queue+0x22/=
0x4c callback=3Dsrcu_irq_work+0x0/0x58
> >>>>
> >>>> Is this the last line you can see from your (serial?) console, or we=
 are
> >>>> missing a few more lines? Maybe it'll should the same hung task
> >>>> messages?
> >>>
> >>> Yes, sorry for not being clear about that. This is the exact same bin=
ary booted
> >>> without the two extra command line parametrs:
> >>> https://esmil.dk/d1-7.0-3.txt
> >>>
> >>> But with the two parameters added the board reboots before getting to=
 the hung
> >>> task messages. The bootloader enables the watchdog, so I think what h=
appens is
> >>> that the kernel halts earlier with the tracepoints enabled, and doesn=
't get to
> >>> load the watchdog driver to keep the machine from rebooting.
> >>>
> >>> The same happens with just trace_event=3Dipi:* added, just without th=
e last
> >>> message above.
> >>>
> >>>>
> >>>> The ipi_send_cpu message means RCU was able to send an IPI, now if t=
here
> >>>> is no ipi_handler between the send and the hung task, that would mea=
n
> >>>> the IPI was missed.
> >>
> >> Assuming that your OpenSBI version is exactly v1.3 per the boot log, a=
nd not
> >> "v1.3 + patches", then you would indeed not be receiving IPIs. You nee=
d at least
> >> this commit: https://github.com/riscv-software-src/opensbi/commit/446f=
a65eb579
> >> (included in v1.4) or alternatively to add the CLINT to the M-mode dev=
icetree.
> >
> > So then we're in a situation similar to [1], where upgrading the kernel=
 from
> > 6.19 to 7.0 requires you to update the firmware first.
>
> Which normally should never happen to ensure users feel save to update
> the kernel. But I wonder if that is relevant, as Indrek Kruusa reported
> problems with that board, too -- and there is a fix that fixes it:
> https://lore.kernel.org/linux-riscv/20260624220434.4183732-1-felixonmars@=
archlinux.org/
>
> Does that maybe fix your problem, too (even if it was bisected to a
> different commit, it might be related somehow, that's why I'm asking)?
>
> Ciao, Thorsten
>

I tend to think we have two different situations here. I am using
newer OpenSBI (v1.8) and an experimental u-boot based on newer
v2026.07-rc1 [1].
So, my firmware is different, also the context Emil is pointing to is diffe=
rent.

Best regards,
Indrek

[1] https://github.com/ikruusa/u-boot/tree/v2026-07-rc1-thead-base-b1


> > To me and from the thread
> > that seems like a really obvious regression. So the question is, how ca=
n we make
> > the current kernel work like < 7.0 kernels worked?
> >
> > [1]: https://lore.kernel.org/all/87jzgjnh9z.ffs@tglx/#t
>
>
