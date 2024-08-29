Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3DE18A6DF
	for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 22:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724972052; cv=none; b=nPuAvfYrNYauLtDtn7G4bdxaL6SptGEU1JKTZs1J6AWzi4a2z1FpsxEbi2OnB3MmYf0TMqY50IJQ/jCrPxcH//3fCV2vshSB0xSxKblX1UipHD6HC+qsti/lWklgHOEdg8JGwtD0KtHJqxPu+zt+MUZGK2xQy1qqwwUTKDr0pUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724972052; c=relaxed/simple;
	bh=nVnhVzWYQHtGHoruFFT/Mwn1FzMrGxJJQ7+rGWuMUoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jV6Pe3uT19Zor1zTSTFzHn4NDG6A4Dz5n6QRxlMMxJJvYTm2oXQQV+vFVvwSYcHXpsT/3fDjPD+RrUUqJU5gXgzE/jf/MNkwAoCRe6Se9ahnumQfIyDX9XA7dJMLfWbkyPzUD84LfLI7dU0bLYR891cMaINRAhi9xH0ObDHlS8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SUd+yT/K; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SUd+yT/K"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3718b5e9c4fso697121f8f.0
        for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 15:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724972049; x=1725576849; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT/N7885nHKfty/eDWE+p2zE6nTWtJgYs5jLN0H8wTs=;
        b=SUd+yT/KyrLmxS9jP4zRF2UYFZ9EKW6PfLkG4eSONF41jVl23GpCmkQDodc/71M9Cq
         JvUp31IiYwTQbebdtCNqQFsFrG1oUza13zfTx/kpPlfmSkQaGDrGDUb26KnjU4SqRZM6
         bpwIbkSQb3XFz4kxz8PtYTiYusLl5A4D0LHOONsDk1ESNEtLCn0eVwWunyJ7U3+Xmhhe
         jRv0351FQqNYbe/pA8LIKA10Ax/7ROS28WHlXmvUU/O479+UJwpor55xYMgikBdsC0Iq
         gsDptu8bseT+rhf75ukv+CSaPlil8vy+5CzmO/dsTkvqkD3ASsmrqBx+ZFlmF8jwPiE0
         WUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724972049; x=1725576849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tT/N7885nHKfty/eDWE+p2zE6nTWtJgYs5jLN0H8wTs=;
        b=wKO+onghpvVwK9l2ib98n+oP9s1QFfJDYUvvqCLRGrjwr5dN8W87F6RnoPHwSeMIHG
         XCWhOmIlVxzm1N1r4FIjhH6F7TU3MbxU3Ss2cF3cHcrj2WvkpLUwxyqiceFPLUj62j7h
         rWxSz4f5CRuzdQVjRt1MLFsv1SBKRTqJOXny4Mr2/JbQ9udai4ukks4AZ1qcfxgcu3/x
         /Tjqjen/iAaNoIYgvufc9JZAW3dz2VEp3BLXaMOGscY09X5Jf1R0Y4vtfXO7VvDD+RuA
         weAUeWAGJcs0uDNucigZk2s2b9tPnFvm0wATHoFs9JTNaEGY/imbvG1TV7hoXupTC49t
         R++A==
X-Forwarded-Encrypted: i=1; AJvYcCV6pUbznvKGcLfAJX+Q8NEshooirE6VM3CG7HwQK1FnOvV1m6UlYKJsYHox3N3IpXwn43EO5ISAh3PFIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yye599R0HDdZ/4+5V83smiGKHPwjwCoBKdrFbc4M3N1AwWkB64U
	i+uGJKal6GgV1JvxdB281jntQimidglcmDcG4FZlY7bWG75vUxFqszjaBnRGBxPYxS5tDAwwpah
	/ExCLTOwDrgl///OZr79UdoEPZizL//J0ej6f
X-Google-Smtp-Source: AGHT+IGhqfbnmkqeuTCD7bZKUdym4y9AL8tm7CgZ4nVvzkL1/icn0ir93wqM4ghcuzeFcJOcDO9xHxShdQCRi0L0i5k=
X-Received: by 2002:adf:f58e:0:b0:371:a844:d32c with SMTP id
 ffacd0b85a97d-3749b57c4f1mr2996255f8f.39.1724972048738; Thu, 29 Aug 2024
 15:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info>
 <ZsiLElTykamcYZ6J@casper.infradead.org> <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com>
 <CAKEwX=N-10A=C_Cp_m8yxfeTigvmZp1v7TrphcrHuRkHJ8837g@mail.gmail.com>
 <A512FD59-63DF-48D3-BCB3-83DF8505E7E0@gmail.com> <oophwj3aj2fnfi57ebzjuc536iltilmcpoucyms6nfk2alwvtr@pdj4cn4rvpdn>
 <3D1B8F1F-2C41-4CCD-A5D7-41CF412F99DE@gmail.com> <CAJD7tkbF2Cx4uRCJAN=EKDLkVC=CApiLAsYt4ZN9YcVUJZp_5g@mail.gmail.com>
 <EE83D424-A546-410D-B5ED-6E9631746ACF@gmail.com> <CAJD7tkZ01PPYMzcTyX_cwr836jGonJT=fwT3ovc4ixW44keRgg@mail.gmail.com>
 <ZtD2McWko3uobU-B@casper.infradead.org>
In-Reply-To: <ZtD2McWko3uobU-B@casper.infradead.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 29 Aug 2024 15:53:32 -0700
Message-ID: <CAJD7tkYJ9KNQkpPxWQpGj0SnofSq5-mLzDnChCqTtJPGrhzY-A@mail.gmail.com>
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
To: Matthew Wilcox <willy@infradead.org>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Pedro Falcato <pedro.falcato@gmail.com>, 
	Nhat Pham <nphamcs@gmail.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 3:29=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Thu, Aug 29, 2024 at 02:54:25PM -0700, Yosry Ahmed wrote:
> > Looking at the zswap commits between 6.8 and 6.9, ignoring cleanups
> > and seemingly irrelevant patches (e.g. swapoff fixups), I think the
> > some likely candidates could be the following, but this is not really
> > based on any scientific methodology:
> >
> > 44c7c734a5132 mm/zswap: split zswap rb-tree
> > c2e2ba770200b mm/zswap: only support zswap_exclusive_loads_enabled
> > a230c20e63efe mm/zswap: zswap entry doesn't need refcount anymore
> > 8409a385a6b41 mm/zswap: improve with alloc_workqueue() call
> > 0827a1fb143fa mm/zswap: invalidate zswap entry when swap entry free
> >
> > I also noticed that you are using z3fold as the zpool. Is the problem
> > reproducible with zsmalloc? I wouldn't be surprised if there's a
> > z3fold bug somewhere.
>
> You're assuming that it's a zswap/zsmalloc/... bug.  If it's a random
> scribble, as suggested by Takero Funaki:
>
> https://lore.kernel.org/linux-mm/CAPpoddere2g=3DkkMzrxuJ1KCG=3D0Hg1-1v=3D=
ppg4dON9wK=3DpKq2uQ@mail.gmail.com/
>
> then focusing on zswap will not be fruitful.

IIUC that was for the initial bug report. Piotr reported a different
problem for v6.9 in the same thread, a soft lockup. They look
unrelated to me. Also the patch that Takero found through bisection
landed in v6.10, so it cannot be the cause of the soft lockups.

Piotr never confirmed if reverting patch Takero found fixes the
initial problem on v6.10 though, that would be useful.
