Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B06383C99
	for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776671962; cv=pass; b=cw3p8S7MSablk8crcFnjArIcLqBxCF5xfP32lF1DvLRZ35O21RfU60fhpIzgCn1pR57j3nVXwW8OWP/oRo+5jR0vOa4ykGwBiXrvR0a4mcAvABeCbMWIfWL4K69ADK8yhCg+0SIvB1RJfOXgtYjW6JiMTkLhaSFZD8NwBAxvvRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776671962; c=relaxed/simple;
	bh=skJ5R+wFeOukZf+cjPX17CzqfeE4aSfaDg5kcm2isn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rS3MM4lj7EIoh5EAZGIWUcXeABjCEAS2taQhEZbu8r07qINkD+C9WWLg0klbF8ZN/fMRjt7/TbgXVG70sX+z8iISyO2lZ6LOMQbOKLj1h8zmp9GsyVF5E9Fxf7hj0TiQo+bI6xmeQRddw3G4ptRIJa0kf8ndvnX0F65zU1nY1wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cM9QOLJP; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cM9QOLJP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ba699316b42so158086166b.3
        for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 00:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776671959; cv=none;
        d=google.com; s=arc-20240605;
        b=DhNI8C2J8jHNfxCH7AlN0hTIReMhUuf7znNJJyl+Bq5jr2F6Ru7DRFzQdX0Zp6xsyR
         NnK5roaZqI4mid13FMfyfxQG9Lqxy/l8QrFVFAGuLY4wt/zpeTTjeFZyAj1QL8LiAUZR
         WCBAXFsFAhmx5plknJXNV52ZUe7Uaj9ktyLgV6aPtzr4DhSorDqel6G7BLdI+Cawl9Wl
         vzDrGHv5VujzMyNUPWJUf2OloX+R0X6AOJWLRGn7JzPEHntkFFcekWkXEi3c9+iaNtIs
         lGpiPeH3dkO6+yeiOzCuixQc83KcjFxcmbGtOTG5En9PK2M+eIm20km7poQvKHMH7BSK
         oAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qX8bL6820CZ5JwymJvdCU8o9V6FV5GdqfCje7/oI55k=;
        fh=5k9SIAHbCxta9l2NVAxXAPhWBOGlOcYHEE/Bxd5yHLE=;
        b=BUW8UMmSQMUAoJJcoBVoSJxJrbrXQFN+kcu1SM2DaQcmg+8MXhAXD3XrGo9Ucx8pem
         iaL0dkXghobhN5JD3Hp27OI9RL1JsJ/it8THz6fVuVC49fhKfiebZYHK+40HhHib7A5K
         FfvQ4KvezvLShB1nY/EV0edkuETY0V2x3kUtwt+ptKIa82u2SrrjsqRiahFD6+iqh41e
         J2gOOu7B9ayB2OUpqOL3br1WqUZAXpKCH4Me1YvmrIv1YTQtOsi62grrXeGTWfrCeSEi
         dutXoXlj1j9WxDPfODGyP/36AM1vOOBaKXVBb6dRolYlz/DWMGd9A+dOxmm/SFRwznEJ
         LQhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776671959; x=1777276759; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qX8bL6820CZ5JwymJvdCU8o9V6FV5GdqfCje7/oI55k=;
        b=cM9QOLJPNpQLKnEVpBjm9Tk4zt/5iA4dByIokptmYaFpBMqv33irCfSwkjj1m0yo4p
         yz0vVS0gjNsKbsFUUwTwcUZXHF/1sfOsx/YlGR1SS92r9sf9AqTas3STnPPxnSSE6Be+
         SqeEuFGutrUE/Uq1+IvurKtXgcE+aq2rAmD8InFBUc68DCDUBvhLUT+whLqLFdXAy5vS
         UWpD66hhGDRqFMHQERBJlNeHqAaN8pyvh6PwhIh0K5dC19wyN/CPGNTkKlW8BwXY9o7x
         8qybuLJ4vrElM/rsnJiJum3YF3t9d+jCBPx1P2O/dUj9ai1Fj0cX6E2DRXpWEtWxVa/3
         MxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776671959; x=1777276759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qX8bL6820CZ5JwymJvdCU8o9V6FV5GdqfCje7/oI55k=;
        b=lp2kh0vb9VHvbmGQYsak/i0MECq06GSJk3Cv6BKFQra6Dg9wIoZj3rSw1Wp+4P6UEf
         jc6TJUzFyhn96+JpPHubVxxTBThhUet29hYiGpqY0ZzLMehT5k3Ihfayizu5UyJachTo
         FxbzgZUA5e/fEesUZl2E/JMQvNNVJX69oQqeLrY1t8L4gQs8n5xDayUCTwGQNJ1zf1wk
         UubrjvDbem8mwnYZbp5tHOYFbqWDX6GBqfBz9ZE9/1Q2JAQsoP7MlttMUgZCIVrOcv8Y
         E31XUu48xc+6kKelHidQ929mzmFDe/t/yMHuAe39c6jdB48SAhvlcvbW8KDXch2HSMbf
         HFNw==
X-Forwarded-Encrypted: i=1; AFNElJ/eYNczR02g7Mlzpilq5AKt1gudt1AUqtt6Nst4RHC3Eg7XLOiL3Wb5Ny9E7yrSwctTdThC5ilbupkA1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJjOl8OKEdRMeaqwQRdncOACkMBTpTV/jlgjJZWvPBDJOSfEbV
	1TSx67aQPU5/3tPfPVceJLIeXNeObhGiXGWgztMqvisuCR+EeRO8PR2yamD5w2XZEWEExrDEXsT
	uh1pUpVnKexTkJ78SC9QsvOmi7g/7RG4=
