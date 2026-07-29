Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B4B4A13BC
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332755; cv=pass; b=X3sVh6wHpM7ur1zSSDpehuJXY2C2g9u1DB6vsJKVdzz73q8PUBr6hwU5k/jT20Hice75c3usJRpfGDToC7RIjvrT0RIXc9V/on3Q2Qtjb9kGunritnOHuQebdEl050YiPA0sTZ+VWDcM8yWoIulzWg1VQFpi4EWlXugy+jMMmds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332755; c=relaxed/simple;
	bh=mGh7aPjSndBqYRyw5BEhShjb7bEIv1j0KN/b7zULSLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LK0zZSSmh7nl8LphNe50NRZvPqqcM9iedvRTSHRAecmZOLDEwYdv0POhoxjiExHUCLTceZRotEQN3fC+BBjszj2nh1otGYekwN5DBGYaWD3u7C2JYb3zR40XiA1ngIy8iUxRoT7+pyaPXV/DCi+XUlVcu4wJGV8G0Z9UK0XXgYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WReFRYTA; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WReFRYTA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cede6375caso106655ad.0
        for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 06:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785332753; cv=none;
        d=google.com; s=arc-20260327;
        b=OVCi4OpP4eVocGE12fCxQ/wBT3fgm2Ps0WZvzSnQK4dG5xntWsckqkBf1O35hLv9lO
         8mDqnuFRaJ/+/mIvDliaZonEyQtfDbn/c1ehvFipptiVeh4/33IL+qaIqVjRkt0VYGBi
         y9aK8AWvdT1rB1pqYdjBNw3f5l58ofvwr3OJAukwrDvIS+WmnYfJmBkLFgsOyliVvQsd
         OC6twJSyvPADHk+ZtoZu9I5RTiQ63N1wRib30mPVv4+kqWXdZc+3t/txj2O3ZJVBwpaG
         RbuMtyI1Jy/yXz4QdNPQC+6hFMVN9OlmgH2c4105vama9C4NIUZ4aDBQ4bKMAZwIPjzx
         RGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ks5TFAOq/gdfF/gi/pS9Qk0bZtw7kJzlANbbfAI7J1A=;
        fh=HlAT1YuSZ4LpVIaoUeKfYhtlrJZ/LshbEYyh93lpaKE=;
        b=Z6oTFjUaAjG2wFWrDR+ngdWZfC7V2DXFPJ4cZi+JDhz6smfYq7PLOOZ32qxn0sHRKt
         bQQZTLNJda+I2K0PHz4kdHKdGcNJg++HwG9Ajcjh2gICdWfNoJ+xJKV3t0QaHUke7Fec
         4/R6JV+6VC0RdlV/6NrC2tBTioK5aG+3HoaphouANoXJe4HV5ApihbZJ+gIuzefL0QeR
         YwNSDNm6X+CJsD+aDgF1bFQVbct4jyWzxW8/0kW2ED980oDUWTAV7PmdRckGq/JpOOb+
         +/snmWZcE1D6TN3PiiMP/aJt9iCm6NbfnJZTWh72+z9EIhNnTFkPXqZPBrH5wulfjjAu
         b4Og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785332753; x=1785937553; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ks5TFAOq/gdfF/gi/pS9Qk0bZtw7kJzlANbbfAI7J1A=;
        b=WReFRYTATabpunwDdIq3bzFVHt/zihnSPzld3kizJbYP2CLnK/dsbrUnvDZnN6F9ve
         gFq6N1T4PTFDBUESVOt69Gd3F17remY9G4gi4Joi2HJq0nEktqt43CvtsaW5aNNzm+Rw
         rCL7NrwErekhiY/nhSrkOzRb0KkudzRzB0CuV+TK3Q33ZWiHtyq86mbxY5orexuwjDW0
         49Adrt7dikg3l+k16OJDQBRlVAs7C1763WcxbUswdLiya5H48BzfPhgIWwhAJlWvaBC9
         WVzfJ6Lqp7GFesc4tTWP48eyZh/FbQwK7J/jbDDDSOCwRe9kJEpShrSvl+07MIDxgoTo
         1U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332753; x=1785937553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ks5TFAOq/gdfF/gi/pS9Qk0bZtw7kJzlANbbfAI7J1A=;
        b=oz73MbyhLYXVjGOzoPpiihG590WaC1QvuFgT5KXLzyEHpMWcVBTzaZk18dwDoscGqY
         hsEBFMSXDVOQEwQETtmco2AqoxQuAejN1x1HO9fjd0u1KmZ5dw+1ezwLsRHrr5AadZfY
         Cue9yXbgUyYnNsA4YenpHaN5jUhzaE4AY4xZO1dA0puaR1X25iKRiqdjYvXpQpE+0a1i
         JSZpnDrfjMRnilokIz5oWH+FsYqHj9tsQmxVPIdeVWJAMOKbU7TGzdkYj7SOpz//e+gV
         +1s+O/qZTL82Y/GbS8RdCJOza2JUgDarD4NtOwHCKxHp/jI6C9Wm9/BaylUOyAqOagan
         i8nQ==
