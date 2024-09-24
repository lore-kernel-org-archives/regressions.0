Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A336E614
	for <regressions@lists.linux.dev>; Tue, 24 Sep 2024 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727161118; cv=none; b=HcdZ1LVuFo6B7az6OJia2tjTTBAih8AyUCGU8OPIH/MgrrIpDUWQm4S8DKjovvCJXKvrHSw+Wan4FtTkWxtZuB9WgNAeAiMqKFQvS24Cy2Khknzfpofoc5mWfSkj8Zw70vF+BrWiFExu/a6MJmt1+jeUVGUmpA1V+ULYHQ7jzk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727161118; c=relaxed/simple;
	bh=07q9ahYM/nP+CJ0HMHVEG+85azyTF6BeNrjm3O9SQGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eaEIt7Z4pxpmi3y92eDzFw0Yw8y5DyUQcBxT2LhsEErPz7byYf6DRDWWPkxr72rcKL2MATWBmedWbRyMggvBW6cbiN7yvE5El0RjXM67/w3cf3QbYqj+3vdAy6W9BwdRTj+2aUqI25OdfQG6Ks8I/2uMX3NhHdogI5a2b+ObUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fstab.de; spf=pass smtp.mailfrom=fstab.de; dkim=pass (2048-bit key) header.d=fstab.de header.i=@fstab.de header.b=ZcCV/zSl; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fstab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fstab.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fstab.de header.i=@fstab.de header.b="ZcCV/zSl"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a9b72749bcso476692885a.0
        for <regressions@lists.linux.dev>; Mon, 23 Sep 2024 23:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fstab.de; s=google; t=1727161115; x=1727765915; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07q9ahYM/nP+CJ0HMHVEG+85azyTF6BeNrjm3O9SQGs=;
        b=ZcCV/zSlNF9pmVRZFAW+L90oBHWeU6Lc7FtUkGLEbAQv9xlveu9osxOf6axt3sETI5
         9CC722o3/77D3ST+JxYx0R/6aGYakzjy3sZVVmQ3eyv3phTxl2+c6DFLnp4tcTp8pagp
         QZG69S0QOaJMCV/xBb1FoUZP2OADPYatsHk20gXWShUv6QaZqvYdqUJz+1cYInH0kZdR
         dwqfCFpMWg3Tdm8EsOc3xV68Qa4DaR9bST1E7uJrcBTnUgBiPsXBT1yhSi+xL4sCI0KH
         BuRmpfgA19jQ1LxRaET2DYLsVaYnwxVUWPLwJ8XmU2S23lztWFxd3Ttefbigo3+AYMLy
         ii3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727161115; x=1727765915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07q9ahYM/nP+CJ0HMHVEG+85azyTF6BeNrjm3O9SQGs=;
        b=bCSXj24hj1JMxFin5gOHUQgqNkV/DL2oBUU1rwHfXdD04RuzzJb6XBkpRqYj8YuntX
         rmRT6nctjsWvULuZdQgtF2EnJffhziWAP+7YeQT5Mg8nKX/Ddrr1XmxmiD+FKsyV/e3N
         65RVEdtH8qWhAwvnity0N1xcuRuXDNUViivotiBjD7Ga2Tg0S8u9NLwaW0EpxKHECHi4
         ct/n7iyAplcmNxsXLWhqdcMAy0l/OWGebezpZTjVrkxMsSJv8ipNDa8ckIioYbIgpU5e
         H5w11cDq2yv6KMHAtiyAic+IkCDV85irtV6d7m2V90mn3hvnXnA+Q6GnpCxZRgROHwCZ
         PQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgEf2f5I1qtvzovg2O6zQcA9FdQTWZi2M3dcA1LrNdul2XmuSt5G9dtFHaoWwU9cyTvAX1nRoB21uZFw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq1hKsAPf4Kx6R2NrXj0L8qHZHD56f0QrDY50dqVoFWHKRoB4N
	xbiwrA+u3+/etUVov47TSGCTA1Pd1W8AcoFu5f1i39HI90Stat7NEi6Gt2GjAqdjgXgFJcqu7fW
	Qsh52mdKJyHt8jjP0/WGtuFV/4ViJulBw11hW9Q==
X-Google-Smtp-Source: AGHT+IFXJduceOyuYmjFZFES4FBzZayxNGhe01YJ32akwYi9lbFIAX7peTclwe0Uro0bKhwdttyXSE5jwSC68MbxVT4=
X-Received: by 2002:a05:6214:5d11:b0:6c5:8125:d7c2 with SMTP id
 6a1803df08f44-6c7bc6f1a81mr244109976d6.26.1727161115375; Mon, 23 Sep 2024
 23:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPX310gmJeYhE2C6-==rKSDh6wAmoR8R5-pjEOgYD3AP+Si+0w@mail.gmail.com>
 <2024092318-pregnancy-handwoven-3458@gregkh>
In-Reply-To: <2024092318-pregnancy-handwoven-3458@gregkh>
From: =?UTF-8?Q?Fabian_St=C3=A4ber?= <fabian@fstab.de>
Date: Tue, 24 Sep 2024 08:58:24 +0200
Message-ID: <CAPX310hNn28m3gxmtus0=EAb3wXvDTgG2HXyR63CBW7HKxYkpg@mail.gmail.com>
Subject: Re: Dell WD19TB Thunderbolt Dock not working with kernel > 6.6.28-1
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

I can reproduce the issue with the upstream Linux kernel: I compiled
6.6.28 and 6.6.29 from source: 6.6.28 works, 6.6.29 doesn't.

I'll learn how to do 'git bisect' to narrow it down to the offending commit=
.

The non-lts kernel is also broken.

Fabian

On Mon, Sep 23, 2024 at 8:45=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Sep 23, 2024 at 08:34:23AM +0200, Fabian St=C3=A4ber wrote:
> > Hi,
>
> Adding the linux-usb list.
>
> > I got a Dell WD19TBS Thunderbolt Dock, and it has been working with
> > Linux for years without issues. However, updating to
> > linux-lts-6.6.29-1 or newer breaks the USB ports on my Dock. Using the
> > latest non-LTS kernel doesn't help, it also breaks the USB ports.
> >
> > Downgrading the kernel to linux-lts-6.6.28-1 works. This is the last
> > working version.
> >
> > I opened a thread on the Arch Linux forum
> > https://bbs.archlinux.org/viewtopic.php?id=3D299604 with some dmesg
> > output. However, it sounds like this is a regression in the Linux
> > kernel, so I'm posting this here as well.
> >
> > Let me know if you need any more info.
>
> Is there any way you can use 'git bisect' to test inbetween kernel
> versions/commits to find the offending change?
>
> Does the non-lts arch kernel work properly?
>
> thanks,
>
> greg k-h
