Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03523D7D8
	for <regressions@lists.linux.dev>; Thu, 25 Sep 2025 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758827277; cv=none; b=BO5pQx4es0rRUfZ3rIEfPr7xh44ICa6HbxM68raLTPaIsNU0Qumgh8a8KwWffO88kx76Uc65QOF+3OkxIiTLnq/kXYdQhiSoJhSP8cdqBo+Ht7M2/OHTOz7eI9lGb+y4Xek7fZA3nRn6O67R07aDt4C9rYJFL4VNLylEeVHCPK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758827277; c=relaxed/simple;
	bh=KoOuFDKSPX2klwRtvL8Njx5yrBi2bJBopsiE7v/B7qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfpndAqu4KHQ18Q1iguBfrgDPpv9ZrVTKhYwxSR+hhax8Wt/3yZe8wTFEuIxlCUM59DTRvXMI/BP8IBIqtB8QMaBaEIuWFETEJnlvV2DXbu4n0Db87yj/TrUyfTCCBObyEHnmy9vm71n01cv8HCoLJz7t/dgL3D+5pERO4Id+aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=EigHyR9t; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EigHyR9t"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so2564128a12.3
        for <regressions@lists.linux.dev>; Thu, 25 Sep 2025 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1758827274; x=1759432074; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnE2Gq1iLGz1QD5Hyp8/IV1Uxk92c5IOYXKZcLObpV0=;
        b=EigHyR9tgABAO2JUuj/cVqq5+/X8dZ4dUQkfC64/SbyeIDAcvP5trEFl/oWsc4F5Ne
         7iASRFiU08QGtLodke0hyd0wlMI+GAgXcwNpN+Q7UaboQW3c2PpO4QCJaCXcRrGplI13
         +bEikOEa0d0n3acHb9mH2bA25Rz5TIQ5/aUIYpkcQdV2ZBt6PUXo2emWDYkL3HZrLOTo
         lQNj4WsEKAigjL0ueFuS9/9sSn0d386ugxpz4f1+NoVhzx4skwbqoyI7F9DQOsCtTr1X
         Lk8oz55wgDjQEzvWNENumms0xWJ8LWXzO6Vh/4hnBZNxkVuQGrVfZwwxKQuZvWm7R25c
         HHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758827274; x=1759432074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnE2Gq1iLGz1QD5Hyp8/IV1Uxk92c5IOYXKZcLObpV0=;
        b=mryinUo55WjkLSSlgWnk1odt4kdNW4OuaN4xHQPrlv4tbExSCIz32KkjS8CxGvDbuR
         7TocNVSusKRy3hmC578Yfdbf0J3uGoNfA+t1uMfre9r8I8xluq+qBuLMkg00y/PV9Sbp
         wiugGyTZvNKrv8L9yk6H9qT4ROeQAMoK9+HIvvrEjrwJRcIfhjVDGNVoEmk9MaaewRNG
         hCDN4d99oGnemQGWQDUoqJh6zM5r9z1LVleV8F3BSeZsM8UwInNry8C4S5f9tO8C9ph+
         gDqJr5e9rk0JCLjww6DXEnaYUeZbv1foNQMRBVliy4mrhYPGmitzQd4fLdv5v6WDq5E/
         r2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNQ0j7RRK/jTBxN/WDtcJVHs7otQrfu/pKPKO/2/PUC+XrRJeFJiD5nqMdhNMCebz9fC4+VE9KMpgJow==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9yCue/puuzIy77w6FV0VAzP2rMf+OlyyYK9gGE1wYvkv7B1IW
	MxPxgrN98HxcYQ29lalyq68UJdcFiKK7D4EAFNl25Mq0YIfAFp9J7qIDvcFaW44KQKzufiPa6a3
	bg0D6tqsGCUrutIV6YakR8IoQ/d4RVmxfuOZ265Ma
X-Gm-Gg: ASbGnctk5EQa9c4pPXpc+f7Nz3B/M1ilP7JAf5vQcgswNDdUJa2bfZxwTLLfwz0ZZQH
	Hus0bgfzV8aWRpxlDr6zoN8Lk+gp1uycEORuHZ7+alumgpTLfHu1MUWKlHi+9ykaLeQFOly/Afo
	AJdj9z4ytPzkPatAlN3iCdcLwwRE85HmzRS3uzT1i/iMP1B9b9TPt+XaMvxYtahuFDswt/Sv+5+
	Z5pwZk=
