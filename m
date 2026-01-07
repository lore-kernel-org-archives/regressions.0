Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577AA346AE7
	for <regressions@lists.linux.dev>; Wed,  7 Jan 2026 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767807967; cv=none; b=CH8UDTCpkQOY5kX6kUO3SDBl5LHKJZJtCTp8G7BBq954kd5wnQUSka8qdTidlmCtqixPo6zL1Td7dJkMh6QKw+gTysdV41vIhjdd9nvrR8zmTKNXYclT0j8E7SaNaBfZ/BK/U6E+udeEtrhwCNQXW8PNi1OXzgAAAaevXExzlRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767807967; c=relaxed/simple;
	bh=qileGSf2c7ijmYzCuIc/EYVYDbMSNUHL9+gNmFw/7Bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQWGgffx4k4gieZbaLrws127fFnW4AK5xc8JVBxMVv97Obh4LVDD31KBGBgWrmUObWYDe3ipKofBvg1Zf1diZrU3yRjHMTHXnCBL2+i4PdASV+KKS05dapG7zkPcJlRen35hYADwOML13noF3TDaQd//cPjX07pSiGQSV32oUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOMk029x; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOMk029x"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-78fc174ada4so22291777b3.2
        for <regressions@lists.linux.dev>; Wed, 07 Jan 2026 09:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767807951; x=1768412751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07ypZOUFUGEXXmt2EssDaX9DCT/Cq3jKiLjKniS0MwA=;
        b=kOMk029xY8xoCmwWMycJxZrUuzZDbW/yC0+K+KGbY0UIMqCpu4XupIC0j1kublVWQ7
         kdgSu54Jf817oEiEnyXth4r/KsqdrrgOubvakgzTaXchC4rN3kMJ8Pr+XeSwSy4auXi/
         C/0VsRmLUrtLfyZosC8tHDPfBiCZYTz1k4ZqxiF8oZwq+LXp7/3g3JY0B5D2Ujqt5NzF
         6mpLDNkoquE1i7B6JQHusAbusZ6ertg8MfzY01hxn5bvPx4hiDsMm472a4/LFXLYWBrZ
         LB8diw9CfByjMmwPaKkDIoAzSXhcvST232VDjd8qW1kMpq4ih0gS3M1VgU9Hxs6Sd5iy
         5kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767807951; x=1768412751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=07ypZOUFUGEXXmt2EssDaX9DCT/Cq3jKiLjKniS0MwA=;
        b=ivrr85exUbyh2hcm3VaTcmN7vb2lf6JQgpAu0uiTjVaAbprRMagnq1hWFLQ7J6s/sO
         13YLwFz2F+a0rcMT766gu8RvDhuvHc590TqMFGA5S62xajpmtoeyTavcA5dYPJ0UImcQ
         A4SbM9JIawMr/4cuXaeXd1mAC5QCwngA098ukf0llXwD+A7hUBxKXTSikAOVNhgk8xwi
         qtXPYXAlDkviNwti7N3EiijW2Y7HEf/nqL05dR2kNZJKtrkKiJ207K6Ah+RAFBmJY1hH
         /BbZuYuhZCaZF6wFjB1c3ek+iyfYy4g2aTwqJ6WLdi8W8l3kTbTmrVtuwLIKP+9Zh0GX
         /tNw==
X-Forwarded-Encrypted: i=1; AJvYcCV+vKjCCJypkQNHiNaFFq6H+W8EnhBPc/jixIhcCivM4A3JegrjAj6/X+dc15iZjS+Xvz5reNIB59itdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJljBvjeRZPZll0t72zDZAChQw3Z+tNxfyFSyA4gJvvDBvhLhD
	RBWxtxKNjt8GuA7IDOglwiPgj/Cxdyj+mrVS4jvUmM7+8p8qm2aFwns0njCjSYex
X-Gm-Gg: AY/fxX7SmvNLHg/v+Ozl3shUTTFmyYIUD0WUDTTCEJwVps9AckzZCeWqw6NLbu+guXI
	1ifCX7K/UDPq6CQP6FQHAKcZI7mjWek58ifunUiFpL/D8YNxRwra0fFQ+6PuQTOOqBdImS64zzh
	mgz/JnYw5bB2s3UBLVBXlW3k3uHDKwXXcQZD568oEWfX5nqGBHhGwgx81kkclwQfiT8/wC6x4R5
	IVLGIT9K8qY5rquuVvXBdXmIYyCVQpjYKTuSi2rqjUOGZnCu7t2zwxqwUeZiV/qGVaX3y+WUVA/
	uF2z1DHs16IY3ZbPFeiPqi9MNHD04boGXKN8SGywyjR8mvlNQtq2SsPPEp2YDQePmHufB6iffR+
	Fc9R0VYJvZQu/Clfc8qVzB3AxVLvkHTw5v9irBcGv4kLTiQoJUJunbYPVm0HuMnaJg84AJIGQVr
	+Dqa+eQzW4RxieB8+v5w==
