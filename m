Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0DD27B340
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 23:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785886710; cv=pass; b=eObyJkAOGy1Etqz7+dTdwXXjjvLxuzp5BlnQLPiVLIr6fJh4JyPz0yufe51I/2GmVYATC6LRwcUDsYpqkOqISAqkPy7pBGrFFts5lssXZAAMn/xUXxhZcSb5X320Dk6Rl14kiM788KnJKX6JZaELO0FRd2bg+8mapfIDK5XzNDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785886710; c=relaxed/simple;
	bh=meyU1YugnRxYeRLkXcqB88OhoXFWPWo27DjJ8y0AMj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYONp45/j1IL29b7w1KKvZbwhS5paB6BMP7noqU7Ug5WgWuTvsz8i3+WFQE8DfwHa/MsS050004qTz8O+z/aMmytzVywyNJLOovhDZd1AUWydBjBGrA8/Ln7FDqED2lkVVBVwLKHcf0YS1ykPB5fDNOCLVXVMNeLDyNp5NtdBX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJMjUitQ; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJMjUitQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce98cb8165so4876745ad.1
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 16:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785886708; cv=none;
        d=google.com; s=arc-20260327;
        b=WmiDsUbzVZzQdZy4QktAxwvslGyydfuRliDbRIsyuUFDUDj5XcZUvLj1hiYrZIvucM
         qBYRhgJT4/yeVI85R37N0eO2mgz4lr9gkXOFym5ItX2ZbNz465saVpgrLtss67W9OJqQ
         O20HtbKK4p3m/Bl9Za5G65a10ixUB8Szmf9MOEtHOiu8YrbpX5qcmzKJX4ZhuGXkEIzj
         QQOvAEFfHGHo7PKnO6Fq0oGK+FcXqyc936Mh0j04FNU6aUv2/TgWTdQ2LdIJIL08Slg7
         0rjK7j1pCAtytL0vbvUHyCPedr88K3qGwfOINt4oaYEpGTxzG55GDUgAj4d8gGThWfgn
         GU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vt3N6M6O4cWekc/iSM5RDUsHKKmq9c1umfQomKmQmSY=;
        fh=j/s2+Liu6jy8a6HyiJ+KHgGp2/XdjuZ47RYb7tPkQ/k=;
        b=Xedl25VKa2ax8zj+g2pVIfsiDPIw6bx+3ox3cUwLj3qs6pAFSqO7TtSOmOgALhPqRO
         YQwU/sakGhwDFg+J/320dcVMeGH62mzapGeJxF25YbZo+88PDsQmIrfcgRRHzQb5wfqV
         n30Uc9Snni/1T/mRV08bZ7yUh5dHiTLvz/1ERiGx/53ypRL2RIr9OhZ7udDdMJverk3I
         JQjpK3WIxhP2aFCMMngr9by5yJDsHfaO3B8rl9+OI+BANvOdYCGwyG/6TxAK4D96cj+K
         tMdbGIpGFEMzbsR1hJyeyOQ+ZW+WloCRN4YI85zYYSscySzrUy2GH4oKt3AT4eiPeW5l
         PayA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785886708; x=1786491508; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vt3N6M6O4cWekc/iSM5RDUsHKKmq9c1umfQomKmQmSY=;
        b=fJMjUitQqfNf5P+eWQLN65V22BUb+yPC1dxQpwlarmj8Jtr98yoWnmf6S4LotKNE7v
         VhCXctBShq9X9GUCXRpOIZcqkoi0Tt6lhh8yWB8NHVHeBNxByJnUgCp3C1pHUYpzySSA
         +LpbaqAaPq4BkAYlam1N2f1N+HAF8jezowFszS2I419v+Ky9ruhw1zkCEwPfGXz9qCfN
         gWTI1fqcmLEkN2QLx/801QtSxOC7JPFemZRU+832ck1+DwCX6YSkpJ8ABesAoYmvwpif
         Hlci0fZ2e3QaS8arDIJ5fbwR++stOxYOXc7/+Q0Rs1/77virwJkr5vQladV+9ZJ8vOov
         gTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785886708; x=1786491508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vt3N6M6O4cWekc/iSM5RDUsHKKmq9c1umfQomKmQmSY=;
        b=cG7VrDHHEvJsHAbvussPrnYIHgEeSxs4OVvhUsVy/75VZWG4afpeL8tsRWIAivH/rm
         L8mzRv4EVx6T1dSgEbUwdLUb+RIL2N+yQBurWBtV5SBcTULni4pZEsbuEVAe85NJfG9q
         5u476DsE+8szz53peItghcNeQNnTy3N44Ut2TDbsxTnZk7zK1gusbJUhRnh9r7rqFkgb
         qfS2iFirPeuFjqWLq8k70kTnkiNKnWdU1VY8K9vW1BnlDuJecbljW5F5ldmX3ADN/DBd
         rRamm5en8jAFAGdJ5N5okeNskYmcJGwSQyYQLGWm4i2dUVcivAkbETERXr7eKro4FUCc
         Yi5A==