X-Gm-Gg: AeBDieuHL4UX7XGHlfNZoCxZ6BzyfNl5Urp7DVez7H4oULQqQj2BWYvRxb89HLbkK6i
	+4fScI9T64ewZ+tOb9011koszCGwJlPc0v3gVsS/alhj116rzmLBOqybtq5vN/+uEWsvcKqgTpp
	OsdNHsSAVBgPfhi6bHUfwPR7GR4BFTzWYlFJvx6q9ljMiztuaYDPraHJy2US2lMJLuWaH0g42Ph
	qthpO38X36/tzJgZt0VSi+qcafm8LNGwetifb5IVz+nCho/I6ise12tsdpSMfPzRbgHYcuv99Ns
	MPtqPybQHKW9rtbA9ZqNuYRgOR2fTFdShxLGt3rTpto7FWavDWUMduLJCncI7Ec=
X-Received: by 2002:a17:907:6a16:b0:b9c:2c55:3384 with SMTP id
 a640c23a62f3a-ba41adf9231mr607331666b.31.1776671958701; Mon, 20 Apr 2026
 00:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHWLEDHfXZScF5jNDzgOxGXf-MBDcVNtqW0DbNz8Ra8rtcuL+w@mail.gmail.com>
 <CAOdxtTbwipkyAfDakLAB6aVp6YkPWtKpDdVDUTz88WDB-18HXQ@mail.gmail.com>
 <CAOQ4uxhUn6oCBuVJqZu+FcMx8XeAQHZbXFAGon4Xeg2SPLJW_A@mail.gmail.com> <CAOdxtTaWWu_7eJWu68zf28zHQP3Y--vXTfbGFsceO47BpN3qxA@mail.gmail.com>
In-Reply-To: <CAOdxtTaWWu_7eJWu68zf28zHQP3Y--vXTfbGFsceO47BpN3qxA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 20 Apr 2026 09:59:06 +0200
X-Gm-Features: AQROBzDzAqpFjrbD5bTYNQHJCrGk2bhPT57K41uT-FxOcAInwVKNr2-vgwcmqn0
Message-ID: <CAOQ4uxhCNhGinePrnkSfT9Mtf4o5FmBX7mTA2m4miCMOt3mJqA@mail.gmail.com>
Subject: Re: [REGRESSION] Return change in 6.12.80+ with volatile mounting
To: Chenglong Tang <chenglongtang@google.com>
Cc: Derek Taylor <ddtaylor@google.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, Kevin Berry <kpberry@google.com>, 
	overlayfs <linux-unionfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 8:31=E2=80=AFAM Chenglong Tang <chenglongtang@googl=
e.com> wrote:
>
> Hi, Amir,
>
> Thanks for looking into this! To answer your questions:
>
> 1. Production vs. Test Suite Impact
>
> The immediate failure we encountered is in containerd's integration
> test suite (TestImageVolumeCheckVolatileOption). The test explicitly
> reads /proc/mounts and expects the exact string "volatile".
>
> In default production, containerd passes the legacy "volatile" string
> to the mount syscall, which your patch correctly handles under the
> hood. So the standard "happy path" is not broken in production.
>
> 2. The purpose of WithTempMount() / RemoveVolatileOption
>
> Containerd regularly makes temporary overlay mounts (e.g., for
> unpacking layers). Because overlayfs rejects reusing upper/work dirs
> from a volatile mount, containerd uses RemoveVolatileOption to strip
> the volatile flag before these temporary mounts.
>
> Currently, containerd's RemoveVolatileOption does an exact string
> match for "volatile". While it works for the default path, there is a
> production edge case: if a user explicitly configures their container
> runtime to use the new "fsync=3Dvolatile" option, older containerd
> binaries will fail to strip it, and the temporary mounts will be
> rejected by the kernel.

I need to challenge this specific argument because I do not agree
that this edge case could be considered a regression at all.

An admin from the past could not have set an explicit
"fsync=3Dvolatile" mount option.

Though experiment - overlayfs adds a new mode fsync=3Doff
which is more loose than "volatile" because "volatile" can actually
return error on fsync in some cases.

Overlayfs would also not allow to reuse workdir from such
a mount.

So would you then claim that adding the new mount option
"fsync=3Doff" is a regression because of the edge case that an admin
decided to explicitly add "fsync=3Doff" and RemoveVolatileOption()
does not handle it.

I don't buy it.

There is a more correct way to handle this situation and it is
documented in overlayfs.rst:

"When overlay is mounted with "volatile" option, the directory
"$workdir/work/incompat/volatile" is created.  During next mount, overlay
checks for this directory and refuses to mount if present. This is a strong
indicator that the user should discard upper and work directories and creat=
e
fresh ones. In very limited cases where the user knows that the system has
not crashed and contents of upperdir are intact, the "volatile" directory
can be removed."

containerd unpacking layers falls under this very limited case.
containerd can syncfs() workdir after unpack & unmount of temp
overlayfs and remove the "incompat/volatile" directory and then
the upperdir/workdir are are free to be remounted.

>
> Conclusion
>
> While containerd could theoretically patch their code to accept
> strings.Contains() or fsync=3Dvolatile going forward, there are many

Following the documentation advise would be better.

> existing containerd binaries in the wild. Given that this patch breaks
> containerd's CI tests and introduces an edge case for
> RemoveVolatileOption, it might be safest to fix ovl_show_options in
> the kernel to continue outputting the legacy "volatile" string to
> strictly guarantee backwards compatibility with userspace.
>

Considering my comments above, I think we have not yet reached
the point where the backward compat "volatile" string is called for,
but with other reports from production workloads, we could get there.

Thanks for the clear and honest explanations of the containerd situation!
Amir.
