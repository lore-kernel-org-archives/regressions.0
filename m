Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780922F3C0F
	for <regressions@lists.linux.dev>; Tue,  2 Sep 2025 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756810705; cv=none; b=uqvsGnaumBXNfZ/+ohTuzob8HCgRFjTR5XMBxY2HIFhajJKEbJVzbBlqqQjqzc/C9pDwBAxal3vUrKFNMTEA0+ZpDwnrI5fLdwVRkz+DK45q6Ju3bxQxETW7p2dA4VKvrvzAF/mHyHGZ5sXqu9/23R7txZ/+E4MCPD6OMgOFUtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756810705; c=relaxed/simple;
	bh=gfMxdtz4DcDDUc86U5Qw8d4o1LVk/9GYcubnw19a7Vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RU3+VYnLQWDWanMpmXWYnCxa0UQHfts/On1ufmWvnmdsfmyI0E077k1Vs8dBYpt2Yy77gItUpinfLHpDpl4t7FFbjX5qEE1NP9Fmz9QxBS6/pEY/0J3tA7vNI/m+jk0N9Zs0LyL+Alt2p3wQtuXBXBi3y+BVblACxVzH1zU3reE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y612vBuP; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y612vBuP"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-324e6daaa39so5007738a91.0
        for <regressions@lists.linux.dev>; Tue, 02 Sep 2025 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756810704; x=1757415504; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfMxdtz4DcDDUc86U5Qw8d4o1LVk/9GYcubnw19a7Vo=;
        b=y612vBuPCHfapVX90XzFMYsR7HejzrNwavu/a/Bq6akDLZ1BAnAW/rdFXl4pfspl6K
         aty+YfCZjPwuyfhNaWnI/g9/JfL10CxbcELP6xT4xvBwTtJpCmse+lHweG2TAXj2pqw3
         fRP5t9aSGoX+nKyV57fzonbbLmSFzmx7LZtyyPdavjS9VYi53EY0oKTFa2nsndbX/DO6
         HVtaSjoFwLGKl5DP9Wab/vvGy6ffWuelfAKIw0XqmwSoTJUZDFw0fQ6H7CXDzM/VUgvY
         80eS4jXUu169D2D1WooQZNQec0NB3kPag7pBFCGvyRJfXR+rC8A/rX0QcemCeutEXX+W
         aRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756810704; x=1757415504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfMxdtz4DcDDUc86U5Qw8d4o1LVk/9GYcubnw19a7Vo=;
        b=AKvaKL7Ls8Hn0qAV3eebuR5Xtq3gSRQKU1tOn4WinvSlM+n/eNI/Cg/8uvpIL4Wnav
         XG+Ma3UEsOlAEsh9+DT1K409ilJsIXbShCvYU+15ZoRKZd0VgOWDlHa6URlCWlnY5KlL
         VUZWT1CbhBwNHB4YhdUzuyffUodEu+I30+NobwTgNh2+poL+Sp+1hc0E2M505yvp4mPO
         2I8ADnkw4utkFrt5OBp8gwge4Zmf/khX5l6cAv8kZ99Ezwi34sH3jJpdapy6YDYuBJyI
         ZGGvb/xt77kHgauwJsGytF5AfPt9tEmtfkVVdG0HWoxHA7snznJ/S8W5U9OWsalr4wNj
         hWvw==
X-Forwarded-Encrypted: i=1; AJvYcCXlARMYrUAin018yS4NNoay0tIym5qwm7LNBdTQg5meqO1gIxIoJ1hfGoPqIYrFKsgXIzSC52woC495Hw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxvKGaw0+TRD2i5IKfddPyMIrHdUddOJ+aekGn5qBKL0hDvyvl
	Ni7ETc34157UtilZbwUWUqv4X2Zi6g+t8D40IGZ6covFPurMZJdKwCN9S9x3n467WpTFd4g4oCw
	oGGNHGX2DqOi/4UJUUX7JWpnBgqFZT1Vg5Sp1AqzNNA==
X-Gm-Gg: ASbGncsnwT368UTUSDbmro6pilZZl5SaW8GWyAXVEO4yxl4T9oY9N2rHorKF5ORPn2j
	TkXDa+UAWyjG4TUuXY4LJzUB7Q8S+h3EXibRdU94/Q0emz0Qeq9MEQxbowYuBYM1H71hQAL/w9O
	VByYvrGOxhTQnekwn6dcv6EjI9RjkBq/75Hfl4IKSWkO66HvnUhKAZ7L0MVRgKCHG3q2V1KjdO+
	AasbqegNkPz9xAoXYbY7E1LJirky55kheJAlREJMqQfIsqDrGm8bxiQY8108A==
X-Google-Smtp-Source: AGHT+IGJeRstlFmXn141hA2zh0v1vPIYwwf6A3NPxDQM214Prr0kW78Uc+Oyrqot7bU7+e2O3OZyDHf9cjoIhRs+pqU=
X-Received: by 2002:a17:90b:3c8a:b0:31e:ec58:62e2 with SMTP id
 98e67ed59e1d1-328156c9641mr16594645a91.19.1756810703718; Tue, 02 Sep 2025
 03:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtktEOzRWohqWpsGegS2PAcYh7qrzAr=jWCxfUMEvVKfQ@mail.gmail.com>
 <hyqcffknmjwjuogoe4ynubs3adk47t2iw4urnpjscdgjjivqz7@b5ue6csrs2qt>
In-Reply-To: <hyqcffknmjwjuogoe4ynubs3adk47t2iw4urnpjscdgjjivqz7@b5ue6csrs2qt>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 2 Sep 2025 16:28:12 +0530
X-Gm-Features: Ac12FXyK-roq9UdfvDh1RySejuG-CgVtu9pGL08wENDIna7l8Tu1FBMlsn9aQjg
Message-ID: <CA+G9fYvA=945et87Q=_c6b-TWjSBxy4H-X9iNsb1_Pj9GCXUaw@mail.gmail.com>
Subject: Re: next-20250805: ampere: WARNING: kernel/cgroup/cpuset.c:1352 at remote_partition_disable
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Cgroups <cgroups@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, kamalesh.babulal@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Aug 2025 at 19:56, Michal Koutn=C3=BD <mkoutny@suse.com> wrote:
>
> Hi.
>
> On Thu, Aug 07, 2025 at 01:57:34PM +0530, Naresh Kamboju <naresh.kamboju@=
linaro.org> wrote:
> > Regressions noticed intermittently on AmpereOne while running selftest
> > cgroup testing
> > with Linux next-20250805 and earlier seen on next-20250722 tag also.
> >
> > Regression Analysis:
> > - New regression? Yes
> > - Reproducibility? Intermittent
> >
> > First seen on the next-20250722 and after next-20250805.
>
> Naresh, can you determine also the last good revision? That would be
> ideal to have some endpoints for bisection. (To look for any interacting
> changes that Waiman was getting at.)

Michal,
Since this was an intermittent issue, I do not have a good end point
of the bisection.

As I repeat,
First seen on the next-20250722 and after next-20250805
and not seen after this.

Reference:
- https://regressions.linaro.org/lkft/linux-next-master-ampere/next-2025080=
5/log-parser-test/exception-warning-kernelcgroupcpuset-at-remote_partition_=
disable/history/?page=3D1

- Naresh

>
> Thanks,
> Michal
