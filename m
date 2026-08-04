Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3973B495534
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870056; cv=pass; b=Xt1gW6C6JNwD48Mb2TAUBRJF52xHWLs7MxPtRGrqn69LTl2u0BsdNt8BPjpNrQQRz+BJA1dXTWgBgpmFoE+C2Wn09nOXiEWARLqjvJeB17uxxt2yy978Ova5JEAkoCOhY1geGhg7Aec+iBtPEWjFNAoi6cNz0v/c+B240HMvQ0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870056; c=relaxed/simple;
	bh=/XFOYEBNoZSJfESMossA4x0IZOYiXot0R5f6spMo1Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdaOsrH1h/HO/oFeppypF7vvXwqjBLbMW1Mm0uCRYwjZWwsAlTcXNIzv+DTKwICVtlLIj6AqYQu7+3ZEI9PuRvRxwXVw+KAdoC66ujB03Ah80jUF4/HQR2bpQ3w5cQBfZsOmD86yzV//9T+1/y9mxi5zN6Wg6PK9NBt3aTNPz8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT5H4d9j; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT5H4d9j"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dcbade417so146812a91.1
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 12:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785870049; cv=none;
        d=google.com; s=arc-20260327;
        b=TrEZ3fCFMTehLYk0LAYUuCwtiHgjb4117dSe/aPlXCULYm2WU0NysXUPyg0S81sPAC
         IIMWQZhNNAevMvPESrakSjTVLJKgzj/AhUJ0siGeFlV2Z1hh/UtdxRhwpyD3ydIR7o2d
         Z0xCfv9dcTBchnTB0JQ/ygkrus7hzqV7BMXOZ7PvrLKMFrfGAjy7xW5sUjOlUo73v2Yg
         gBFS6zuigFMpZCzsemicYU+wdww0MxuOmE0Db+y4nTLI64GTdi7wX9ABtYx8F7sPebyN
         Al+NdOMQm75Xkyrc2//XhEuShTPOThVmFWo/Y0p3Ph/uLjgjkV9ZXEOkonEjJrSKixe+
         ACDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/YyqCD8BW4XPHRakH4x68/qGqs02sJDv65IoJPvWYwQ=;
        fh=eCYl3iQKeg5smkUQJl9BDu7Bnjl4UHDO53Xr80kLZMI=;
        b=LDN6lGNixyhyNj1ECpv/tU4jvK7rHrqYTuZ2B39BUleXdsjJz4hL8mZEacEaA8/L7p
         AhQDPi/ggfNrJMPGdX/4DqMCELvs34ijinTHtL2t/4pWy2rH/FpQ+er3MEd8ComvoSpX
         lTcROcXFePvu/w3W5Fy3j0079sKmHVgf6+kJ1mYzaNaDrFWR9iFM5lCog6Qxp9jzEkab
         Vli8dyhcYmmGh7A8Ssa+d/N646TSsH4mOy7hhGMCeYyWMpR29+FFzVJ6TtH43uFrgvsU
         3HigIW63FWYK3EFAv/wRyj4I5COmy/kKSOXjhx7E75M2PcXw+l0UKxiiOroLr2C7QfDn
         6plA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785870049; x=1786474849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/YyqCD8BW4XPHRakH4x68/qGqs02sJDv65IoJPvWYwQ=;
        b=nT5H4d9jvFhqlpytJDs+PLvHIDpyrMAlLiVjP1e3ag5fG0WDlL1JReGVgbWPEszKkk
         +gQ4Nj7ogEOlv4/Tjp3wM5zHK2wdMJ0z4CckQA/9zBE5lBIByAb4jXXGxmNzM4F+vzBI
         KCvCRhZDSRxQMh1TLnmNl83vFrw9DZ20KrNQ9TLkKvPVHpFxFLdMK6Pa6rdOCrQDKpNh
         Rtf1VTh9gxdNhvaMmA4pcHzqCuDbkUOUzJGUnCTdBnnLg/aRJypZ+C2j0NB+2O/mS+sQ
         Swlbl8jmhHH1Dkjnckze5XVIUm1v4BcHmkUoRtGRunjqVaE4pzUfhOv97mqwTjS2umeB
         Xomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785870049; x=1786474849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YyqCD8BW4XPHRakH4x68/qGqs02sJDv65IoJPvWYwQ=;
        b=qXLEpYMSqcndrqZPbxLYunDrvLlAN6BWM2ZwYst2lsZIFaWgsVbdgmvZpl87cQQq9w
         q0B70hmkjDaYlJWywOTI7iTneiBU8LJtwi6WZlxzr6tZkDd55mjkm5FFTf6csbuMreQK
         gYZgsHcs7Bijuiq/ExXJMvsOxJE3jms8IHfW9vET7pnNKDLP5uBPR8EpqlTbDaJ82Qge
         rC8DKIRE/FE9SAuS02S4DHxvNcI+S3xbT3hatX9BdPAfuitnA+fBaqNRTIOnVAAzs0J5
         pwr2WQyjvvrfjNHFbg9YtHn0woCmbQNneSRINRP02vVHE4kBhugL+KoN8P6BJW99d6Gp
         E43g==
