Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6561BD00A
	for <regressions@lists.linux.dev>; Tue,  1 Oct 2024 21:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727817040; cv=none; b=ZYDCrhBHFi9d8TyoP1S/YoEk+HT1h+Bq/pJ/t+UltzjwIBy/QirFUmMncPoUrvY64gUjKRprZC54us/kMfbmzQEXiqfLkjeEhUsSDsnVJSPzV7Qc9SFnVCOr0WjD8ldTisYSiRY2ZFQxs7rHQLVVJHViUXeONMAPMx6cesgGBN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727817040; c=relaxed/simple;
	bh=BdLPaNlX/F3gzkLxlYzljybqQgCh1CZlleMAH3/NzJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyEv0zt22UyABkfHXCyzY5oIknqfdRsewP23oaPtCmDkDaxFjFpGilr12uUD9PsDUEhMSZkBjeFkux19QhiDj/zY+BidKsKJQcAWPlNNdp5IHsL7VSOp25087pQAJTd25/Nb+vwe4KMkkVCgW9bCqJ2SEYo8YpFDlzqUF++mwTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGjig4jv; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGjig4jv"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fac49b17ebso25041731fa.0
        for <regressions@lists.linux.dev>; Tue, 01 Oct 2024 14:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727817037; x=1728421837; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5FPHhbte4Tmc4ZuPG7hVMprQvRDLf4/a9y4DExRTII=;
        b=TGjig4jvkgQGUWP+kVmVAjsVxJFGVrbuDEIHPNshmx52Loi/VK8pOYbyF/9Rg0A7oA
         yFus8kOSjgJ23hL39A+zbVHWprrUw0LpYVlGQzGJdySX3CFXpHOhqbpL7JbI3jFmUk7q
         gXgKAjhmRD8AANy92r7KX6YAiidqunLfFWRBYwXZsrQRYVVmSEhq87cGZ0+YVS+pVy1Z
         xellMFidm3YpGFIQNsPBMHdeLU75qU3b5skGkHJxT5KHyWa+shxKg6oBrG0yQLh5DPrc
         a8KrqxDjWOBHAwVfYTYBde4OFbkAt1kMmFnqdzZMh1p8IdX4kK2RqlaOCp8DTvLWRZ4u
         sFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727817037; x=1728421837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5FPHhbte4Tmc4ZuPG7hVMprQvRDLf4/a9y4DExRTII=;
        b=CCby2eOYQdzOIc8AJbryK4kI1Ww7gq1JCLJ8INiOkvZJ3CT5mSknlhqQj6LMH1+q0+
         hFnL3i4bpBg/fGvu45ahffE0ZZLLaWxcCBSsDLNAMpw5sRjHY21xALWwfUF3lrPJ9hPx
         0RRBjV+xV7DVG0Y8hYKzVpiUuP4rOW8XPAXHpvXcPzGIQ2QgMUDERysb1V54CAmnYqyv
         Zu+FdHxYxNtiK5Q8AzoBozp1DeYKFXuhBy0AgQrX9NwsCQkIPeXJDUoH/DvQn1GnMvKs
         A8Bcu2fPl5dJY8B2AWKilcftPbta+dGp0MPdoGwYJuYxjmrrOJ8RZwK6X1cDgqtRaCRU
         ASvA==
X-Forwarded-Encrypted: i=1; AJvYcCUgl4ZSiJUpqX8Hja8nQn5hkZTIxwX3dydmTmgKcXYflhqxwvMNiZ0ees/80x0bDQwBKJA9/uKkDMSqtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX8fM7saL/I/9t/TjZQhw1RYiyXuIZCrPN7CF1CoF3DtV5U3i4
	QYAtTTllkRwq/A0f/Ljwk6YWzLzDwIxINklvFSCA2EEG0mIMe55zfq+kD4P9s4R60KuOdn8sVPp
	OGrKGyShG7W7o9LJPt0PqWZOVSjU=
