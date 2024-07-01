Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DF015ECDE
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719840865; cv=none; b=U3IltrMJgn3r8EtDbj6DM73GzGjiLxUh6sirsfSDsIll52SSUUESdmaNekgxgLlmEhnkZ1mkUAHxwVIoErChiLuOUIMcEo92jVIHfxntOhj/+n074eIswCqy433LtrahZ68YKZgQGhUsonxBKb3AMUa2HoGM4/JLb1cY4hi/zcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719840865; c=relaxed/simple;
	bh=9+9V2bXFQ9Bx9R52IP1NjXmiX1PMdyibPsUY7UTJaas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y5KIN/LmcwQKnfgh+mtX+OIghU27Zamzb2tZTJXkSCURQIFTfcZI8x2k/H3EyH5YYOGQbmEeRty4SMO66oEpstLu8VvFsGMcvUs4xiudywXqjB8me4s+MAp6MK9tZZjz8DMn3TF/mlEmCxSnicuMapHdMxXjqPyOvs20KVW4Whg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxe+zHQ5; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxe+zHQ5"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-48f5d1c2341so1681110137.0
        for <regressions@lists.linux.dev>; Mon, 01 Jul 2024 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719840862; x=1720445662; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nF71EHXFkyHVGuCXiP4aYrq6taOjaORROM/h1AwGKLA=;
        b=vxe+zHQ5EpYYSmq/jajZ+Br2og5CTjHVwozL82q00I/qS2ck5JE2reGqu+HZSmqje8
         3bseTnT/LyVjKf9oZa3JR6iU8fnOlPFdZDpTGQ9/HjDiHOKoxNl66UWdLbE6A8dYmB2p
         54bl9337i60YEi4XB0XI2Al6no9iBDpaMEQ71LZKhqk7y2hc6QkV8SQ4nP1OY0iWJZ1e
         kV+bskw7Pg4Wh/rJw6p24Uy8j4EWJAK7hD6PBEkqVckVVuG7/+Dlyete9U1UPBx+DV6r
         IwYcUu2gAxMxphKeZMUs52sj6H42pHapRduR4Nxe79Yct1HX/ScdonQ0xi5ZW5jVCOkk
         aE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719840862; x=1720445662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nF71EHXFkyHVGuCXiP4aYrq6taOjaORROM/h1AwGKLA=;
        b=OgMIliD5E++TYTsBURJm+N16iFTV9YOvIoIf2P1Hza+VKMAnSGsi7sIKiWIjgS0qBj
         i+2T7M0UnwG4L7c9jepoNofmzXX3zLX5q1NJcZF35MJdXaahAz1HQuJb+TJUq2XOR+5Z
         hrnx59lF0o6SbfI9lsZiRZhHqRIECN34IBttANMR/F8ROTNajRLkFtlXLjFkOeVI6wRt
         OIux4VY1Rub67e/cNjMhZ1YOuL3pjBZSG3bDOTgqrcrkzVonfJtLAU6/4zZIVbevcTnp
         MX2KciUQPF7o6Ajmgv4r3fmw4ntpawwS62TtEJ9Qes5IpBzg5wktqOUvtao1R5jimHq+
         9Bbg==
X-Forwarded-Encrypted: i=1; AJvYcCUGGhUkhqlUJGgYZP0yYhUu9uMzaoSUf+3DeYa/tx0a8pjq2APuHaHBbbfsZOeZ/GVP2HaV/0weP8qj9cHg0iO+6VQ/WRU6oYYWjcA=
X-Gm-Message-State: AOJu0YzKFKaXYSYII7BI7DDXeGd7+d562O9Z6Z7/rfM+Zhhy9HHADElr
	NzLuFFTI0EPzfXVvvU5YtsTToRsQg2DNSsSrv1dMq66lMxpWRvI4D0r0vaNT8Mobj5JLWTytt+F
	6NYtrb+17GogGT/xx/KUaK8S7kGoKl4bxqpdGOQ==
X-Google-Smtp-Source: AGHT+IEi91/OioUckML3e16qf/5FwGqwAJCndr2RrL0tA44bCDWr7zkEAKyB2e2ZdEb99op+GJlsVEiETTclvMwxUvQ=
X-Received: by 2002:a67:e291:0:b0:48c:45e3:16e0 with SMTP id
 ada2fe7eead31-48f9e890cc1mr5239072137.9.1719840861068; Mon, 01 Jul 2024
 06:34:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsXsbHp+0cWoTjEhkpANOav=GLSjPx5ghtUY-FjMPyoSQ@mail.gmail.com>
 <145b39a0-da05-4c60-a019-c1a6211e6c77@sirena.org.uk>
In-Reply-To: <145b39a0-da05-4c60-a019-c1a6211e6c77@sirena.org.uk>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 1 Jul 2024 19:04:09 +0530
Message-ID: <CA+G9fYs+RfnttPg7E_TAGW4sgnLOuvUQnZj6kHsXeRy=JEMOcg@mail.gmail.com>
Subject: Re: Mainline: v6.10-rc6 boot failed across all arm64 devices
To: Mark Brown <broonie@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Aishwarya TCV <Aishwarya.TCV@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jul 2024 at 17:42, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jul 01, 2024 at 05:28:29PM +0530, Naresh Kamboju wrote:
> > The mainline kernel v6.10-rc6 boot failed across all arm64 devices and
> > qemu-arm64 and no crash log found (earlycon) did not help.
> >
> > But the defconfig builds boot PASS.
> >
> > The boot problem is with defconfig + Extra Kconfigs and builds links
> > provided in the bottom of this email.
> >
> > The boot test history shows that,
> >   GOOD: v6.10-rc5
> >   BAD:  v6.10-rc6
>
> Other CI systems aren't showing this.  I'm guessing you've updated the
> toolchain versions you're using and are running into:

Our LKFT tests saw the same bug as #31924.

BAD:
   "ar": "GNU ar (GNU Binutils for Debian) 2.42.50.20240625",
   "as": "GNU assembler (GNU Binutils for Debian) 2.42.50.20240625",
   "ld": "GNU ld (GNU Binutils for Debian) 2.42.50.20240625",
   "gcc": "gcc (Debian 13.3.0-1) 13.3.0",

Good:
   "ar": "GNU ar (GNU Binutils for Debian) 2.42",
   "as": "GNU assembler (GNU Binutils for Debian) 2.42",
    "ld": "GNU ld (GNU Binutils for Debian) 2.42",
    "gcc": "gcc (Debian 13.2.0-25) 13.2.0",


>    https://sourceware.org/bugzilla/show_bug.cgi?id=31924#c9

We are able to reproduce this bug ^.
The gcc-13 builds failed and gcc-8 builds and clang-18 builds PASS.

> and will see this with other kernels.  It's probably worth testing
> toolchains before deploying them...

While we talk, I get to see today's Linux next and also encounter the
same problem.
Thanks for the suggestion to test toolchains.

- Naresh
