Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906392F5A13
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775158486; cv=pass; b=cIIlTmiPSwguktqXip817PZJ/OXyg1O3RVwqnmINtSJrWirMlDjglid9FdezBORhd4YIm4NQ6ZkmKxgvpJDML4XYfqhCMq746xZOJmFpL4e8+SwKzcuD1AEdxe7CX1i3CFAIK+/O7Tkl9TXaLOGYo4FLQJXqSD89GQoAp4bpUV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775158486; c=relaxed/simple;
	bh=RE3MQJyls7bYSxFd567S+a6QLPI5oMttHzgK1QO6SMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyPzSAu0TmoZvJexsvKBxlPlsqsW3bVRu1ds8vm94QVKEWxf38M8Y/3va3zk0s1IHSjWmkuAV4iI0BKSNpA0eMCidIt3SNlTU/+UAc/HYcoEZMgDVHUREWF1hNyUUVNLPcpmLi7X2u5hvIY3KB6y9SL1v7WcZSYQTAm9zRWZI/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6UsaqQq; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6UsaqQq"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12a70b4de9bso66411c88.3
        for <regressions@lists.linux.dev>; Thu, 02 Apr 2026 12:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775158485; cv=none;
        d=google.com; s=arc-20240605;
        b=df8rx1YCtqoet4/cIOQk2EAVE5h3QgcbbsYhb9TxWi/i/dYcDRaHfAa7H/GPuzWrcs
         bLKm/zXScOfqpYXtKWwnQ9QewHwg0uGHVrZosSb7X+3ogBtPLJuLx5nUEAH6kMhBx+YV
         GGBSnOToZvuzdHBtiPMGr1+Gd8EJ9SbcihqzMuUgplz1I0ZGm9ucSZAxr114RzeXBS6d
         MdO3pNV4p9/q8TLhLuAWWAmqROj0DKlE0/Wp8kjKQFvFvKMoD6lAUN8MtlGlGe/7mk+C
         0nAiSYtCUOjckXcy1YKJUYYS5Wvwlha4nWUxEgidipdjh9ZM8fGjYgHxAdQt5f0pWDYZ
         ELgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z6paV10TjiBBQpUTwHKDd5p6LgrjhSvi+dQvAUrRBGg=;
        fh=E0n2xCqaX6lt2ZHA07qzpkqK/xfI/b5ZtWaXDCk1JLY=;
        b=JryembaQ/nlWvSNc64nQtq81/UmM9ryNHJSlGuGttNmxg1hHcAvgSS3VP+1cmSDuhU
         oXF3KQLElRF0EqqyggcuZSw0pmn0M4Pq9lDWUz0rumgfNQOO/QBgJAHMwT7/0/PfZLDu
         NwpCc0QKRwMm4RgGzqGd/H7wtsBmli1UNk2k2K7fc1kYAxgkDjcLGMAEpm4RurbUVHD2
         +UJRSlX/rsP7bzfq5ES16qHnDs0TrMwwqduC3FgtQ0sIXKVubw5xeChs/v05JHt3a6La
         0FhE+TGu05gxr3CEWadndXFwKlKCaMs9yrKs7/pUd9/FOhkb+1/PUt/qojg3B5ZLpZFA
         ShrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775158485; x=1775763285; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6paV10TjiBBQpUTwHKDd5p6LgrjhSvi+dQvAUrRBGg=;
        b=C6UsaqQqB8rO9LFLprf9HAkD3lSZ078R6v1AE/DK7aG+wdl6+q1cQuHITzJUWJEpm4
         hecqnj7u0Vvz0bIk1E6tsPNj8KbNuOYQQlA9jEHKhW1cf3D1BOgBrMOP7QpCSMXlbIRV
         sTQ7a2ub3eSX3vbgm9gT3WnRWzjZctRCw5F76Z09wRe3TIj1/Gn37fgbXbmiXRsPy+Yi
         Q/gtFdp+MHpJZOupB4qgVOXupQ9akO/bK+7ALKWQ2UYpD/AP6vduFIxLNbU//fF2XxoL
         CcUUfGDpYopyBu3KtGOXCfVq9jqboIVIntxLD/oul27IJVBJrnxod75pSBaxjGkwxT1P
         6ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775158485; x=1775763285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6paV10TjiBBQpUTwHKDd5p6LgrjhSvi+dQvAUrRBGg=;
        b=L5dQQnDJfs68+16hVvG1tl0d/JvMa9Bc9vsSVcTMXgEzz9qs8lBJfX+we9irX9fuuc
         6NbVd9pbv6iTuNSd6zlFou4FMLQTxlhuYKZ2Je3CSSRoyS+FW9Dqw6JcYHdl7adqznZ/
         WK0UuE67iHSe8wIeelZ3KO3eyuPytDyicfx3s6lPGgeTNSpbPZQYt5rTQDvLmKddh/r0
         8r8mCFrS8faiWTmb1VwtikqnO/n2xPRgtQXWb8O3DdLIXmHPLJW5q1YXeaE+9nhWgvUq
         i/plVEmRWrGXwkCXokoFuxfQGtoh5MWY3P7dYuzZT6naqVtUwPuU01xK4oVgQugwqh13
         Lt0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6PAlhC8Q9aHAiTf2nv3fpidSc+02+h2kXp5GAyISKO+Q5oWQX/z9gqyaZzs2YtgmD2MJadnANeV8dJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeDzzl7HS+GhhfuCWxloMM8S0hPJzCwMLLdxdy+rFfqHWVU6zc
	gP6vXNl1GD47op01yvmaDRInbOwHfiO63sMdMs8VJUPU8ZpXVhUgmiCxljlys/PlCK9hRKfBgOr
	EUTLk4dZ/0IYlddGlc9pZa9bk6MzIUr8=
