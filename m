Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1022615
	for <regressions@lists.linux.dev>; Sun, 11 Aug 2024 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723390473; cv=none; b=B2Je7TN0Dj374QXwFPqjS9F6G/t5FpQ8DCMGj3IpLV/O66bXWbCk6h/SCRhUeug0XmjmY2yfMVueZ326b8h/UdCf7ER2zYpVTH6vb33S6Gmd33nYZ2Uty9XIPb7ny2XItWiTIvTqI84++BOkG9iCJcZ8u2RFzRezXud2COZxHTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723390473; c=relaxed/simple;
	bh=YwksnDw8VPXal3P7dd2jgZKdFH8IbM7kCgoHRSJTUYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgPShqX5j8Hpy8KCi4fBpDrM0EfDJX2Tw7QzlOp/YI2AAWNHR/aoRURQOq3WhyAe/0ipZk8f3eCYg70jKxg8GdnQVNhGXDs/sOJFEDTQEncXP9Z9gsgkPxZ3QA85tlqoyF3/TGf71Afuo472KUrRVq2rayOq+GmuXH4a1yRNWHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uP0h/ov2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uP0h/ov2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45177C4AF0D
	for <regressions@lists.linux.dev>; Sun, 11 Aug 2024 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723390473;
	bh=YwksnDw8VPXal3P7dd2jgZKdFH8IbM7kCgoHRSJTUYY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uP0h/ov2VCuj/kvYMNcD36MxjugPyiSj+MHglw0bQ0tA5F8/GSpNRpJJAgiHY86pU
	 8QxTnuajNui3/AMs27Lv2hMZPz6N+VlvuOERM8EOenyAStEpB12ZFcfIw0zmQCXBVF
	 k6GOpVD1uw/MsGuWF8o1ROayt3thJLY13Q3pjmkzkDqho+pwt/PfKX+JYyNdUX+66m
	 CZJOYiDGGq3Uiu7YjD+PepjdsWE13UGnxgma1FHfgoZtXbYO4C139Lkf2wN0qDfKi8
	 lqEIFp7zVqSFItxiX4T2nwOXDrRq5REMkulNTZd9W3cbIfiCQq+T8enrER5t7qCtVl
	 dD7+as510aapQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f01993090so4771388e87.2
        for <regressions@lists.linux.dev>; Sun, 11 Aug 2024 08:34:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3sT5qDxhRmmzo44FTOI0hH4pnvtu2Ed7V7/9QfGJ8APXbTtQTv+Tt4UlBF9BH2Ivar3cZYsWOK5SXFMVq6qntSJ/gM5NsfM0RUxw=
X-Gm-Message-State: AOJu0YwVdInAFKdIznPC4G8FeodETTGvxLDz8BAXnuQfvJJ2S937Az9r
	NIFAHWOe/OZMzb1Yy9/Z8U5kZu0S2iy1J588+NQ/sgEA9n9xG53wzZmCOzw8t8tWayYxgZF9qTa
	vv4NiOEZKF6ifiP8BWQJp9hWiBvg=
X-Google-Smtp-Source: AGHT+IES5W/xGCH2uWWHRv0dGCi0+rtFXcqtmn0Bv5Fx/hX0jdnU/L373uRehGhIcqIZ7MBs+7C0ZG9WFLxHO80NtD0=
X-Received: by 2002:a05:6512:690:b0:52e:933c:5a18 with SMTP id
 2adb3069b0e04-530eea5da02mr4470050e87.56.1723390471606; Sun, 11 Aug 2024
 08:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL3q7H5zfQNS1qy=jAAZa-7w088Q1K-R7+asj-f++6=N8skWzg@mail.gmail.com>
 <277314c9-c4aa-4966-9fbe-c5c42feed7ef@gmail.com>
In-Reply-To: <277314c9-c4aa-4966-9fbe-c5c42feed7ef@gmail.com>
From: Filipe Manana <fdmanana@kernel.org>
Date: Sun, 11 Aug 2024 16:33:54 +0100
X-Gmail-Original-Message-ID: <CAL3q7H4iYRsjG9BvRYh_aB6UN-QFuTCqJdiq6hV_Xh7+U7qJ5A@mail.gmail.com>
Message-ID: <CAL3q7H4iYRsjG9BvRYh_aB6UN-QFuTCqJdiq6hV_Xh7+U7qJ5A@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>
Cc: andrea.gelmini@gmail.com, dsterba@suse.com, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mikhail.v.gavrilov@gmail.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 9:08=E2=80=AFAM Jannik Gl=C3=BCckert
<jannik.glueckert@gmail.com> wrote:
>
> Hello,
>
> I am still encountering this issue on 6.10.3. As far as I can see this
> is the last post in the thread, if the discussion continued elsewhere
> please let me know.
>
> My workload is a backup via restic, the system is idle otherwise.
> This is on a Zen4 CPU with a very fast PCIe Gen4 nvme, so perhaps it was
> fixed for others because they had comparatively slow IO or a smaller
> workload?
>
> I have attached the bpftrace run and a graph of the memory PSI. kswapd0
> is at 100% during the critical sections. dmesg is empty.
> Important events were e.g. 09:31-09:32 and 09:33-09:34 where the system
> was completely unresponsive multiple times, for about 5 seconds at a time=
.
>
> I did also mention this on the #btrfs IRC channel and there are other
> users still encountering this on 6.10

This came to my attention a couple days ago in a bugzilla report here:

https://bugzilla.kernel.org/show_bug.cgi?id=3D219121

There's also 2 other recent threads in the mailing about it.

There's a fix there in the bugzilla, and I've just sent it to the mailing l=
ist.
In case you want to try it:

https://lore.kernel.org/linux-btrfs/d85d72b968a1f7b8538c581eeb8f5baa973dfc9=
5.1723377230.git.fdmanana@suse.com/

Thanks.



>
> Best
> Jannik
