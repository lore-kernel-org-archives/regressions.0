Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DEC3F1AA2
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310601; cv=pass; b=KIV39OPQ2VXO2LT+nhtfd85tpdncb5tarZrJRq4X5nJnJrq82vJO2I18wr/yyyCeF9pqQPFR2KutLWZzL+9EGxGB/b5OLkuBwdC0dOzdBGELNublyg83W4BW9NvXHQ0W3zDyvUB6/EfSTCuPQtkLnl/hgbeMtX5LUnbLNJ7E86Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310601; c=relaxed/simple;
	bh=s50I1f+RlATnyS7ncxttVC4STee39n4jtfw1TIV5Yo8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ps19FSCw82rm3VcUjJLv1dS4mAFoxvdv+VE0gNNKdsagCvHYqSf/noYAFfjPntEXFaWQXZAFJ0Yra9uI9snibFZGVYf4yZgc24l4VxVeQzmw8Wg6EBtOq3vy0wLVb+I9VXkWTRTXUEwhrSI+O69qmRQmjhI/LDi7G74zcwb42e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvcHKyIF; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvcHKyIF"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso935206e87.3
        for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 07:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789310597; cv=none;
        d=google.com; s=arc-20260327;
        b=FZrvrbwxt4xIn6vAfRRaKYFrPKHGFBC/U5i0Yuoq4CrGhNR56aiM+f3EhqRwL+m4DP
         52Nq4wAWz0aDCkTH7jOO2gxcz0rHYG13g4XOYVwJInHIGv6R4kdYrArmYwv7+g8mzPd0
         0pBcBlLlaoOT9kpecmr59kJx2oCdAs1bAQvqFBWvH3ZhR4bnzEVhZXlg8gxrXgnpQ4Id
         GjNPaus2CGMVEgtm/bpk54kZAeHyWvM7Mhy3mQE7dJJUGxjw8ZmyHgfJq1Q4+kExmfXa
         vEOKHkThTsz66HTHiNtFj5iVWFhLg7cprcytakTgx78SIsoNMiU6iMSpXu46Ox7o3kac
         KQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gDlSeCeZClgynUnsugyjmVlBCsPDuPwIPykfDcGyfzM=;
        fh=VF11cWLfeT+kb+Y3wPghSCka54PlmRUNQuDToZwxUaQ=;
        b=qx/vFwa9lP+/a5zMrGgyHJl68vUT/efnV0gL7x4iaohLSBP8PWqriQrhGWEDy/2FbM
         EZiqQkNnjKunx1nP37syqNZIZNiVyGCSrcdLq3eH6Dy55oSa1PjM1HzfSKddXFx3wjD3
         aLUCjFu5JsAP2zF+4lsKFawjKq6B/aSV1XFdsnOq7CQCr/k+dDcgA54ghcu9+ezb16MY
         ncP/mKNg6lz7qgRuKT3VtCPvLrqa98/YZOcr/m7ccVjIDKdazqrAIrfLZhPuhzHvRvJO
         BzHAgoXQB9po5jNZjj6rbhwH8jyVkqtm2BNzArE5+JlaVpLdl1wABSr8BY0vP2FAcgwh
         ockw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310597; x=1789915397; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDlSeCeZClgynUnsugyjmVlBCsPDuPwIPykfDcGyfzM=;
        b=nvcHKyIFjwetpt+UIfbM7euByDk0eNStjkwMFQ4b7XFZcZZBN3iJcQbxMGgz+LY9d5
         pILGpAhnNfEJW53MYMCQpHYbWbAkoiK/aZogrrfblEaulAYIsoHHgrtuWcR8hhq73BTg
         Epfm1T9a+D+rERsSaWNmx606IsHaiZ+I97qe92aQY8zsTizSXNdHHJ6drnmwrEkT4oCe
         rFZ/lGwb/SHyTjQU/ksTVoEvjr7zetN8O65qCP/ADamKuviosWrJgSN58yp25DLUB0J8
         L+diFSLbb7v5Lgbktg2oXkxTTZyemGVsqGMzKeXdd4dfn4sbRpeJ5HPf/MR73RkZSnZb
         D3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310597; x=1789915397;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gDlSeCeZClgynUnsugyjmVlBCsPDuPwIPykfDcGyfzM=;
        b=KbUO66iMZCAda3gKBiyL3jYUOTtAPrAScaXAjOqevmxiKydWCqJRvWzsrY8mIpZdvM
         b1AXTYz9ZmeCNUekUt/bH2K313HFqbklNOmDQjft6wH8PGWfnQJtahVjATn4+7NpErYq
         U0E6uDU8PuGMhDiYj91g8NYfovADZrz98eDmSenS/5pfxh/Jbgqcnk589jhzdVw2UD+X
         cpvmT42XAE7Yrqgh9ogVVMZu8j5jzmO3vU5jaqe+06FIOI9xWS+ofQ6qBktK44riKFv1
         50jWZrMsu5Rugz1dN/it3bOlsSI9PfwtJC9c7qYqC7+DWyUYoSsxnKb0Gm0/PAUFhUW9
         bLFA==
