Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F8F1F5FF
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 05:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727933490; cv=none; b=cqBCnD1JRkmwr8lhvRvGGpdPyBjbl6w5C1FFwJpnPP718ry/CcIYK5/+js8p+/fadBUAknSHlnNFnd9DTOeQZHHSzfAt5GAEWml2DGQsk9FndnFTnBUY9FdJlS89eXl0/NciUgtazt/9o4XcXf3tzpqQxIpSWgyEw3fzwH1sO28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727933490; c=relaxed/simple;
	bh=7HclZEODNj69kT1Ie3hCV9z20KQW47mZIUbaQKEPfFU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fc/W0L/3aDZT0xl6iu5qAlf0CAHJy+sHOOVHFbDYmZEIkN8LRgQOdlJbTl1GAJ0mo9aBmQ+lcIhVlEmUg7KEx9pNUx7RIiq7mbx4e/Fl2B+mWZpOHp5NjjoMgivVpDixVbKTeDvSvXJiH+iRTpUPTkP7qAEGMVDllS90oxASVqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUzSvPgA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUzSvPgA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37cc5fb1e45so479652f8f.2
        for <regressions@lists.linux.dev>; Wed, 02 Oct 2024 22:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727933488; x=1728538288; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h4zphGpclCDS+m5FTZiD8D0dfm86Jwyki20Q+XKZKqY=;
        b=jUzSvPgAaUkzNVMjfaz+EuBMvC3hqp3wEk0ogVhLnVftevOMvdzVK0ZnsaRw8oXggV
         ujFTuYNJdQII40VTH2y9XwSDb4Iv7G/mlifyHA+iqvcNtluaUambasDiCCbIATr6bouR
         VuxjSPL2Wk2Lts/UeMm09qN9C11SwD3F3OeicnPo96byslDpKFWKJ91Yv/dpdFPURBaI
         KypZy1eKyYnNUbszvt36XvIGa3qNKMDLl5Cd8eVP+2cq6MMEOWXVHFOu83PEy+oGtpwL
         O70PLeC2FnRM2FeFDFXTwPqRJwpvYmcbwb0Pd07emeC5wjf+24ATejWr2uBqEwACGp1Q
         bqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727933488; x=1728538288;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4zphGpclCDS+m5FTZiD8D0dfm86Jwyki20Q+XKZKqY=;
        b=rIx7StcXAt1BuPsxITXzbMdpic+IZUtd6MJhdMFqHBzboc4apZjK19f80mCWQYsSSz
         1kuh88RaEFvX+TGDb7QivwacWng9AP7Q/dBM22mH3XzOvG5JBCm661sgp+Bw04IKxUHC
         cT98rQsXOa/kmBe1rhkrTYAn+bCE+mrd/V3a2Jto6CS+yLQro+yOUuWaaKD5uYbAdM+m
         rUIPbAzArcMtfsPV7o9TNvNZL7QkV4utrkL80SXpti8mEiZuH+3tqdQT8/gMzG5WjtS3
         uq+0f5Qn/R7DSILJuyMBwOwz24/k9xH6jUTXAFGAXbFX8qt+YF5xEHpew/1gxCfUyLhj
         XuOw==
X-Forwarded-Encrypted: i=1; AJvYcCXmiJPpGt0M8ShjUsPBDKk9PXCyn9ng4svLTdMUUkCEMKo42OoIGuSq78toSgYzQLlWFcr+qckD5uMJyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvAov2Zj5toQ35RjYH9loCYqOcl4E6umTGiOsLtFtKFJCIaPU1
	NDPKhVkZ5g1I9iBW+nxP2D8fRISV9eh+WpQIWjWNWcFN0MX4w9uk
X-Google-Smtp-Source: AGHT+IEFFttmw5Yq5FdjPwlE8plWeS5P2F5gXbe/cnqVVnzibUcbb/0Gr66+6uPKJ9hxRRVkjIttVA==
X-Received: by 2002:a5d:4a0c:0:b0:374:c64d:5379 with SMTP id ffacd0b85a97d-37cfb9d022bmr3475381f8f.27.1727933487361;
        Wed, 02 Oct 2024 22:31:27 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:ce40:6189:439a:6820? ([2a02:168:6806:0:ce40:6189:439a:6820])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082a6bd4sm429000f8f.84.2024.10.02.22.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 22:31:26 -0700 (PDT)
