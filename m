Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F91A2D5925
	for <regressions@lists.linux.dev>; Mon,  7 Sep 2026 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816668; cv=pass; b=WmabKKX2Z3V3ffjO3M0/ZxoM1b3MiCnRTm3CkBPS+2Dsuo4gj9cFQl2np2/hMuZ05fNJxL6rXifE2O8vXE1szs6nwI6Nw6EXUXE3C69SUZg2X8Kcj9zyLgJsAWgX2ZEZxtmaU0G/Ro0dtwDPo/tFMHkhvS9x4HR/heOWD3vsg0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816668; c=relaxed/simple;
	bh=KCfQ/o2jQIWmDhYUMFPoTF8OvDrs5HT3JWRI8Lf7DuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsHCG6WaJ3UnsR2+fQ85TSENiWd8XpBGNJyLjmYG9lL24GDREEjj+swEH79RqSD+vF4tqSll2YT6Ex4BfCbqWCn9J3yiOJJgcq2u+UXxAMqoEWBp2QOi1oImnoqJnhYuSwn2QH4VALvkK/91DMo5inHK4fYC8cVC7vkL/5zQu+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SRIWwqbG; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SRIWwqbG"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca06so155535ad.0
        for <regressions@lists.linux.dev>; Mon, 07 Sep 2026 14:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788816667; cv=none;
        d=google.com; s=arc-20260327;
        b=XdTajZnWYLgJQmWwq4PnFPUxrxShCkamL1F4hCfFgOaCUxf4QIpwH4QJ1A5eJvDKXi
         vy4dxErQRZt0AXPDC+/adIqT481qbaAxAK+wYoeKIttJpdPzKsrTChYtkxgL+LRmU+m3
         UQ+APotiyTEge0l6UyxEAr5BSIspSyG4fpwEBcgrOo+z1imMR5KKV3HrOQsBQFJMYxyv
         /bU3y1FiBE+hOHfMiwTm3phytT7TiQKGtyETO6aIMIvD67gT2V1TLidQUERRRE/+XlZS
         CfJeVpk2CWx1nuYed4pm47RMiXQIYWcwSL8b+GM7R1zlgtwojJlx6Kw7nhmJIqiNKYyE
         dQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMhB9/vf0+R2BNCntM8XD0je4RadngbF12KBKt2v40A=;
        fh=wZ0BRbYUl2Y5b1vGK6GE8Y10IBKRaZDpG/q0p5m3mOY=;
        b=H3T32pWebkzGt3l3p58J8G/BkhvQ6V/bCJ98DNpdfbFqd+4yzLvKHTas+L2XmpfOgf
         xzLnvZd/7dMv5JxBQhX25o0q6omPqqPCzHzgGU0UbN/ByaGUfsbyxdhyVSkHWdHEcvpS
         dzqQxTEyRqTud9ehKuGButar/m0HHAmYxYfz5KB+IzhBI3C6jNzFHll0gpOUcAG4HGnn
         Idsq3WGSo8waAX8QYHQ27wF52aQrqPK2XkH+bhSZ1dY1icBVhckrIPn1tBm2hY8gIVqB
         8KFsYY2oL3xjzb5DamaR1LV9Fsm+DAX5qAy29nfC9M3NhfW3ceFWijlFLfko/9xDYWcN
         3tfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788816667; x=1789421467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMhB9/vf0+R2BNCntM8XD0je4RadngbF12KBKt2v40A=;
        b=SRIWwqbGwCae91z+lzBuHGM8m/BRNFRZ89J/hMGmFrCNJcffaQga2SIpKZj2dqXcxI
         8EivPE6Lk24BIc6/TlE0yl4xq6eD7yDL1T+s9B2CI6bzU1rPO/RUhZQha42K9dy94VO4
         fuuVrNzRK8qDABgCnWnhzaXmuvAHC+AV6eBJa4SHgGSmVFgi43zBUbDzrqfuP7+coAlV
         7DSsOtWmhkiYXv3vy8i/w6L1jN3cg5LKrSj2j8sTh2HAhFfyI63jf3xVkb2MyHnlmnIF
         mx0C8AgERLwVka6z5vJIse1Q8ns3ASWBZfx8z2tTVVUxVqOHGGmq9ou7ZqjG624k4K8L
         XtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816667; x=1789421467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMhB9/vf0+R2BNCntM8XD0je4RadngbF12KBKt2v40A=;
        b=BkbeA0ZXzvUiipkMNABeDEXZLHcY1v2oNhdkHOw0nXrJYbmUkDxeRAHxmbWwyboMpg
         wCISR+SGY76ySX4hGOc1Rb+BVCnLWNGqS3QNuR03nGHwEkKggCJt1nLvalLBBFo+xrUx
         Pe28bb5lchBPseTccr6XjFE9EIGOrYlw40fZaaxlsJI9oRpijweJyDp0tlOdlacLm499
         qbCtbY/tQeCkYBc4Db90jVA1SSCSm82rABvTUJTQb6pHv4UubKMaO+uPKtGG5luxtay6
         WADEJG2h2psvedqFpeCU+SVSVOuCRMqyGs62qH8PQiQOlYcFjrhUAYhAnc+iel3fQpEa
         LQIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGK2LHMwCXxNiPLsfkKptYCEWPX7F6lri+492EryEBagXp+QdsXq4MXD6mdRoZSI1IYam7SwiwUHIOeg==@lists.linux.dev
