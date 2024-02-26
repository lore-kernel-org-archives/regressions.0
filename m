Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3D21292FF
	for <regressions@lists.linux.dev>; Mon, 26 Feb 2024 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708968956; cv=none; b=BpVSVT1mzhBm2BAFUhIG+rLb66un/n8mIi4WLZBZI3zrLl8sorinUNocWelXtnt7z7LuZAZf/Yx+ktJKFTdZiqO4ONcj5VnxBv5NgqeYUJaFOC5O02Amx7rzS+agFdS8aHQI/fUreF+qsg2W1H7v2ygTgCCagyT0OkcVBcgnRnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708968956; c=relaxed/simple;
	bh=uAZCvej72rsWxNZabaonUFsDuRFWj2SlvFhLl3wnwIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pULa2PxJ63CuAfnA0TJeWz35ftNjNm7V6mORFQyMbFb3WySuQQ6XLDMEJqjY6XNxzmZLtU4XSP8Ua4TJMyaUZaelMqyiOC7pwIjQyS9MBRGB16pBuUqZggskNAYaPsCum4lH/Y8yHt40/kIPsPfzqKL/hKP4Z4RMANAxk9r9d54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/X0ypbU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/X0ypbU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB40EC43390
	for <regressions@lists.linux.dev>; Mon, 26 Feb 2024 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708968955;
	bh=uAZCvej72rsWxNZabaonUFsDuRFWj2SlvFhLl3wnwIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O/X0ypbU0mIHjj51ayDlhG+YsSEPp44zCGu8hKey0yKajs3pur7D41RwVk3Ff+Z93
	 /QgFxL9XBWj1/q9txfp3lOLBzAPkTuW0qYnJNbApG1GXc9nqZHhFp3ZS9qvK9uUywv
	 9bbnDLoXHcKJTWmiBo4vlsEDoBFzekzjJEF2Azzn5YZ9lA75YxsHlOP70tlZSpjTDQ
	 wBaqI7MASmCnC7MUtcxhxgGgf6uoPvmM3dUwkTs+ZVssuaxiaxNmmvr+HY31/AKiR1
	 be9OZmuDmk6Ke/XvHf/s+2JmepOL3mJLVqTazcgYs/xbEETws6XNTSf3A5jWr7pVFp
	 ORxypQoGeozQQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d22fa5c822so48948961fa.2
        for <regressions@lists.linux.dev>; Mon, 26 Feb 2024 09:35:55 -0800 (PST)
X-Gm-Message-State: AOJu0YyWrjZTGYGhCYwHtDxyqnafa5VzCr76ixryjJXFe0kOhiwSc5HP
	QTt70e7n8SrkwJjV/ZGLgE2ljdLwsWC3Dz3ghtwg0oYr0itBfLAQgJmco6NiCtLLwm8kzOJaumh
	NZulJ5osjQA/lfACbzFKQOemjTI8=
X-Google-Smtp-Source: AGHT+IGWw3pd9/ktF7JzQEv1gXsWnYvK0+NqpOTH+iECgCn7WnG8Yf4maidcDFk39iH7LtVpswZ1QJUVOe0tVfqOIw0=
X-Received: by 2002:a2e:a227:0:b0:2d2:63bc:952 with SMTP id
 i7-20020a2ea227000000b002d263bc0952mr4083500ljm.35.1708968953998; Mon, 26 Feb
 2024 09:35:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240123005700.9302-1-dan@danm.net> <20240220230658.11069-1-dan@danm.net>
 <7efac6e0-32df-457e-9d21-4945c69328f8@leemhuis.info> <CAPhsuW5QYTjBvjAjf8SdcKmPGO20e5-p57n6af5FaXudSiOCmg@mail.gmail.com>
 <c21ee3c9-6cb8-45f7-ba46-880cee757cb3@clark.bz> <3470e4c8-4bd4-497f-812a-0c2e290d4de8@clark.bz>
In-Reply-To: <3470e4c8-4bd4-497f-812a-0c2e290d4de8@clark.bz>
From: Song Liu <song@kernel.org>
Date: Mon, 26 Feb 2024 09:35:42 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5Pq2iRzk02vwN90BXzjkWcQ=X2u3VNU3L-iXBcOfH5pQ@mail.gmail.com>
Message-ID: <CAPhsuW5Pq2iRzk02vwN90BXzjkWcQ=X2u3VNU3L-iXBcOfH5pQ@mail.gmail.com>
Subject: Re: [REGRESSION] 6.7.1: md: raid5 hang and unresponsive system;
 successfully bisected
To: "Thomas B. Clark" <kernel@clark.bz>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, dan@danm.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sun, Feb 25, 2024 at 5:17=E2=80=AFPM Thomas B. Clark <kernel@clark.bz> w=
rote:
>
> After finding a few additional responses to Dan Moulding's original
> post, I would like to add some more detail:
>
> 1.  This is a real issue, not a quirk. The first thing I did was rebuild
> my md RAID1 device by deleting it, wiping out the superblocks and
> starting over.  I had to boot into 6.6.14 to delete the md device; in
> 6.7.5 the system hung while trying to stop it.  I then booted into 6.7.5
> to re-create it.  It made no difference even when the md device was
> created in 6.7.5.
>
> 2.  The original filesystem on which I experienced the issue was xfs.
> After one of the RAID1 rebuilds, I replaced the filesystem with ext4.
> It made no difference.  The md device causes the system to hang whether
> the filesystem is xfs or ext4.
>
> 3.  For what it's worth, my RAID1 device includes a hot spare. I did not
> experiment with creating the md device without a spare because there is
> a limit to the number of times I can find this server unresponsive. For
> now, and until this issue is resolved, I will be running 6.6.14.
>
> Finally, I can't find that this issue is being tracked anywhere. I can't
> find it on bugzilla.kernel.org nor on bugzilla.redhat.com.  Is it being
> tracked anywhere other than email?

I think you hit a different issue here. The issue Dan experienced can
be fixed by reverting commit 0de40f76d567, which only affects raid5.

For the issues you are experiencing, could you please test with this
branch:

https://git.kernel.org/pub/scm/linux/kernel/git/song/md.git/log/?h=3Dmd-6.7=
-fix

which is 6.7.6 plus a few fixes queued in 6.8 and 6.9 releases.

Thanks,
Song