X-Gm-Message-State: AOJu0YwPgTdnxa6r4PhJb1jYnEtJZPhQb0P7W7nTVv7bTAgN5Au2t3QB
	ZRp6lubGyPvRu5PCK0zSQfQuhFoJll+1GFq9iTxZVHItefB8TbwzcUjVpb4GhHAol7/C5Ew4pC8
	NpS5lwwkaMOtKSfQXmXG9PNF+JU4kGC1fx9AFURPB
X-Gm-Gg: AR+sD1000F4SwXBjs971iWgn0fvtSeZXQEPHeDHOQ53/sBeBsArie1V4VFiD9vSb/rG
	c5ysfTOftHNYHiHVO4//7V//gcy51NFZIywuKzYwBJbxnXnWsRKz5JI55kOCrUywF7sagZpnmfB
	cZdqjc+0OToDyUFI97tSF1+rAmueKXJHtDLC6Z74XBDFSmM8v9CrMuquTmQfQbzBxJ5UkASwY33
	w26yIbud5cyrgWOCAUffDyldmxgKE15xgXtCwAFNIzB0f8IykdrBBj9lplwQEQdZNpOQ1y9y7mY
	u+88KitI2wRjqaBLG6VJ6o/WlcOs8JpSUBxe9Eyu+hddsY3dOWXCNkmr//3L8S5GRisUeVuRxUm
	bp/7JT2ZwXq7v9azGTwkhpNHeJPTSg2M=
X-Received: by 2002:a17:902:c952:b0:2c0:defb:557e with SMTP id
 d9443c01a7336-2d0285f20a9mr3388305ad.1.1785332752533; Wed, 29 Jul 2026
 06:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHmU7G=Dsf31mJ1VH4+Tp-McSvXCg=GcO-eC+O52-_t5gc7Pyw@mail.gmail.com>
In-Reply-To: <CAHmU7G=Dsf31mJ1VH4+Tp-McSvXCg=GcO-eC+O52-_t5gc7Pyw@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 29 Jul 2026 15:45:15 +0200
X-Gm-Features: AUfX_mw1H1BJk8-06Poeq5ugv4lVmHOUqQIoBJgTQ65YT8V8bf_xn_rABd3RXqE
Message-ID: <CAG48ez1UqV8E8nHGq50orS+3oqXbP80R6g7kVa3Hq-domHCSsQ@mail.gmail.com>
Subject: Re: regress caused by upstream commit 6650527444dadc63d84aa939d14ecba4fadb2f69
To: Pasha Boroffski <hex.dec.bin.oct@gmail.com>
Cc: regressions@lists.linux.dev, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:08=E2=80=AFAM Pasha Boroffski
<hex.dec.bin.oct@gmail.com> wrote:
> Hello.
> I believe 6650527444dadc63d84aa939d14ecba4fadb2f69 has a bug in it as it =
causes "kernel bug" with PREEMPT_RT enabled.
> How to reproduce the bug:
> i used 'find /proc/ | grep 123'. When scanning, the kernel triggers an "O=
ops".
>
>
> [  344.465851][ T3715] BUG: kernel NULL pointer dereference, address: 000=
00000000000f8
[...]
[  344.465888][ T3715] CPU: 0 UID: 0 PID: 3715 Comm: find Tainted: G
   D    O       6.12.98 #9
[...]
> [  344.465905][ T3715] RIP: 0010:down_read_killable+0x9/0x40
[...]
> [  344.465974][ T3715]  proc_map_files_readdir+0xc7/0x500
[...]
> I think calls
> mm =3D mm_access(task, PTRACE_MODE_READ_FSCREDS);
> if (IS_ERR(mm)) {
>   result =3D ERR_CAST(mm);
>   goto out_put_task;
> }
>
> should be fixed like
> mm =3D mm_access(task, PTRACE_MODE_READ_FSCREDS);
> if (IS_ERR_OR_NULL(mm)) {
>   result =3D ERR_CAST(mm);
>   goto out_put_task;
> }

Ugh, yes. This is not an issue on mainline, but the API contract of
mm_access() changed in commit cd3f8467afd4 ("mm: refactor mm_access()
to not return NULL"), which landed in 6.13. So we'll need a
stable-specific fixup for 6.12 and lower.

I'll try to come up with a patch for stable later today.
