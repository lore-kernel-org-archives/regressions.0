Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844344A2E34
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333601; cv=pass; b=J1PP63opA6r0ZjvDcyqm/QF/ol/1RnyrbkQ2Ww9lxSSFLogAMvN3p/Z2XlriyHk5slZn/HXWoqk2sj+MdglIiTPszA+gScohxwhgBJlhkPOaBXlcnNd/tL0Su8RlQ8Ctek1tLmHzyIVhsKfn8iXb7CzibxJSC39wIUZxTYUA0gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333601; c=relaxed/simple;
	bh=4qe50KTIVPbM8CANycvSYRvypNB4O2/hGZYA+ySnSMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDR0+8JXZVbEaO/yl5IPItP6YBp25kwT1uCMXG3f0SM/IVrsvfI6ZtiZLgczuALD8ZPLDFBP00EcnLnVW1b8jIwgn1lrfFFTv0oQ9OlP2oTuEpDUZIzsCLGZHR/P4SlNQ7JT7NKsyDQHSsrG2HkkJfpvYbHbm+s766eckEQXtJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R6LOzSTh; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R6LOzSTh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ccdf36f63dso123035ad.0
        for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 06:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785333596; cv=none;
        d=google.com; s=arc-20260327;
        b=Dh4wVOJF7etzAU/+YuP78IdofQ4vqZMAhUh+SJpPxSKHo4RYVQ7yCkjHAhx9GUxwYS
         EVxyux2SJHWSM2eWOlypDH6IE+95m01H0CZA3BVdaiDgdayGHyps97g3Wbo/12CKzAs8
         5AfJIci45bC+dKDsgwlECnae7vTV0aXO0nxwKjc4wr63yrgO7xmcYjCibZJ9OnRIppMr
         yS9dzfHC/3uBpIV4mU5ByXvvjbT/jY1hAXfmiX5gx/MMwkGJgAjytUe3f3GfdiXC6uqn
         dwvlzaJM+95+Tw8Ls/nIyLCUs5mlGDXVnHtbg3yfW896BjdE/l+Yd2nuGEM2+wzlOijY
         ECIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dKcySLFaScFmr1bueu4Vh/oR9sazTcKBYENtIklzl98=;
        fh=9XyUps4VVd2SJRPsQW1RxuJUW45/1cnM1nznb8RSd+c=;
        b=bcR/wtfPACpNlSO7i80SwRD1JG3iTx9cLbnWmzuaeLNyUWhNRYSb0aOUn2P65OC73s
         oy/uiqqIGShFSrz/YzR0m/8B0D7FfWDr3V/jmgcn95XfumvTpii+FEABjEl9bjHX49Bh
         dBa1w++pFoEY/Ym+gELKHwwiyNquBsB4csWL1qOwTInnQG5uimN0inG8PeCWKQ8dstIV
         7AmM5SdFNKkAWJvReIfbLtN7lMTvZaftUWnWmdY3CPHGMNxoEOqq8JIIWpJGcGuqNQSo
         PEYFdRN0NYqpPWzSZn1e0gn4wzHltYyOR0fTU+2lQxVrPcIKdhxaLh2oxeAM5L7U8ag4
         bElQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785333596; x=1785938396; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dKcySLFaScFmr1bueu4Vh/oR9sazTcKBYENtIklzl98=;
        b=R6LOzSThCmQQHqAdX+6v4ShYq0JBl+vAQJ51PegKlolNwab4DyPGm7N0qd0tjSFTo5
         dzlzcyB/jMgjXH+pSkF4bz80wpKtxLDFWhE/E0k4Og+d0p7Wlljq3JosT8hyxlvfQHnr
         4q+iRUQGXb+TWMBD+amvIA3BXuGry+/qYxgIJ9I9eYMyCEd5bZes3Ufdcq+aTho2Ezur
         97gV+9+pHWGaAwnXoNobPzcHjG6aWWPFPaD8eWXvQXvip604Gzx8imBsArnNEDGcgBW7
         /HZGUd0GzImgJM2kLu78BEuj2exNQKgADQYOOFGSa7m2sfumIezYwNL/vg5nFQZG6bfR
         fAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785333596; x=1785938396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKcySLFaScFmr1bueu4Vh/oR9sazTcKBYENtIklzl98=;
        b=sEUrRk227YJQS97dcbzsE9BOx0rFf01hzL5gZL09z3nc06ZGemPZ2zG7NdYcxvtswr
         4/kwqdhboQFu/7TbROjK78eZnarWE/0NTi7KnJXzTelkzNzTuMLwWDiayQrvJTcg4Z6k
         sxsxrkFq24yRhy1my4jPW6EmEgCVqgbX8dx6/bM1Y4qzFb5VvtxdxM0uB/QETYr+2ywa
         vjOdcCPvObpkv6LsseNlSXK8Px0e3TyL2b5Tzd3L5cTgKgq1E0K774Y4GcJqDmg/Dokw
         aZlQOAH5A1WhkysTugQf7OJVtZXgwOKN+t5tTyb36989o5InndYqIYLjlRi7918/y2JU
         8jDQ==
