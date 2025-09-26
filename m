Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332B27F003
	for <regressions@lists.linux.dev>; Fri, 26 Sep 2025 20:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758917289; cv=none; b=sPMpmvEc5/zwRrA0BDb6T0GQ7hSctoOyTJpazcBPG6s8jg5L5FguUANpZPy11eW7994ZvcNcuZSYuBKHFTpp+/5US4PoR7QAZVYtGZK0uPxyFtI0MOQ217iAqjshlLpEZWivIg8DguSMBTN+gK9CVesbbiA49mlt9twTwkijHws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758917289; c=relaxed/simple;
	bh=K9CI2XREIIFjhmSjVkb/YP87oVQqlW9glL6hrNBmQgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LsJ6GzfxS0lJSGn2Yir6V4qpVzSOMLkq9kM39/Y11lZBHnCm0ef/EH8GUGWJ8U05Idfm3I/lbnNlugh4LF5QYlvHL/AtFR/nM55JG9i4CmA5B7UcKHvmcDemv7SGGXNKIiS2EFgghBCw2Eo9VkjjPVDBxveakSq2J5Jq1HA65UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BUIgBj6g; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BUIgBj6g"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57dda094f6cso1781e87.0
        for <regressions@lists.linux.dev>; Fri, 26 Sep 2025 13:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758917285; x=1759522085; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9CI2XREIIFjhmSjVkb/YP87oVQqlW9glL6hrNBmQgU=;
        b=BUIgBj6gYwK5Zzt+hSVyc0LrChipPDhIYoha5LN1qB1ImRxChyzbIhNaylObaCDphs
         6tCkXQaxWnzX5/+QYSWtHijq8RDBit3Zo+E2fcs/2oGVKPgZRV1w5fVhMofWaJ4BGsnK
         uIDD2eCVaGUL9UxfhKlHA72Di2/eoxoFoaP5JMFo65VibbT8qZIHP+x+2R7S6twy/2EC
         Y/FrxhivyDoaLIBpW+/wfvsfNx5ACXgozhrl7lMWJoWNfXAyQrU+E4RTYppnW4BGOBpu
         wtTY1eUYjOMwety5S8H0qcJrlf7E9VKvtY4VhUYc9Vp+YwYpR/0mAtZNwKJQSmA4utrF
         VXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758917285; x=1759522085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9CI2XREIIFjhmSjVkb/YP87oVQqlW9glL6hrNBmQgU=;
        b=RQCzAP3Jf+Vpf+UAUVF2ZXu+hjo6iqDOT1zKixZGiWjX4JcUjhWN8hmV9Qiphzg7JP
         eJJCfJ4wHqNwPy7cqv5XBhczYlC7kF2Tua00gEhya2Sn3/vsiS3EoG7S6ql43zgc47Us
         51qMS7PWhgxwMPyKMrs4Jhko+tP4Ie3XGPpwA6UqgLRa2bHJggQVjfVUAedVgST4ARgP
         mcDX8+18Rxk1ZP0n7vhbaIEsmy1+W92Tb+rvWxRUTvrV6eD6S3C+b7KpO/rLnqXy+2zr
         Tnz6NfL5ixUgX2JxAcb1aVfaYYE3dRP89xZHgP4UYFY517MAq4vd/bT1XY9ZOJVzvbD+
         lL9A==
X-Forwarded-Encrypted: i=1; AJvYcCWsapx2Nv5VqusFXqSs3AnHwuHvs8idVcssAT4tcQoiZ+LvbY48n0TvJDCeLzr9F03yCUITsjms85fPvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwllLonrQ6MQ0O5KXZFF68rhilsrBbNLkBYODOZ9Ociv85u5M0X
	1bB3KVKbMAXK/Lj7AEFIDzi84shbgvmUnQ5KAR7WuxHvGyOKa4sOd8XWzWKRXHgYjQqkt9TxCcV
	u2gSqAGfWl8xTho6bpcxm9EkAhUpuOh07kd6ociWG
X-Gm-Gg: ASbGncvGNZFZG0W8d5I2iTtKRPlzPp2TYSWsKAvrVm57rjNlmUraMKbbo1ooJNAzLZJ
	XiZf4AxDZ9kMyO9epKZ8WmsjipgkUMi5iUNHoW35C1RLZFTsyZi22SMdkXHq9icM4D3/tnez69p
	Oal8LLGU0Ck0YICIu5ZkUMJt11rJyIlvFf1CifoRAAv+DsP/JBU+UiugojT5RnHpRC5nggA4CHr
	UegBIsVkODVnnwQswHJIrjkicv/6FLHPR4=
X-Google-Smtp-Source: AGHT+IHh/8s5lDW6PrIkGVFJaJJdDZIo4CtrqP31BIJcj1gV4FXK0xxTL1eISgB5E3n7tXhFhgbr2pjeJVV/JUTIXYs=
X-Received: by 2002:ac2:48b0:0:b0:579:bc95:cd25 with SMTP id
 2adb3069b0e04-5856d00983cmr99849e87.5.1758917285153; Fri, 26 Sep 2025
 13:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOdxtTYQye1Rtp-sG48Re+_ihD637NDXTG_V_uLkerg=m1Nbtw@mail.gmail.com>
 <CAOdxtTYKrMhjW9JiOCDBia+s=2tob1HF6yfAytYnajYsSoX5Kg@mail.gmail.com> <aNbwuc_Efg-Bj2Yu@slm.duckdns.org>
In-Reply-To: <aNbwuc_Efg-Bj2Yu@slm.duckdns.org>
From: Chenglong Tang <chenglongtang@google.com>
Date: Fri, 26 Sep 2025 13:07:53 -0700
X-Gm-Features: AS18NWCZIXmLqkVpjrQEp5xtsSwnAPUB3hSpbrnmkPOnsnT8YMG5tAtXTkLnx1M
Message-ID: <CAOdxtTYadTmVt7N6SLkQG63Nxxc-a5M=df=4f0qEXwm1LcrNAg@mail.gmail.com>
Subject: Re: [REGRESSION] workqueue/writeback: Severe CPU hang due to kworker
 proliferation during I/O flush and cgroup cleanup
To: Tejun Heo <tj@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, lakitu-dev@google.com, 
	Jan Kara <jack@suse.cz>, Shedrack Okpara <sokpara@google.com>, "Calvin D'Mello" <cdmello@google.com>, 
	Jeff Schnurr <jeffschnurr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

cc'ing GKE folks

On Fri, Sep 26, 2025 at 12:59=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> cc'ing Jan.
>
> On Fri, Sep 26, 2025 at 12:54:29PM -0700, Chenglong Tang wrote:
> > Just did more testing here. Confirmed that the system hang's still
> > there but less frequently(6/40) with the patches
> > http://lkml.kernel.org/r/20250912103522.2935-1-jack@suse.cz appied to
> > v6.17-rc7. In the bad instances, the kworker count climbed to over
> > 600+ and caused the hang over 80+ seconds.
> >
> > So I think the patches didn't fully solve the issue.
>
> I wonder how the number of workers still exploded to 600+. Are there that
> many cgroups being shut down? Does clamping down @max_active resolve the
> problem? There's no reason to have really high concurrency for this.
>
> Thanks.
>
> --
> tejun