X-Google-Smtp-Source: AGHT+IHyH38WiVX8HHUwc+OFQWovZwKbJEqW/O3u3XocYkPNvtQCAvFmTdZx0nP6F2Y0oSa7jC6KgiPT019755iLMPg=
X-Received: by 2002:a2e:be9e:0:b0:2f7:6e3a:7c1d with SMTP id
 38308e7fff4ca-2fae1044cf5mr8284241fa.15.1727817036745; Tue, 01 Oct 2024
 14:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0a3b09db-23e8-4a06-85f8-a0d7bbc3228b@meta.com>
 <87plotvuo1.fsf@gentoo.org> <CAMgjq7A3uRcr5VzPYo-hvM91fT+01tB-D3HPvk6_wcx3pq+m+Q@mail.gmail.com>
 <87y13dtaih.fsf@gentoo.org> <0bdce668-5711-4315-ab05-1a3492cb8bf6@kernel.dk>
In-Reply-To: <0bdce668-5711-4315-ab05-1a3492cb8bf6@kernel.dk>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 2 Oct 2024 05:10:20 +0800
Message-ID: <CAMgjq7DMWGyXDdf86tkZ=1N6CnFQza4xzRhZXcw1j1WQXWBn=g@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Jens Axboe <axboe@kernel.dk>
Cc: Sam James <sam@gentoo.org>, Greg KH <gregkh@linuxfoundation.org>, stable@kernel.org, 
	clm@meta.com, Matthew Wilcox <willy@infradead.org>, ct@flyingcircus.io, david@fromorbit.com, 
	dqminh@cloudflare.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-xfs@vger.kernel.org, 
	regressions@leemhuis.info, regressions@lists.linux.dev, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 10:58=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote=
:
>
> On 9/27/24 8:51 AM, Sam James wrote:
> > Kairui Song <ryncsn@gmail.com> writes:
> >
> >> On Wed, Sep 25, 2024 at 1:16?AM Sam James <sam@gentoo.org> wrote:
> >>>
> >>> Kairui, could you send them to the stable ML to be queued if Willy is
> >>> fine with it?
> >>>
> >>
> >> Hi Sam,
> >
> > Hi Kairui,
> >
> >>
> >> Thanks for adding me to the discussion.
> >>
> >> Yes I'd like to, just not sure if people are still testing and
> >> checking the commits.
> >>
> >> And I haven't sent seperate fix just for stable fix before, so can
> >> anyone teach me, should I send only two patches for a minimal change,
> >> or send a whole series (with some minor clean up patch as dependency)
> >> for minimal conflicts? Or the stable team can just pick these up?
> >
> > Please see https://www.kernel.org/doc/html/v6.11/process/stable-kernel-=
rules.html.
> >
> > If Option 2 can't work (because of conflicts), please follow Option 3
> > (https://www.kernel.org/doc/html/v6.11/process/stable-kernel-rules.html=
#option-3).
> >
> > Just explain the background and link to this thread in a cover letter
> > and mention it's your first time. Greg didn't bite me when I fumbled my
> > way around it :)y
> >
> > (greg, please correct me if I'm talking rubbish)
>
> It needs two cherry picks, one of them won't pick cleanly. So I suggest
> whoever submits this to stable does:
>
> 1) Cherry pick the two commits, fixup the simple issue with one of them.
>    I forget what it was since it's been a week and a half since I did
>    it, but it's trivial to fixup.
>
>    Don't forget to add the "commit XXX upstream" to the commit message.
>
> 2) Test that it compiles and boots and send an email to
>    stable@vger.kernel.org with the patches attached and CC the folks in
>    this thread, to help spot if there are mistakes.
>
> and that should be it. Worst case, we'll need a few different patches
> since this affects anything back to 5.19, and each currently maintained
> stable kernel version will need it.
>

Hi Sam, Jens,

Thanks very much, currently maintained upstream kernels are
6.10, 6.6, 6.1, 5.15, 5.10, 5.4, 4.19.

I think only 6.6 and 6.1 need backport, I've sent a fix for these two,
it's three checkpicks from the one 6.10 series so the conflict is
minimal. The stable series can be applied without conflict for both.
