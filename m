Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C6B3054D3
	for <regressions@lists.linux.dev>; Thu, 25 Sep 2025 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758817544; cv=none; b=B7tFG/J1J8vmeiRHwSNL/0RAvQtgkEpX0tVonIQGzHmAXndgdKFGXOTpTAuDDX4VscG5zJ9eCLSqpb1JSE14oklubyc7F0RHX3X5S+x5gWfiql3iXtJRuCIVgW16AtcpzSVUkdQr/85L91WypCpAcR6xyyu+pLwKqPCmeQFJQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758817544; c=relaxed/simple;
	bh=e2zTOUXdFrzwKW6u+2BZRJvKLeVeKwka9WRmiQrAMKE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gY4iBI57t0nmRDt4khTNGzujhIypzxopQ3q76iLsf5iE34MjVEHJ9N0dfo5iuZoFgNKl4F0SM0pYY0TZbzh8kEGgHdvFHXDtMOiiFQIlL8lW1sWiKfjItUTiALSEKwOnivyjsq13JImXkAwfQ5gUF+SN0c/JqfsVdZZecfBFjjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcCcEW3/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcCcEW3/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e29d65728so7899635e9.3
        for <regressions@lists.linux.dev>; Thu, 25 Sep 2025 09:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758817541; x=1759422341; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sp90x0HI2604VafoUtGiosJXSBDN/QH7OATIlIgLDsg=;
        b=kcCcEW3/NT6nXEOIBzA1ExrzDibVQD4Cl2juSMWaZaEcnpTeBEgzWKq2+LqJStUGRz
         OQnr2FRC9UBQ4uktoTjf1BbeHdPgXaoYSFpEgmTIpLX+qjZFlT5/kSMAsSepjcR5UCPt
         KcIuupdhfbmyS2wonlq0oDkZPuje5Yh3rE9R0G4p7jXO4WpnNFFBUJ6rZb3XYPB3JCgv
         TdtmwB7rikPlCPhFQqu6H0aNG2J5nGVqVdeyda4sRboAPrCMF5FCYu1cCZSLH/XiJWzn
         9SPJnI0dmy6eM5GHeeuwnZYx02hAXV1VdYm1ITe07HwWekIbG64Oaf2an4AURLdk6OoN
         P8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758817541; x=1759422341;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sp90x0HI2604VafoUtGiosJXSBDN/QH7OATIlIgLDsg=;
        b=b2PrJvazkeyVmRwkIfukctAXmljJ0qxReS0tiWcfQgzAiP3TV9A2XXnb7j1SjSlwMj
         ToQDfBSMB25iNmeAfrqYb41amkaI9x3YDPlMBmBH48ZweYgWhfOy1dUA63yk9Avl7A9p
         IgWsvY9h4q1oOOvePqB/H092eAnX9iPALCJ3jTjjZX0p6cZI9vEMIXsm9u10A1BGJSqp
         MSMMcaixTmoUxHv0lbxaI4ao5MtE/oKQ4lx2UHol1csY9Cg1fBv11y6Ct2BCPBv28rd5
         SH4QAgVJ2K/6l/e680w4Bl3yI+S+KlDo+CUFsFm3SVbF32vEEz5fNp86dsjvCbs08elu
         AmNA==
X-Forwarded-Encrypted: i=1; AJvYcCUgaXNtS6yRAUmcibTFizPKghafXvU1Wlqls+4jNbd7Dpj5XGXPP9RuoeyMpAtZDMpBrqY2N4Kr/Z76CQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdmEBtxG0ADlUj3j97+1XPOfaPkOX4BCWsc5v5vj1jNMcCAPMt
	8W8Cq3fuaE5Fu4KWwehNDFSICA283KAOv1Q+j66451dzO26BFTaJwtKe
