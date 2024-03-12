Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7303811
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710248736; cv=none; b=K6kE7I86aXn8eMjNoJbMWPHUSTLmGrH4No+I39WVq35UqCasaF4ZPbqAQBL8+zsDh4OrT4eoavoXEK5+edD4uONZZTtIMVwsPmiC6mBY8M26oPzTu7ll3+ALt7JXTVH+KnkZKPS4n5IvfIkxhdFHiJIpB+XFWD4igc3T1E1dP5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710248736; c=relaxed/simple;
	bh=LtUpf8o4cRDws08hBEsHiAvXVpFfY7ndPUFj4Qdryug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VODm7zzvp4wQcqqg1jEe6hnvAmJZhapaJeC52RjmLl7Sji9Msxumfz0MedfQ/jsN/k5Q9wkTrldfKTdGO+jwKcGk2we1rYbGu/Xv9AEVMewf9YzUzXu+ioKwoQoEK0vqanqthCEHrWRBzv8Ll4jHA7RoBrfqmGK/9xkPuY2Fq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khvoinitsky.org; spf=pass smtp.mailfrom=khvoinitsky.org; dkim=pass (1024-bit key) header.d=khvoinitsky.org header.i=@khvoinitsky.org header.b=V8At0smJ; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khvoinitsky.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khvoinitsky.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khvoinitsky.org header.i=@khvoinitsky.org header.b="V8At0smJ"
X-Gm-Message-State: AOJu0YxPVcbvuDBBYKqjurlf1+4UOczcoKvU30sc+9KizN94cOmfWsMf
	uQ//iFeW4vfm2gjLoLam6655gqh3sTXAL/62kkOVZOnTeA8iuVJT3aZ3HJ0YsqhNfinLsn6fGka
	+6ctvhw22BddxBxilo0Z6z04kMpw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=khvoinitsky.org;
	s=key1; t=1710248731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtUpf8o4cRDws08hBEsHiAvXVpFfY7ndPUFj4Qdryug=;
	b=V8At0smJG2pyIIg1cJAl/sd2t33YxgAtVA/swgU63NwkxYnQV+qK3FE7/t9NRCfINadqV5
	MNGQZSWNxcab/Twb4GcglkOcl3wNfDPAHTaa/J3wTwkYz5+a5kfs9MYX73M++QAenFqAUx
	j5DE9p9r9AYaThQ2rzgbG/WbQF8JpUU=
X-Google-Smtp-Source: AGHT+IGnOFxOFezHjAmJUlxEr9UulxKpV48algWbNSGjNho00p9nrQZda/a1daNl4tfE0qC6Ts7OMKpXCGv54vGRZkM=
X-Received: by 2002:a05:6512:3af:b0:513:ace2:ed64 with SMTP id
 v15-20020a05651203af00b00513ace2ed64mr2564951lfp.6.1710248729831; Tue, 12 Mar
 2024 06:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info> <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com> <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
 <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com> <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
 <3bb95fcd-65cf-45dd-8d81-1a41b1ae0288@leemhuis.info> <CAMMabwNo_yT4S3LaMV16Rmj6MiWL=TRYtB9wspfs_LWVgM=U8Q@mail.gmail.com>
 <b30dc4a1-57aa-4ff5-ae52-7a01203b8be9@gmail.com> <CAMMabwNVwapthrDkCLOQsWkObzvTKVzDMiod3KPVa1hoy0CzRA@mail.gmail.com>
 <0d2b0c46-4d84-4279-8964-589d77435e6a@gmail.com> <9a55659c-86a6-4d9a-ab4f-94fbfb72e7c4@gmail.com>
In-Reply-To: <9a55659c-86a6-4d9a-ab4f-94fbfb72e7c4@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Mikhail Khvoinitsky <me@khvoinitsky.org>
Date: Tue, 12 Mar 2024 15:05:18 +0200
X-Gmail-Original-Message-ID: <CAMMabwMDvumbNOvFk3mdqXfprO_xy4gB5R0KangvzJatv8BhUw@mail.gmail.com>
Message-ID: <CAMMabwMDvumbNOvFk3mdqXfprO_xy4gB5R0KangvzJatv8BhUw@mail.gmail.com>
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
To: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Jiri Kosina <jikos@jikos.cz>, 
	Linux Input Mailing List <linux-input@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Linux Stable Mailing List <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

> Not a single spurious middle-click, which is not surprising since, if I
> understand correctly, this last patch just disables 46a0a2c and makes it
> optional, allowing to enable it on demand with a setting in sysfs.

That's correct.

> And I have vertical and horizontal scrolling with the middle button
> working reliably

If you mean my statement in the initial commit that the original
firmware doesn't support horizontal scrolling, I might be wrong, looks
like I've mixed it up with something. But the main reason for the
change was hi-res scrolling.

> (I'm not sure of what you mean by "hi-res scrolling",
> is it about 4K displays ?).

No, it's about scrolling not by a fixed amount of lines but by
individual pixels depending on how strongly you press the trackpoint.
More like modern touchpads work.

> So as far as I'm concerned, this patch should be included ASAP in the
> next kernels releases (both latest and stable).

Yes, as soon as it gets into master (given that 6.8 has just been
released it will be soon), I'll make sure it will be included in
stable (either automatically or manually).



On Tue, 12 Mar 2024 at 13:57, Rapha=C3=ABl Halimi <raphael.halimi@gmail.com=
> wrote:
>
> Le 04/03/2024 =C3=A0 17:09, Rapha=C3=ABl Halimi a =C3=A9crit :
> > Thanks, it's done. I'll test and report.
>
> Nearly a week testing this patch (with kernels 6.6.15, 6.7.7 and 6.7.9,
> following Debian unstable updates) and it's working well so far.
>
> Not a single spurious middle-click, which is not surprising since, if I
> understand correctly, this last patch just disables 46a0a2c and makes it
> optional, allowing to enable it on demand with a setting in sysfs.
>
> And I have vertical and horizontal scrolling with the middle button
> working reliably (I'm not sure of what you mean by "hi-res scrolling",
> is it about 4K displays ?).
>
> So as far as I'm concerned, this patch should be included ASAP in the
> next kernels releases (both latest and stable).
>
> Regards,
>
> --
> Rapha=C3=ABl Halimi