X-Gm-Gg: ATEYQzwu9s9eLeYTJ4829o5YFi8QTLGKfdOBVFkszBbcGFL/zubHXt7ihZIxuO+ZaUi
	iqBSjts+Wm11X9yeW++MyXdC/1cgbhOEVyEKxysH+UAg/DkXS4mTCSv6oEkNumCZ0QVNAkaa6s8
	0UBpzWeiv1G7QTEithhn9ej7HMTuAbFdvM4cfzd3N3mMZ+P3A7QAUtNm6sHOGaKF40GoFAd/dIu
	aMLpXn6AIlbkr7tuGys7PqOjVFd6i2PVhTii8eS9f+lsGRvV0rcgQ2jNeHp5vin1HVh5Au7V8ZW
	n+fZLQaDXRMBWHVgmD1cxzv3Udy+aiPNGHlvwzIRDZKJwjvOddRpNgiahCsuj5Ls0tlVkA==
X-Received: by 2002:a05:7022:4396:b0:119:e56b:46b7 with SMTP id
 a92af1059eb24-12bfb6f27dcmr67982c88.1.1775158484591; Thu, 02 Apr 2026
 12:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401184456.3576660-1-alexander.deucher@amd.com>
 <47c508c3-3424-4e8a-a63c-1f29d13b6ebe@leemhuis.info> <CADnq5_MiFOYLP9aUnYw4HFb-xWLZdq245ZB3e6iGn09ywOsY2w@mail.gmail.com>
 <CAHk-=wiNdTNNxzRuxXYq1Ebpiv6YF4UMZApoQGnktbMjKFYP+w@mail.gmail.com>
In-Reply-To: <CAHk-=wiNdTNNxzRuxXYq1Ebpiv6YF4UMZApoQGnktbMjKFYP+w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Apr 2026 15:34:31 -0400
X-Gm-Features: AQROBzDmFsLYBUfG_KyTv2yWvRF9jyysl3p7CylmtFmeiPAhvDxo-SPdx5QhP6o
Message-ID: <CADnq5_Ns+NEm3eNJjs+7HG8qBnX8OX6TMsj444B4xFW7=z7P8A@mail.gmail.com>
Subject: Re: Regression fix for audio issues with pre-DCN401 chips (was: Re:
 [pull] amdgpu, amdkfd drm-next-7.1)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Alex Deucher <alexander.deucher@amd.com>, 
	amd-gfx@lists.freedesktop.org, airlied@gmail.com, simona.vetter@ffwll.ch, 
	Linux kernel regressions list <regressions@lists.linux.dev>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 3:02=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, 2 Apr 2026 at 11:27, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > There are always new fixes.  Worse case it ends up in 7.0.1.  If it
> > causes other regressions, then we end up introducing a new regression
> > in rc7.
>
> This was a regression in rc1, that was reported several weeks ago.
> Anything that gets reported that early in the release cycle is bound
> to hit lots of people, because the number of people testing early rc
> kernels is relatively small.
>
> So why pointlessly delay *known* regressions for fear of a potential new =
one?
>
> And why point out rc7, when dammit, this could have been fixed long
> before and *not* be that late in the release?
>
> The bug was reported a month ago. The patch was posted  ten days ago.
>
> It could have been in rc6 and gotten a bit more testing, but was
> delayed for unknown reasons, and now the argument is that we should
> avoid the testing in rc7 and just put it in a stable release instead?
>
> What's the advantage of releasing 7.0 with a known problem, and delay
> any potential reports of whatever new regressions in 7.0.1 instead?
>
> What is the logic here? Really?
>
> As you say, there are always new fixes. But how exactly does that
> change anything?
>
> The fact that there will be new fixes just means that delaying known
> fixes will only result in all those fixes just piling up.
>
> Or worse yet, all those known *problems* piling up, where known
> problems may then end up hiding even more problems that people don't
> even see because they hit the first issue.
>
> So what is the point? Why are things delayed?
>
> The whole reason we have rc release candidates is (a) finding bugs and
> (b) GETTING THEM FIXED BEFORE THE ACTUAL RELEASE.
>
> What did you think a "release candidate" was all about if that's not
> your reading of the issue?
>
> And if fixes look too scary or uncertain, we *revert* the change that
> caused a regression. We don't go "fixing it is too scary".
>
> And yes, we have more timely releases than pretty much any other
> software project has, and that is partly exactly so that things don't
> build up over time.
>
> We don't want new features to build up over time - long long ago we
> had long release cycles that then dragged out even *more* because
> there just was too many changes and they all had issues that needed
> fixing.
>
> But we also don't want the known problems to build up over time.
>
> One of the points of of "release early, release often" is to find bugs
> quickly - and then *fix* them quickly so that we can leave the issue
> behind instead of letting it fester and cause longer-term issues.
>
> This "drag your feet because there will always be other fixes" makes
> absolutely no sense to me, and it's not how we work.
>
> So  honestly, there are exactly two choices: apply the fix, or just
> revert the commit that caused the problem in the first place.
>
> Because no, "let's just have a known regression" is not how we roll.

My point was just that I wanted to wait for our testing cycle to
complete before I pushed the fix.  In the past I've pushed fixes near
the end of a kernel cycle without waiting for the testing to complete
which ended causing more problems than they fixed.  The testing has
completed and the patch is good.  I'll send Dave and Simona a PR
momentarily.

Alex