X-Gm-Gg: ASbGnctaS9h2BS7sfq61rBxjY05wY5dQtbChWhqfshSnsaFff7AvQrZ7T1CRjuA0VgU
	6HfXx2tisNDOriUi6xc/jl5vTDwNJa3jPox3Sn+wn4URYCefJOWHm2TF9awHxT0fTcxudgAcJRI
	v0z3cqkCCJsAQhNCr4spkpSTlkXh69cwoj1a1lLY0AJws8puV3CtUYQWT8t6+utFqEnxjLPyvKi
	IMzJsNFUABhymS0r52PguSmV2gJSLfLg+vq3lUZYgWmguWScVKwMNQRFUz8xQ5E4falvjInD5Ur
	83JNDaFjXa5AjjeFku0F2HaN1hjiSc1hgb5rK442HrMjj9SY5bcV/8jJ+Si6oYr8fkHWeW/dBGZ
	H8lsdymv4DpYd9VgcCdfJHO4LOYwyI/j6MNTll1UFXTdNYc/7RNaFK6WMqQ==
X-Google-Smtp-Source: AGHT+IE6mWeX6t2AH8HBB+UpOYdjBBRGFMRn/aYCb3judhabM8SWtsPgFs4uiI3dBuK0IPElmXVzNA==
X-Received: by 2002:a05:6000:4387:b0:3ec:1fff:3b25 with SMTP id ffacd0b85a97d-40e3a2eef9emr4065514f8f.0.1758817541137;
        Thu, 25 Sep 2025 09:25:41 -0700 (PDT)