X-Gm-Message-State: AOJu0YyH1sfde5eH2HxWO6b0jsTluuU8oTiRW1B5xjmSfzdVQ+H52f6Y
	rMgGPoYq9Xd/HTZozMIDIoH5kiXYRMZby/sQIq118fVCvGINXwGwlt+o3jJFCKlCZQt0/gOu6JN
	Sq10x42WXZFzHd3aQsm13aPQQ86cRaQloysiJ0yvv
X-Gm-Gg: AR+sD13omgFiJjBPE4dQMEgJ5p0O+AI3jRxK/SVf6WXWmRHiHtAffzxOg9SQGtDHEzg
	hbsvmVOkyyQmjTWE+NTmxW4Dn1q3QZEnPOK8bIEzGRcVf2sUNHSeMSuSIcSUBKEgI2pPTCPVJ3j
	4m4z0dqgHOKo4DkyM/ETMkBatjtl2nA+1u5hYmab3/C5a7eiRoMCUm3QwQE3DUjj7PqPAFfK8aM
	/erttj4L8xd1NejgbIbALP/5tnP8C06f6GmeX+u4SguWZ8kSA1yXrEp6mL9VqfWeCv+9gYBH/6R
	jfYKS4iF4WWit8ktE/mvIlXM5noGClO7wOWDmpPEEHt4pzs1URHnbDkas5ST6o6tqObuIXrlu3q
	6F+KcD1UOUE2fC07iYF1ljQIkrl/ico4=
X-Received: by 2002:a17:902:ef06:b0:2bf:1000:d3ac with SMTP id
 d9443c01a7336-2d0287cf9c8mr4618065ad.11.1785333595219; Wed, 29 Jul 2026
 06:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHmU7G=Dsf31mJ1VH4+Tp-McSvXCg=GcO-eC+O52-_t5gc7Pyw@mail.gmail.com>
 <CAG48ez1UqV8E8nHGq50orS+3oqXbP80R6g7kVa3Hq-domHCSsQ@mail.gmail.com>
In-Reply-To: <CAG48ez1UqV8E8nHGq50orS+3oqXbP80R6g7kVa3Hq-domHCSsQ@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 29 Jul 2026 15:59:18 +0200
X-Gm-Features: AUfX_mxsSGeX5Wk7ttteu_H2elB1yzsLWm21TrFa_WMDUNzOOPYaOsNkMreMWbY
Message-ID: <CAG48ez1tUk+8b7-eWw-fHh2x_bJA1n3CTANVWKQuPW=J+inCrQ@mail.gmail.com>
Subject: Re: regress caused by upstream commit 6650527444dadc63d84aa939d14ecba4fadb2f69
To: Pasha Boroffski <hex.dec.bin.oct@gmail.com>, stable <stable@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: regressions@lists.linux.dev, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:45=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> On Wed, Jul 29, 2026 at 11:08=E2=80=AFAM Pasha Boroffski
> <hex.dec.bin.oct@gmail.com> wrote:
> > Hello.
> > I believe 6650527444dadc63d84aa939d14ecba4fadb2f69 has a bug in it as i=
t causes "kernel bug" with PREEMPT_RT enabled.
> > How to reproduce the bug:
> > i used 'find /proc/ | grep 123'. When scanning, the kernel triggers an =
"Oops".
> >
> >
> > [  344.465851][ T3715] BUG: kernel NULL pointer dereference, address: 0=
0000000000000f8
> [...]
> [  344.465888][ T3715] CPU: 0 UID: 0 PID: 3715 Comm: find Tainted: G
>    D    O       6.12.98 #9
> [...]
> > [  344.465905][ T3715] RIP: 0010:down_read_killable+0x9/0x40
> [...]
> > [  344.465974][ T3715]  proc_map_files_readdir+0xc7/0x500
> [...]
> > I think calls
> > mm =3D mm_access(task, PTRACE_MODE_READ_FSCREDS);
> > if (IS_ERR(mm)) {
> >   result =3D ERR_CAST(mm);
> >   goto out_put_task;
> > }
> >
> > should be fixed like
> > mm =3D mm_access(task, PTRACE_MODE_READ_FSCREDS);
> > if (IS_ERR_OR_NULL(mm)) {
> >   result =3D ERR_CAST(mm);
> >   goto out_put_task;
> > }
>
> Ugh, yes. This is not an issue on mainline, but the API contract of
> mm_access() changed in commit cd3f8467afd4 ("mm: refactor mm_access()
> to not return NULL"), which landed in 6.13. So we'll need a
> stable-specific fixup for 6.12 and lower.
>
> I'll try to come up with a patch for stable later today.

I've reproduced this, triggering this NULL deref on 6.12.98 is as easy
as "ls /proc/2/map_files"
