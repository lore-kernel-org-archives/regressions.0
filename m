Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513B42B73B
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558216; cv=none; b=IfmqTAm5vxcSrx7sVFNl2gDxEpZhaaBEnM/6zxVySatIGtQ+3ydyL7h7cB2KhX/3bAw+SF+zo2fUn1QONx5vkNb95a7W0Ad/4xu0Fi7sqkMqeDpi+4IiWz5t8cRUBfKWDJ6dN7R+hUS4x+zJDLqtaINDzBqrHbsNYMsAPn2EHP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558216; c=relaxed/simple;
	bh=V4IDpFJ5gqQ1M+3EFfgwBerw1hMifypy7zniS8S/avw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxiZ0NZ0HI1ChjdwUkZ97sN0Wv6sdjOc9oRDyjtpgXhNirILaVKcs81a2XdXb75S42SbW9GduVFcWpauBZWPLGbsO/bKx0eVqyXRDiHUEj5YbVYn6CK7c9zt67mJeWKxTw+OYdn0FmfhZU69RZOQbukhIPfKhyWIII+Ib/5GBJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcxlyaF4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcxlyaF4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E328C2BCF7
	for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777558215;
	bh=V4IDpFJ5gqQ1M+3EFfgwBerw1hMifypy7zniS8S/avw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dcxlyaF4ZOBjGAPNLxMBOMSsJbWq00ULwKK1AFFGcKjm1d4nEP32zBnn68E4+mzfG
	 QLDdLDdbdkp1eE9wEGAB+MN4u1mSJxdNL87f8/o/C7uU3XpgQusyABxgZvb1f8+g1t
	 kEJdIyWWIO3OJxNyfhufUJr7qwGMyYOznKY02rpbsJqlV0ntNQGDaFIOQSYUXhmB4E
	 61J0SvD7aOvn8QITeWE014B9TsSLfkQP/cKhC+buOfCvyTsv+m9/jyUG/ARi4yTy/Q
	 M0AGulYtKWAPmjCIaTcNfdf/sinK7UJ+JcFo7M+FuVTkz5uBjKuOnN6pWV8QrhXAoi
	 sLp5FpAzSDTUg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so1057431e87.2
        for <regressions@lists.linux.dev>; Thu, 30 Apr 2026 07:10:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9y3l/C+hHkgoXASeNNMuP4X6snSzMG1u2KmFnSupZ/JD/tuquRLJCZYy88xhIwiNR9pGDOQmLZJvAutw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKGskripfcg3EyX05S9RHiOXeJ/2odtIVL8mWBVgZZw4Hxzc86
	gk/4ssd5kq+Z2BaS0OevVPLwhl24U+8Haf74NXAhko1fQXqg4r8y6/CJ6Y3J/MGOe8x5UVvdN67
	v1MuySEp0B38AqlWNJL79fSnBXUDwgok=
X-Received: by 2002:a05:6512:1195:b0:5a4:1588:341b with SMTP id
 2adb3069b0e04-5a8522aed24mr1117886e87.8.1777558213800; Thu, 30 Apr 2026
 07:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <CAGAxtY2SEkx7OgMgM5ypA8qsBN0h6pcs111VjnhD-5ZGq7Je6Q@mail.gmail.com>
 <CAJZ5v0ikAeu7cW9K6sfKYbbsVK51GOsFrX-qv3KJ7cVr-gRHew@mail.gmail.com>
 <6010375.DvuYhMxLoT@rafael.j.wysocki> <CAGAxtY2N-=3taOBCTFZzEmm4NqJ-KhtsWq0fNts_tn3nAxpkTA@mail.gmail.com>
 <CAJZ5v0j2MKGRFRRVT4rFuzr2OwJg7ufAfDKUS0rgAsg-EBH6Kg@mail.gmail.com>
 <CAJZ5v0jhjXap6gSZ5unR7cE+CQQPk1tDnAXLm9rkGsC2AnZTew@mail.gmail.com>
 <CAGAxtY3h4sEphqKL-jiSn4p0NT9mdZtOFrVxW7CDo22XdL56iw@mail.gmail.com> <CAGAxtY39Te1zwK11KmuELHGV3MJMRYfTju+oXuzKeEZqVGKQzg@mail.gmail.com>
In-Reply-To: <CAGAxtY39Te1zwK11KmuELHGV3MJMRYfTju+oXuzKeEZqVGKQzg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Apr 2026 16:10:01 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jF1YNyo4uYTK+JPK2QFhC-k=dazgoq4XCAYVri9Km99A@mail.gmail.com>
X-Gm-Features: AVHnY4IwUufIss73-ZB4BQ5w3tCIAiQgEkpNSxaw-E5rtlqFNd_O4iJgq4c7qFE
Message-ID: <CAJZ5v0jF1YNyo4uYTK+JPK2QFhC-k=dazgoq4XCAYVri9Km99A@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
 (schedutil involved)
To: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linux PM <linux-pm@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 1:58=E2=80=AFPM Evgeny Sagatov <evgeny.sagatov@gmai=
l.com> wrote:
>
> I forgot to say that in ondemand mode, when I pressed the power
> button, the PC did not freeze.

OK

I think that's because ondemand changes the CPU frequency 10 times
less frequently than schedutil.

Writing a sufficiently large number to

/sys/devices/system/cpu/cpufreq/schedutil/rate_limit_us

when schedutil is the cpufreq governor may help, but I actually don't
know how large that number would need to be.