Received: from [10.33.80.40] (mem-185.47.220.165.jmnet.cz. [185.47.220.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fac4a5e41sm3950563f8f.0.2025.09.25.09.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:25:40 -0700 (PDT)
Message-ID: <9df66167c205e341bd5896376e06950aa7bd7240.camel@gmail.com>
Subject: Re: [bug report] [regression?] bpf lsm breaks /proc/*/attr/current
 with security= on commandline
From: Filip Hejsek <filip.hejsek@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>,
  "Serge E. Hallyn"	 <serge@hallyn.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	regressions@lists.linux.dev
Date: Thu, 25 Sep 2025 18:25:39 +0200
In-Reply-To: <CAHC9VhQ-c65UJS+dRaRFn_D=Sq++QXePTsCkN+cV5BVQEbf9fQ@mail.gmail.com>
References: <e5d594d0aee93da67a22a42d0e2b4e6e463ab894.camel@gmail.com>
	 <CAHC9VhRu=-J5xdKgYOJ1eqQ6EiMoEJ3M+cjDU8AHrts-=DoTvg@mail.gmail.com>
	 <cd35aa283cf010188a3b0e318f2c16655224767c.camel@gmail.com>
	 <CAHC9VhQ-c65UJS+dRaRFn_D=Sq++QXePTsCkN+cV5BVQEbf9fQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-09-25 at 11:28 -0400, Paul Moore wrote:
> On Thu, Sep 25, 2025 at 10:56=E2=80=AFAM Filip Hejsek <filip.hejsek@gmail=
.com> wrote:
> > On Wed, 2025-09-24 at 17:24 -0400, Paul Moore wrote:
> > > On Sat, Sep 13, 2025 at 1:01=E2=80=AFPM Filip Hejsek <filip.hejsek@gm=
ail.com> wrote:
> > > >=20
> > > > Hello,
> > > >=20
> > > > TLDR: because of bpf lsm, putting security=3Dselinux on commandline
> > > >       results in /proc/*/attr/current returning errors.
> > > >=20
> > > > When the legacy security=3D commandline option is used, the specifi=
ed lsm
> > > > is added to the end of the lsm list. For example, security=3Dapparm=
or
> > > > results in the following order of security modules:
> > > >=20
> > > >    capability,landlock,lockdown,yama,bpf,apparmor
> > > >=20
> > > > In particular, the bpf lsm will be ordered before the chosen major =
lsm.
> > > >=20
> > > > This causes reads and writes of /proc/*/attr/current to fail, becau=
se
> > > > the bpf hook overrides the apparmor/selinux hook.
> > >=20
> > > What kernel are you using?
> >=20
> > I'm using Arch Linux kernel, which is very close to mainline. I have
> > also tested my own build from git sources (I used a stripped down
> > config which I based on config from Arch). Example in QEMU:
> >=20
> > $ qemu-system-x86_64 -nodefaults -accel kvm -cpu host -smp cpus=3D2 -m =
1G -display none -kernel ~/git/linux/arch/x86/boot/bzImage -initrd ./initra=
mfs.img -serial mon:stdio -append 'console=3DttyS0 security=3Dselinux'
> > :: mounting '' on real root
> > mount: /new_root: no valid filesystem type specified.
> > ERROR: Failed to mount '' on real root
> > You are now being dropped into an emergency shell.
> > sh: can't access tty; job control turned off
> > [rootfs ~]# uname -a
> > Linux archlinux 6.17.0-rc7-00020-gcec1e6e5d1ab #3 SMP PREEMPT_DYNAMIC T=
hu Sep 25 16:28:02 CEST 2025 x86_64 GNU/Linux
> > [rootfs ~]# mount -t securityfs securityfs /sys/kernel/security
> > [rootfs ~]# cat /proc/cmdline
> > console=3DttyS0 security=3Dselinux
> > [rootfs ~]# cat /sys/kernel/security/lsm; echo
> > capability,landlock,lockdown,yama,bpf,selinux
> > [rootfs ~]# cat /proc/self/attr/current
> > cat: read error: Invalid argument
> >=20
> > (Note: In this example, uname reports archlinux, but that's only
> > because I based the config on Arch config, it's not actually an Arch
> > kernel.)
> >=20
> > Maybe the different behavior is caused by a different config? You can
> > find the Arch config at [1]. Based on Fedora package sources, I think
> > their config has
> >=20
> >    CONFIG_LSM=3D"lockdown,yama,integrity,selinux,bpf,landlock,ipe"
> >=20
> > while the Arch config has
> >=20
> >    CONFIG_LSM=3D"landlock,lockdown,yama,integrity,bpf"
>=20
> That's interesting, you're running a LSM that isn't normally run in
> your distro and you're not properly initializing it (no policy load).
> Both are acceptable, but you're definitely operating in the
> corner-iest of corner cases ;)
>=20
> I'd have to look at the relevant code, but I suspect that with
> "selinux" missing from the CONFIG_LSM list and you manually specifying
> it on the kernel command line with "security=3Dselinux" you are getting
> it placed at the very end as opposed to what I saw (I have "selinux"
> in my CONFIG_LSM list).  It's further complicated by the fact that the
> procfs call into the LSM's security_getprocattr() hook is going to
> pass a 0/zero into the hook as the @lsmid which means "first
> available".
>=20
> Considering that the "security=3D" parameter is a legacy option, I'd
> encourage you to try the "lsm=3D" parameter (make sure you specify the
> full list of LSMs you want, in order) to see if that works.

Yes, that works.

The problem isn't that there wouldn't be any working configuration. The
problem is that a userspace program (in my case CRIU) was broken and I
had to spend time figuring out what the cause of the issue was. I'm not
the only one who encountered this issue [1]. I know that at least
Manjaro Linux used to ship a grub config with security=3Dapparmor at some
point (and maybe still does). I no longer use Manjaro Linux, but I
still had this parameter left in my grub config.

[1]: https://github.com/checkpoint-restore/criu/issues/2033

So in reporting this issue, I was just hoping to help future users
avoid the same problem. If you think this is a waste of time, feel free
to ignore this (and sorry I didn't make this clear in the first email).

Lastly, I will offer a few thoughts:
 * The fact that the security parameter can break programs like this is
   highly non-obvious and undocumented.
 * The BPF LSM hook which causes this breakage is useless, because a
   BPF program cannot be attached to it. I think it would make sense to
   just remove it.
 * Switching to using /proc/*/attr/<lsm>/* solves the problem from the
   userspace side. Unfortunately, selinux does not have its
   subdirectory in attr.

Kind regards,
Filip Hejsek