Message-ID: <1ee5f5828e2021bf1051dc1f9b6f01a8c061ffb1.camel@gmail.com>
Subject: Re: [REGRESSION] Re: [PATCH 17/24] sched/fair: Implement delayed
 dequeue
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Chris Bainbridge <chris.bainbridge@gmail.com>, Peter Zijlstra
	 <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, bsegall@google.com,
 dietmar.eggemann@arm.com, 	efault@gmx.de, juri.lelli@redhat.com,
 kprateek.nayak@amd.com, mgorman@suse.de, 	mingo@redhat.com,
 rostedt@goodmis.org, tglx@linutronix.de, 	vincent.guittot@linaro.org,
 vschneid@redhat.com, wuyun.abel@bytedance.com, 	youssefesmat@chromium.org,
 spasswolf@web.de, regressions@lists.linux.dev
Date: Thu, 03 Oct 2024 07:31:26 +0200
In-Reply-To: <ZvA7n9GNoD-ipjkj@debian.local>
References: <20240830123458.3557-1-spasswolf@web.de>
	 <ZvA7n9GNoD-ipjkj@debian.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1+b1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2024-09-22 at 16:45 +0100, Chris Bainbridge wrote:
> On Fri, Aug 30, 2024 at 02:34:56PM +0200, Bert Karwatzki wrote:
> > Since linux next-20240820 the following messages appears when booting:
> >=20
> > [=C2=A0=C2=A0=C2=A0 T1] smp: Bringing up secondary CPUs ...
> > [=C2=A0=C2=A0=C2=A0 T1] smpboot: x86: Booting SMP configuration:
> > [=C2=A0=C2=A0=C2=A0 T1] .... node=C2=A0 #0, CPUs:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 #2=C2=A0 #4=C2=A0 #6=C2=A0 #8 #10 #12 #14=C2=A0 #1
> > This is the line I'm concerend about:
> > [=C2=A0=C2=A0=C2=A0 T1] psi: inconsistent task state! task=3D61:cpuhp/3=
 cpu=3D0 psi_flags=3D4 clear=3D0 set=3D4
> > [=C2=A0=C2=A0=C2=A0 T1]=C2=A0=C2=A0 #3=C2=A0 #5=C2=A0 #7=C2=A0 #9 #11 #=
13 #15
> > [=C2=A0=C2=A0=C2=A0 T1] Spectre V2 : Update user space SMT mitigation: =
STIBP always-on
> > [=C2=A0=C2=A0=C2=A0 T1] smp: Brought up 1 node, 16 CPUs
> > [=C2=A0=C2=A0=C2=A0 T1] smpboot: Total of 16 processors activated (1022=
16.16 BogoMIPS)
> >=20
> > I bisected this to commit 152e11f6df29 ("sched/fair: Implement delayed =
dequeue").
> > Is this normal or is this something I should worry about?
> >=20
> > Bert Karwatzki
>=20
> I am also getting a similar error on boot, and bisected it to the same co=
mmit:
>=20
> [=C2=A0=C2=A0=C2=A0 0.342931] psi: inconsistent task state! task=3D15:rcu=
_tasks_trace cpu=3D0 psi_flags=3D4 clear=3D0 set=3D4
>=20
> #regzbot introduced: 152e11f6df293e816a6a37c69757033cdc72667d

Just another data point, while booting 6.12-rc1 on a Turris Omnia:

[    0.000000] Linux version 6.12.0-rc1 (XXX) (arm-linux-gnueabihf-gcc (Deb=
ian 14.2.0-1) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.1) #1 SMP Thu O=
ct  3 06:59:25 CEST 2024
[    0.000000] CPU: ARMv7 Processor [414fc091] revision 1 (ARMv7), cr=3D10c=
5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uction cache
[    0.000000] OF: fdt: Machine model: Turris Omnia
...
[    0.000867] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.000876] psi: inconsistent task state! task=3D2:kthreadd cpu=3D0 psi_=
flags=3D4 clear=3D0 set=3D4