X-Gm-Message-State: AFuF++mcJSuSNOpGA2diHeenA6XeNtZagMrYCb7BtoLcYhiAYiyO9qUx
	UA0daQUT/qlOrGPxzUJl7OjRxRpJyBqIYpdV41eeYYPOfJ8KX65WeX11WjHZis/7WRULDsWi7L5
	C9SMoUkiTx9yDFrlRadmAmuvONps+FSHG11Ff8yGA
X-Gm-Gg: AYBFou29xmUuevI0Ob8qUDogKOxA2993YYQlRQvBvbEoqKan1wE2dw5xZGKwYQ3oMyd
	ojNGV/dwtYX/ibYNkc+ybffd6YLBYMdfQ8udcqBYh8bvLbeP3K8e6Aw+7YkHl3AV7OyHPZTe91v
	M0Spqi9R2IbeTCNxvzWUSbljVcvDWqQsFLf3rdt3gJzD0VCuuaucuiPMqr3Y/1K4ZGf9oiH6o5d
	zK8OLdazsBr6+qw+kFOQ9rqgBLDMWNXTKSFo/O8UVjQ3wPAwJCQ8zYBsIlOM1bniEBSV7VU9uhN
	6aAnzLx5S12AfVoSigKe2q/MTxpuru4WwLVSS5EU3q75awVJdsgsrbQzw0opWXcWZkEnDkeVEPE
	HxnTlfamt7/btrpZlSgho8fSnMZdBjlOnw5ZVbJYP
X-Received: by 2002:a17:903:1968:b0:2d5:db38:8013 with SMTP id
 d9443c01a7336-2db290965e6mr11954785ad.18.1788816666098; Mon, 07 Sep 2026
 14:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f5e8166a-88be-46c5-8939-1e5227ffe4c2@app.fastmail.com> <CAG48ez3AYt=dYMYLEEhkrzO740wNsD1_3zZbKqo7MXThqEA+Zg@mail.gmail.com>
In-Reply-To: <CAG48ez3AYt=dYMYLEEhkrzO740wNsD1_3zZbKqo7MXThqEA+Zg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 7 Sep 2026 23:30:28 +0200
X-Gm-Features: AcwNN1W46hwdEyXvSweES1CZaIcz1YKihPPLWsHsVoGKqpFlrMy2I4FtskUerj0
Message-ID: <CAG48ez1n=BKDVJB2j-bcSLe_AwWsFkhOwpomaJpqPWaqzQemLQ@mail.gmail.com>
Subject: Re: deadlock from exec_update_lock and reading procfs
To: Benjamin Peterson <benjamin@locrian.net>, regressions@lists.linux.dev
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Arjan van de Ven <arjan@linux.intel.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Jake Edge <jake@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:04=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> On Tue, Sep 1, 2026 at 4:50=E2=80=AFPM Benjamin Peterson <benjamin@locria=
n.net> wrote:
> > After receiving a kernel with 6650527444da ("proc: protect ptrace_may_a=
ccess() with exec_update_lock (part 1)"), we encountered a new deadlock in =
a FUSE server. The FUSE server reads /proc/PID/stat in the file flush callb=
ack, where PID is the pid of flushing process. This can deadlock in exec_up=
date_lock acquisition when the flushing process is closing O_CLOEXEC files.
>
> Ugh, sorry about that.
>
> #regzbot ^introduced:  6650527444da

This should resolve the issue:
https://lore.kernel.org/r/20260907-cloexec-before-exec-update-lock-v1-1-801=
8c201a7df@google.com

If you can easily test the fix on an affected system, it would be nice
if you could give feedback about whether the fix works for you on that
thread.
