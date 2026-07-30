Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F8421EF8
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419728; cv=none; b=pujLZT69pRptP2bxqlo9Zt4W+qY/ElSpk8oYcn0Oe+INCbDQdOIh5LHdIyWBMRV/6cNXD8yfmgThjPvhy2tB6c6SJ7DZCzhA+Nnpxf54t5Mr1xr7l5rnCvWz/HDxiDXVWHxUcWFoZTQO23YuYMqlznsvrMuDGeFsmTUTR7NZwA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419728; c=relaxed/simple;
	bh=sKE2xC6X+2IdWYTl4zutx8wFqjnVGYhszftxHKoGsyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UU/NTFp6DDmtyfRin/tRLJV72s8BSy+D9G9+0YvpBeWk0NReFwbKcjy8Qo7Kjq0PVkNcKHKXzStGHliXwYPSq0dy6qfysO/lUteFTF5VARFr5LF8zVjEGgJlS6w+vT2McfibOZZaz479RK2I7RCZ047kw12j3UWKQKJgvuHPx/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcMaWMSv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcMaWMSv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1681F00A3E
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785419727;
	bh=YWCbGRN60aLduWSj1P0c1mwKjRkg5va/RqN0EEDtBiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EcMaWMSvpvXflh1UWsET849B9X8RIOgqkUxP5QJ59JsAMzXWeJqyFi+XG3cW1/o3u
	 qRC1YtWSRz4mqUOV2+x1fPE/xIs9ynQFRS+6Jfi6dJa0dbMrnnmwDM3yX0hKHuBQa6
	 1vn+RQWTB4cENKShzJv/VMkhfLrbU9VvRZ/HbqB2zMJ4U6n1iokzorghgLQ+Gq4akG
	 63osD3uVaC/l4DoytIbGer72ThsA1SKLq0NJE9LD/gDP/I27v0tTO05N1hZouihhBI
	 zUtTXYvunRF5U/rsuKPse/aZOijsdC7Ib+ZjtYARFE3+rO1CRpV+nCSsMz0//Qr1w6
	 fSScFyaKEK7Pg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so2363203e87.3
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 06:55:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpZ9deFosAZc0ds/rRrHXJjhpgwlrUy6VmHFaI2nAYaz4Knqenp61XkyqpvzCnQZr19qItToDaS+W+5dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4JCLH/L7krP5kZnj4A0qtNxFUKdcQLtb0dagGp75f+ql969yr
	yzrtafk5uAZrD/kxuoMNmDKrlufOg3y1fGXAM4yHpVBl6L4NYY5L7YzovmHtpetLHEZn3tD2ooV
	rozpsr7xd+Flc1k0ocjfYwlaJ4l5JjSU=
X-Received: by 2002:a05:6512:39ce:b0:5b2:a951:d959 with SMTP id
 2adb3069b0e04-5b2db378408mr732761e87.42.1785419726227; Thu, 30 Jul 2026
 06:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
In-Reply-To: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 30 Jul 2026 15:55:14 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
X-Gm-Features: AUfX_my-eWqY0dDbynyNa1iUY9tCXfwBCUG1XQRADfSP_Nxlv55HPv_Xg2X8VDY
Message-ID: <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: Julian Silver <mendaxca@gmail.com>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 3:25=E2=80=AFPM Julian Silver <mendaxca@gmail.com> =
wrote:
>
> #regzbot introduced: c0f691388992c708436ab5f6e810865be6ddf5c6
>
> Hello,
>
> After commit c0f69138, all usb ports on the rear panel stop working. The =
kernel logs show: "probe with driver ehci-pci failed with error -110". Spec=
ifying "intel_idle.max_cstate=3D0" can work around this issue.
>
> Please let me know if you need any additional info or trying patches.

So you get a timeout during ehci-pci probe if the intel_idle driver
initializes before it.  Apparently, CPU idle states get in the way of
HW probing.

Does adding "intel_idle.max_cstate=3D1" to the kernel command line also
help, by any chance?