X-Google-Smtp-Source: AGHT+IGLc7hFNG8WuXb2SfufhUFhhl1/ya5jRSzbJcWtufW9tGBtXFiVuposkEkIcCeVdtoUErBBP6Keqv0SnBd3hsE=
X-Received: by 2002:a05:6402:2685:b0:62b:2f0:974f with SMTP id
 4fb4d7f45d1cf-6349fa06340mr3619141a12.15.1758827273663; Thu, 25 Sep 2025
 12:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e5d594d0aee93da67a22a42d0e2b4e6e463ab894.camel@gmail.com>
 <CAHC9VhRu=-J5xdKgYOJ1eqQ6EiMoEJ3M+cjDU8AHrts-=DoTvg@mail.gmail.com>
 <cd35aa283cf010188a3b0e318f2c16655224767c.camel@gmail.com>
 <CAHC9VhQ-c65UJS+dRaRFn_D=Sq++QXePTsCkN+cV5BVQEbf9fQ@mail.gmail.com> <9df66167c205e341bd5896376e06950aa7bd7240.camel@gmail.com>
In-Reply-To: <9df66167c205e341bd5896376e06950aa7bd7240.camel@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 25 Sep 2025 15:07:40 -0400
X-Gm-Features: AS18NWDrz8xrbmHXwU1qY0zPoiMU7YlGfdslHp8uO3WfwIh7peya76l18x6AcR4
Message-ID: <CAHC9VhThNjmKjaJL_G-ow-eBEwTyn6nNe8irOu8yDWMrGhOnAA@mail.gmail.com>
Subject: Re: [bug report] [regression?] bpf lsm breaks /proc/*/attr/current
 with security= on commandline
To: Filip Hejsek <filip.hejsek@gmail.com>
Cc: linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 12:25=E2=80=AFPM Filip Hejsek <filip.hejsek@gmail.c=
om> wrote:
> On Thu, 2025-09-25 at 11:28 -0400, Paul Moore wrote:
> > On Thu, Sep 25, 2025 at 10:56=E2=80=AFAM Filip Hejsek <filip.hejsek@gma=
il.com> wrote:
> > > On Wed, 2025-09-24 at 17:24 -0400, Paul Moore wrote:
> > > > On Sat, Sep 13, 2025 at 1:01=E2=80=AFPM Filip Hejsek <filip.hejsek@=
gmail.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > TLDR: because of bpf lsm, putting security=3Dselinux on commandli=
ne
> > > > >       results in /proc/*/attr/current returning errors.
> > > > >
> > > > > When the legacy security=3D commandline option is used, the speci=
fied lsm
> > > > > is added to the end of the lsm list. For example, security=3Dappa=
rmor
> > > > > results in the following order of security modules:
> > > > >
> > > > >    capability,landlock,lockdown,yama,bpf,apparmor
> > > > >
> > > > > In particular, the bpf lsm will be ordered before the chosen majo=
r lsm.
> > > > >
> > > > > This causes reads and writes of /proc/*/attr/current to fail, bec=
ause
> > > > > the bpf hook overrides the apparmor/selinux hook.
> > > >
> > > > What kernel are you using?
> > >
> > > I'm using Arch Linux kernel, which is very close to mainline. I have
> > > also tested my own build from git sources (I used a stripped down
> > > config which I based on config from Arch). Example in QEMU:
> > >
> > > $ qemu-system-x86_64 -nodefaults -accel kvm -cpu host -smp cpus=3D2 -=
m 1G -display none -kernel ~/git/linux/arch/x86/boot/bzImage -initrd ./init=
ramfs.img -serial mon:stdio -append 'console=3DttyS0 security=3Dselinux'
> > > :: mounting '' on real root
> > > mount: /new_root: no valid filesystem type specified.
> > > ERROR: Failed to mount '' on real root
> > > You are now being dropped into an emergency shell.
> > > sh: can't access tty; job control turned off
> > > [rootfs ~]# uname -a
> > > Linux archlinux 6.17.0-rc7-00020-gcec1e6e5d1ab #3 SMP PREEMPT_DYNAMIC=
 Thu Sep 25 16:28:02 CEST 2025 x86_64 GNU/Linux
> > > [rootfs ~]# mount -t securityfs securityfs /sys/kernel/security
> > > [rootfs ~]# cat /proc/cmdline
> > > console=3DttyS0 security=3Dselinux
> > > [rootfs ~]# cat /sys/kernel/security/lsm; echo
> > > capability,landlock,lockdown,yama,bpf,selinux
> > > [rootfs ~]# cat /proc/self/attr/current
> > > cat: read error: Invalid argument
> > >
> > > (Note: In this example, uname reports archlinux, but that's only
> > > because I based the config on Arch config, it's not actually an Arch
> > > kernel.)
> > >
> > > Maybe the different behavior is caused by a different config? You can
> > > find the Arch config at [1]. Based on Fedora package sources, I think
> > > their config has
> > >
> > >    CONFIG_LSM=3D"lockdown,yama,integrity,selinux,bpf,landlock,ipe"
> > >
> > > while the Arch config has
> > >
> > >    CONFIG_LSM=3D"landlock,lockdown,yama,integrity,bpf"
> >
> > That's interesting, you're running a LSM that isn't normally run in
> > your distro and you're not properly initializing it (no policy load).
> > Both are acceptable, but you're definitely operating in the
> > corner-iest of corner cases ;)
> >
> > I'd have to look at the relevant code, but I suspect that with
> > "selinux" missing from the CONFIG_LSM list and you manually specifying
> > it on the kernel command line with "security=3Dselinux" you are getting
> > it placed at the very end as opposed to what I saw (I have "selinux"
> > in my CONFIG_LSM list).  It's further complicated by the fact that the
> > procfs call into the LSM's security_getprocattr() hook is going to
> > pass a 0/zero into the hook as the @lsmid which means "first
> > available".
> >
> > Considering that the "security=3D" parameter is a legacy option, I'd
> > encourage you to try the "lsm=3D" parameter (make sure you specify the
> > full list of LSMs you want, in order) to see if that works.
>
> Yes, that works.
>
> The problem isn't that there wouldn't be any working configuration. The
> problem is that a userspace program (in my case CRIU) was broken and I
> had to spend time figuring out what the cause of the issue was. I'm not
> the only one who encountered this issue [1].

Arguably, when a Linux distro that is enabling new features, e.g.
multiple LSMs and/or the BPF LSM, they have an obligation to migrate
away from legacy/deprecated configuration knobs to properly use those
new features.

With the "security=3D" command line option only supporting one LSM, it's
going to be hard to do the right thing in all situations; someone is
always going to be upset with the placement in a multi-LSM system.
Perhaps it's time to make a push to properly deprecate and eventually
remove the "security=3D" command line option; it would definitely
simplify the kernel code.

> So in reporting this issue, I was just hoping to help future users
> avoid the same problem. If you think this is a waste of time, feel free
> to ignore this (and sorry I didn't make this clear in the first email).
>
> Lastly, I will offer a few thoughts:
>  * The fact that the security parameter can break programs like this is
>    highly non-obvious and undocumented.

https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html

I'll agree that the documentation probably should carry a stronger
warning, but it is marked as deprecated.

>  * The BPF LSM hook which causes this breakage is useless, because a
>    BPF program cannot be attached to it. I think it would make sense to
>    just remove it.

That would be a decision the BPF LSM maintainer would need to make.
There is precedent for doing things like this in the BPF LSM, and I
would tend to agree that this hook probably has little use for the
usual BPF LSMs.

>  * Switching to using /proc/*/attr/<lsm>/* solves the problem from the
>    userspace side. Unfortunately, selinux does not have its
>    subdirectory in attr.

This is a legacy carryover from the early days of the LSM framework
and SELinux.  By the time there was a need for LSM specific entries in
procfs there was already a significant amount of userspace that relied
on getting SELinux info from /proc/*/attr; migrating to
/proc/*/attr/selinux (or any other path for that matter) would have
broken too many things.

The good news is that there are a number of reasons why we want to get
away from using procfs for these things anyway, and we recently added
a few LSM syscalls to both solve the procfs problems and better
support multiple LSMs.  LWN.net wrote a nice article on the syscalls
which you can find at the link below:

* https://lwn.net/Articles/919059

--=20
paul-moore.com