X-Forwarded-Encrypted: i=1; AHgh+RrbQhtlG0dM5rv5od2lqehxa7L+XxifyueyKkwfwXYS98X9vtaNxa9ff7C+KiZ/kNrWYUF62bQEPwbLyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6dCFs+1D2ar67R135KtxDL0VVVB+vQYIMlKUK+XKsD5EWns09
	ngAbDfgEGN7PMdIdh2wcOOYaTMTIe56dqiwfUiqdWK/tqGUbyuqg7XyacpFdtOAVA4XjBHFWgE3
	cgtfbheP4iHeDloXqvVDnMU2p7JTz9KOIhj+N
X-Gm-Gg: AR+sD11HIsJvH815Tv+RO5FJaAvpuvmZD/CAAYYzPc+sankcklUvLeYjsB6U+YJYW+z
	LOi85wpYCysAHO1q1n8TZ2QR7iW2k6OTbj7RAUz0YFWMgw1NRTg35qAI4faejGyI2TwUojo/Yve
	ovZwdmj1BVb6pLG1s7mOHQKXDOYN4piq0udhWMSKrKOpihOq4XJnYMTlcYyHGvRJtXK3oumU01V
	xnYm/5q2fLNHOcwNMxxiqENGaY/jxfMzptfsxvTXceY399VuQ9a3ZM8hbtU72pBt8lfvqyXuqg+
	94N4lC9kY0Eu+E2I2ZmG0fm4R/IO450FXhw4sxPURb/DVDHzmwP5hUhM8qXrACMFU+IELiiKjTp
	l3lgYZQFRvaQn+8hzsLxJehm6odhiKJd6MVtZafBqNIQBHq1QoI5OtvMsvLSD
X-Received: by 2002:a17:902:d48f:b0:2cc:841d:cd7e with SMTP id
 d9443c01a7336-2d0c9b86e86mr12538535ad.21.1785886708417; Tue, 04 Aug 2026
 16:38:28 -0700 (PDT)
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
Date: Tue, 4 Aug 2026 19:38:16 -0400
X-Gm-Features: AUfX_mwIpL4SdSZhVrTWRob8gN-UrqhpzPK2fLzyxy8e8UgeIOn18-toW5_0yT8
Message-ID: <CABWMpWS=-xjdAHEuNKVF0Vs71zqtMG1n0hRBWk0gSn_NhYAeRA@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev, 
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lovekesh,

I tested 01-no-lpm.patch separately on Linux 7.1.5 with the
CyberPower device 0764:0501.

The patch did not resolve the problem.

On the first connection, enumeration failed with:

  string descriptor 0 read error: -75
  can't set config #1, error -71

After disconnecting and reconnecting the USB cable, the device did
enumerate and attach to hid-generic, but NUT still could not initialize
it reliably. The service reported:

  Can't initialize data from HID UPS

and later:

  libusb1: Could not open any HID devices: insufficient permissions on
everything
  No matching HID UPS found

Running usbhid-ups directly with debug output showed repeated invalid
HID report descriptor lengths, for example:

  Trying HID descriptor length 2053254698
  HID descriptor too long 2053254698 (max 6144)

It eventually reported:

  Unable to get Report descriptor: Resource temporarily unavailable

The manually run /usr/local usbhid-ups binary then terminated with a
segmentation fault.

I have returned the UPS to the PiAware NUT server, where it is again
working normally with the same UPS and NUT 2.8.1:

  ups.status: OL
  driver.version.data: CyberPower HID 0.8

I will now test 02-resume-reset.patch separately and report the result.

Regards,
Jamie Stephens

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