X-Google-Smtp-Source: AGHT+IGe8EGyArCaPl6GeiH6SavSmbbiVzVu/Bk+lLN8nQq1AiFyxt9JzdYvdO+sL6LB5P6YV/OBpw==
X-Received: by 2002:a05:690e:58a:b0:63f:9448:e81 with SMTP id 956f58d0204a3-64716baea7fmr2229980d50.39.1767807950666;
        Wed, 07 Jan 2026 09:45:50 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:44::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6470d89d4fasm2292246d50.15.2026.01.07.09.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 09:45:50 -0800 (PST)
From: Leo Martins <loemra.dev@gmail.com>
To: Christian Heusel <christian@heusel.eu>
Cc: Gideon Farrell <gideon@solnickfarrell.co.uk>,
	linux-btrfs@vger.kernel.org,
	regressions@lists.linux.dev,
	arch-devops@lists.archlinux.org
Subject: Re: refcount_warn_saturate in __btrfs_release_delayed_node for 6.18.2-arch2-1
Date: Wed,  7 Jan 2026 09:45:38 -0800
Message-ID: <20260107174547.3875297-1-loemra.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <584c770b-8e59-457c-a8a4-0f9630ec9635@heusel.eu>
References: 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 7 Jan 2026 14:15:56 +0100 Christian Heusel <christian@heusel.eu> wrote:

> On 26/01/07 02:52AM, Christian Heusel wrote:
> > On 26/01/06 05:10PM, Leo Martins wrote:
> > > On Tue, 06 Jan 2026 22:01:58 +0000 "Gideon Farrell" <gideon@solnickfarrell.co.uk> wrote:
> > > 
> > > > Hi there,
> > > > 
> > > > I recently experienced a type of crash I haven't seen before on this system which seems to originate in __btrfs_release_delayed_node on Kernel 6.18.2-arch2-1.
> > > 
> > > Hey, thanks for the report. This looks very similar to a different
> > > report that has been fixed in 6.19-rc5.
> > > Report: https://lore.kernel.org/oe-lkp/202511262228.6dda231e-lkp@intel.com/
> > 
> > I think this is the issue we have been seeing on the Arch Linux
> > infrastructure aswell, see this issue for reference:
> > 
> > https://gitlab.archlinux.org/archlinux/infrastructure/-/issues/788#note_385420
> > 
> > This has caused us to downgrade the kernel on all hosts in our
> > infrastructure due to the crashes caused by this.
> > 
> > > Fix: https://lore.kernel.org/linux-btrfs/7c89417ac3352ce3cb0a6373a1746155c1e2754d.1765588168.git.loemra.dev@gmail.com/
> > > 
> > > Please let me know if this fixes your issue.
> > 
> > So far we have not found a good lab-setting to reproduce the issue
> > outside of the production machines workloads (but we have also not
> > looked into the issue a lot).
> > 
> > Do you have a good reproducer already that we could use to verify the
> > fix?

I believe the lkp-test from the original report is able to consistently
reproduce this.

> > 
> > Also the fix is not yet even scheduled for inclusion in the stable
> > trees, since it is still not in linus tree right?
> 
> Sorry, I messed up here! I got fooled by the output of `git log --grep`
> and therefore missed the commit! As pointed out by heftig on gitlab the
> commit already is present in 6.18.3 which I'll try to roll out to our
> systems shortly! :)

Let me know if you're still seeing any issues after rolling out the fix.

Thanks,
Leo Martins.

> 
> > 
> > > 
> > > > 
> > > > Here's the stack trace:
> > > > 
> > > > ```
> > > 
> > > Are these the first refcount_t: warnings in your dmesg? I would
> > > expect an earlier warning that looks like
> > > refcount_t: addition on 0; use-after-free.
> > > 
> > 
> > This is what our stacktrace looks like:
> > 
> > [...]
> > 
> > Cheers,
> > Chris
> 
> 
> 