X-Forwarded-Encrypted: i=1; AKwUvBxqz60KoI6itAI6ESK8b3su5RHLwfdflOFrFmQXUCIIEDtPmk6UZWCdZBgFyyXpx8maq/65CF8RH0ssOQ==@lists.linux.dev
X-Gm-Message-State: AFuF++n5355/BWwT1Em0UmuvF6vNog4qXnlymsWI4LuhsmmFDiSMQqfy
	iTVY+1apSwr5JvSdO+Ob26CKH+wr/TkcSjtjcnyF5OO3wZDj+o7ucYr9NIB21sKzyZ5iLcqw0mJ
	kdjq9NLpCCvFN1rsqd5FaG9rc3Xs1eCo=
X-Gm-Gg: AYBFou1Sep6PSdduYGkFwFlURjdPbsasK/wvGBqQOM1SHhqVWXGqeU9M7IKkDT02qso
	vxYcIvhAVzrlpa3zZMbFlbMtjyNwdj8y29ppX0AQ4CxjJ/NPpRq3eunXmBqKSaJ4VUAZTqRu1tm
	Mh9DzI15QMC9jVP7JtfCShfGqW7NCXRR4Qf+ZITdJmEtziVm26vvwnIIWTFLrBdf04Tkbq+J5+9
	D9I5QxnrkCMbOohNt5R5i6Y46tG9w0/q/1tkMy+9RZchuiBjA/sjBor/XclLBkOKqdZFLBGaROI
	PvozXaTFpZnMUJX7TgYYgfTc+u8a6q4c7loOE42Gr2+ZmQ31Umh4lYR2zMb+RWRnv7RzfLj19Xt
	STz3101OLK9ftne4=
X-Received: by 2002:a05:6512:108c:b0:5b7:6682:17b8 with SMTP id
 2adb3069b0e04-5b8a8ef6a7fmr1282624e87.37.1789310596997; Sun, 13 Sep 2026
 07:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Sun, 13 Sep 2026 22:43:04 +0800
X-Gm-Features: AcwNN1X5pmsda_UiZ5ntCUgJCNHKWL9vQ4K7aO1nbiEQVANFLK5Pbt5CxzkS2Uk
Message-ID: <CANGjgdn=H50AaA-+O_GA-hkE9UwLANmkjx1zRsKUzxF5za8VfQ@mail.gmail.com>
Subject: [REGRESSION] kernfs: empty cgroup rmdir latency after
 delete-notification changes
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Jan Kara <jack@suse.cz>, 
	driver-core@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi T.J.,

I found an increase in empty cgroup removal latency across 507d8ce13f5b
("kernfs: Don't set_nlink for directories being removed") and eea5d2bb34ba
("kernfs: Send IN_DELETE_SELF and IN_IGNORED"). With sched_ext disabled,
rmdir() went from about 6.5 us to 9.6 us, an increase of 46-47%.
The result held in two independent runs.

The workload creates an empty cgroup v2 leaf under a private parent with
the CPU controller enabled, checks it with stat(), and removes it. It
places no tasks in the leaf and does not register any inotify watches.
I time mkdir() and rmdir() separately; stat() is outside both timed regions.

These are consecutive source states, not different release kernels:

  base:   f917dc56060a, before both changes
  guard:  507d8ce13f5b, the nlink race protection
  notify: eea5d2bb34ba, plus the deletion notifications

For the second run with sched_ext disabled, the medians of the nine
sample means per boot were:

                         boot A       boot B
  base                    6.504        6.528 us/rmdir
  guard                   6.956        6.922 us/rmdir
  notify                  9.553        9.558 us/rmdir

The first change added 6.05-6.95%; the second added a further 37.33-38.08%.
Each run used fresh boots in base-A/guard-A/notify-A/notify-B/guard-B/base-B
order. Each point had nine samples of 128 removals, after 16 warmups.
I used an i7-12700KF, CPU0, full preemption, the performance governor and
Turbo disabled. These three kernels used the same toolchain and configuration,
apart from LOCALVERSION. I used the same control binary throughout.
Removal sample CV stayed below 3%, and endpoint drift stayed below 2%.
The result also held after dropping the first sample.
A similar slowdown was also observed with sched_ext enabled, both with
and without cgroup callbacks.

Separate, untimed traces showed 26 kernfs nodes removed per leaf. The
guard change doubled the attribute write-lock entries from 26 to 52.
The notify change added 26 inode lookups. A return-value probe found one
directory inode and 25 NULL results. These counts do not show how much
time each step costs, or that a lookup returning NULL can safely be skipped.

I understand that the notifications and race protection are needed.
A local root-reuse prototype saved about 4-5%, but did not recover most
of the increase; it is not a complete fix.

A separate v7.2-A / 2f0c1cf72f46 (7.3-rc2) / v7.2-B check gave
9.919 / 9.719 / 9.953 us/rmdir with the same control binary. Mainline was
2.02-2.36% faster, with sample CV below 0.75% and old-end drift of 0.35%.
Both versions still removed 26 nodes and made 26 inode lookups per leaf.
The later name-hash change was on the measured path, but this comparison
does not isolate its effect or repeat the exact-commit test above.

Results, configuration identities and the tested workload:
https://github.com/lcf0399/linux-regression-evidence/tree/b1eef2a0fb18babbf8e0d5832b63a655bfd28926/kernfs-empty-cgroup-removal

Do you see a safe way to reduce this per-node removal work while keeping
the notification and race fixes?

Thanks,
Chengfeng