X-Forwarded-Encrypted: i=1; AHgh+RqRA0Vn0QwJE2VSQd84vNt6dTrS23Hk48kNGe0BD85COd+BI4zDFBNyWCdLHCHT7GILxMq/hRknSSIQEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwwCVr1UObTuuUmSCqp/hZTrSFCaDYr12P32vHAB1c2Hii8PpU
	yZpDzmnjQq/dkIhgD3T3gM1BJiyioLat3NJ2lxh/ljEQ1AL4R8gRrwSXp+uy4Vy22GeXroSK80l
	Q6zcB+CS7qBE+C2CATDFWTH/Ur221bks=
X-Gm-Gg: AR+sD12NStIO6Ih3TeE0LjAqzQxuVCvTjZ0ZMflmnqPNLfa68JXYwdbkZdkyLdQq3fs
	phRK7KD8wE6Umu3yuvmolYrfOHC2RFnYHQRDCxDg51yMQLbVrje6uEVDGVwkwADGMD1NpQwj3eB
	iQCaMYCT/NwbQx0DOHYuY9s1fvpTQS4NtOiGjRTfPu44K0CdUzGX0QcRtBY/VTiKvPT+oEGdt/d
	DDwAGsepF3EiR9s2vl+jMNti4xIeLuTBgG9pN7hjkX9m1EmrBAs0AHEdm2hFP2aNzWkuA4SX5kD
	CyHtRQZlDxy0Y8eS7laIc+iCALTOiVYTuxN+6TfB8XsZDDJvIWcEGnCSpfmpLjj1KKBatjoRT/F
	+us04jftrKT7ahleWGK9OVghR1KQ=
X-Received: by 2002:a17:90b:5112:b0:38e:542:6485 with SMTP id
 98e67ed59e1d1-3903c5919c4mr924860a91.12.1785870049156; Tue, 04 Aug 2026
 12:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com> <anIhyHL4Kl-DX2G_@eggarch>
In-Reply-To: <anIhyHL4Kl-DX2G_@eggarch>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Tue, 4 Aug 2026 15:00:37 -0400
X-Gm-Features: AUfX_mzKEFWesy9_PyKm-5nbf0o3VldJqhUPwpqyxb0HY0FLUd51o98kcLYGN30
Message-ID: <CABWMpWT8fGTVABdi6KF42UTmarneeBQgYQfCVj=09jyEtHS=rQ@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev, 
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, will set aside some time in the next day or so  to run the
patches and git bisection

On Tue, Aug 4, 2026 at 2:56=E2=80=AFPM Lovekesh Solanki
<lovekeshsolanki00@gmail.com> wrote:
>
> Thanks for the report,
>
> On Thu, Jul 30, 2026 at 03:28:02PM -0400, Jamie Stephens wrote:
> > sudo lsusb -v -d 0764:0501
> >
> > reports:
> >
> > wDescriptorLength     504
> >
> > Warning: can't get report descriptor, LIBUSB_ERROR_PIPE
> >
> > cannot read device status, Resource temporarily unavailable (11)
> >
> > As a result, usbhid-ups is unable to reliably communicate with the
> > device and NUT cannot reliably monitor UPS status.
> The lsusb failure and NUT seem to be seperate, lsusb failure could
> simply be device property.
>
> Few possibilities I can think of worth testing:
> 1) It may be related to LPM, the device may be advertising this but may
> not be handling it properly.
> 2) Commit 8020c41b39f5 (usb: core: allow ACPI-managed hard-wired ports to=
 power off)
> lets acpi managed ports be powered off even if hub does not advertise
> power switching. The UPS may be sitting on such port and its power could
> be cycled out and leave it in a stale state.
>
> I'm attaching two patches to see if they have any effect, please apply
> and test them seperatly and let us know the results.
> And, as per Thorsten's advice above, run git bisection regardless.
>
> Regards,
> Lovekesh
