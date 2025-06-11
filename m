Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F907227E89
	for <regressions@lists.linux.dev>; Wed, 11 Jun 2025 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632241; cv=none; b=uomieK9E/rJCud1XNUoCEi+Kf7NDFMq0nAzSNf2ieyW3PzGqiodNVSg4Yjqx3bjWixYRvJot1jGiH73QQR7CG5a4NGeYWI7/OcbFijQvVLNpD/tW2z1wkH70d0ADC1rhgL+i1n5s4MyNaexDmvlrWVO5Tr8xmqu4z/sO+vwSt/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632241; c=relaxed/simple;
	bh=BOiBGegJRIsJAwhdaPg0kbdMQr6Mw/a7D38ClN94RqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clRkzV3vhJ5N0uiiAu50VtQtYa8eMSG6s9mxZmbS9/XebR5CwdfUAxjSaso9GfD8xK7IsoMnll8aJ1xILIqKQAyz/R9O/+Rhnp2YQ+LUPxOLg9cjfwVkQDYRCql+/f2xWnROlbwLn1lbjjVl4uEfiAAnR4/jC8ITwk0FUffAowM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NNLhn4E1; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NNLhn4E1"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-525b44b7720so2107255e0c.0
        for <regressions@lists.linux.dev>; Wed, 11 Jun 2025 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749632238; x=1750237038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DV9t5sYiI13RU+dfHyim24Ym/TfwiK76Thbl9i9KKag=;
        b=NNLhn4E1fnuNDb4Gv81gB7NQsQkLh87duBYQ7duO+IoKOyzVaWI4tljRpLB+s405nn
         j7as60hu1IqLTcIW/nyGtRFl4D7fUptj7jow0fPDvRKobFd2TJBts3FPLjAooPq6eXgM
         1pITVGTBviLGwUkx/wN1EYVq1piadRVA3dHrcWCQf7lYaqysH/HkDsU9w9zSe/yBFl3j
         rOtPGyq84LxOzYbMnd57uQYVycvW7uIRUt9gsE8RYVyz1P7WB4gdX0r2IGx1iNgPp9h9
         hRv50FiihqSDdx3uBQ8bNXGx161VW0BrLoSzYKoGKEOn1EMV/el+tmL/aWwQOd1gDUP4
         5xhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632238; x=1750237038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DV9t5sYiI13RU+dfHyim24Ym/TfwiK76Thbl9i9KKag=;
        b=o15LlZLSVo+GeBHuTbObqgbxnw5bYUD1nFEThOlU4WzoqTnq10oZrZ2dNSaZtuCX0+
         c3vFNiL5pp605TiNcpG9Be38aAHQvC/zQk95ZYenDMglngP+bxpFjqOZNdVFNJr0mfQo
         5LngH1X1URvbqWThgFCbVRa+gfRRIV48pvjkxVfvsfezWNNtitR+EV6DFlc9d88IiSpu
         3R4gQ5EMlnUECM0ZwSi6lhpa6uYx11Nb3vbpwFvTtowFoFc6eUdmLsJQTTdbWBYTNzah
         F4F47C/OhdtytF/j1UiKZLbqKODqoNMKHyHR9W2rfhWXaUEEBWPWv+axwYj3lr4YpDCd
         8vzw==
X-Forwarded-Encrypted: i=1; AJvYcCUbeVRSXJJX0g1PGzBhdOX3DnUuDO4ZHR5Q+s12lTkUQtTeflEeGaCIBXvKJUhZZNWDXnrTR4kRJ0sHUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlxGwQYDxYfD4aWh1EgpLX6BXeN/FBkBhSI6oIu0BLqHEDZHyG
	FQVxlvuPj3kuWcY1PrqNHdT2BuCNdOhReDqlZpkgeNKVOzY+GZ27bf7bZaT/DcfRheyxJV+FcJ8
	qviqd1oIqPgJna63xefpo9yms2eP2qBETUoqq6n9tcg==
X-Gm-Gg: ASbGncvoFDV2SpXx/CWtLRniGLd5JDSly1fyxugdRDOdo7BMZVhX80vPRGhpepH8UgC
	P59YJg0e2etm1J6KwY8wg3eyhE8lhqra3+EOBKBL+f8vlMZhAxHZ7UCn3obR+VZtZ6C3FEJgosp
	kc0yW9RvNWLeTGE7C/ziLE38wBGYhYD73CT8N14yNHfp3QX1luvVtDONFqvlEk+UPJtJt9gTT8r
	OTz
X-Google-Smtp-Source: AGHT+IFQXF+sKGFKqYzvIWVQbzE1S3LEQpj/qr+Mjs6PmUNCe9qyp66456X1HYoQ3EeWcUwMf1iYDwClQBMee+auP2M=
X-Received: by 2002:a05:6102:2b8b:b0:4e5:a2bf:4fd6 with SMTP id
 ada2fe7eead31-4e7bba95fc7mr1734093137.8.1749632238461; Wed, 11 Jun 2025
 01:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
 <15979303.uLZWGnKmhe@diego> <CADYN=9L+Gao0w_CThNd96-yYbZDMZnwY7RvagCOdzUC4rKc-Ug@mail.gmail.com>
In-Reply-To: <CADYN=9L+Gao0w_CThNd96-yYbZDMZnwY7RvagCOdzUC4rKc-Ug@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 11 Jun 2025 14:27:06 +0530
X-Gm-Features: AX0GCFuVYEyn4auVNPUyj-VnDVcIp7H9e0QdsmhpYhaxmLWCVhksJEW8y_9TvVE
Message-ID: <CA+G9fYvk7kBqDqPSxndxG2CxxVxhNrf4Easp-aYrR=UeTS1=eQ@mail.gmail.com>
Subject: Re: next-20250610: arm64 No rule to make target rockchip rk3399-rockpro64-screen.dtso
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Jun 2025 at 17:07, Anders Roxell <anders.roxell@linaro.org> wrot=
e:
>
> On Tue, 10 Jun 2025 at 13:22, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> >
> > Hi Naresh,
>
> Hi Heiko,
>
> >
> > Am Dienstag, 10. Juni 2025, 12:25:31 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Naresh Kamboju:
> > > Regression while building arm64 with the Linux next-20250610
>
> [...]
>
> > > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqD=
gmzjEl7VszYE9/build.log
> > > * Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds=
/2yJ4IOQa1XxMqDgmzjEl7VszYE9/
> > > * Kernel config:
> > > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqD=
gmzjEl7VszYE9/config
> >
> > thanks a lot for this notification.
> >
> > I'm surprised that overlay build at all when I built it yesterday.
> > But yeah, the dtbs_install target really broke with that change.
> >
> > I've amended the commit now [0]
>
> Thank you for the quick fix.
> I applied your patch and built it, it worked fine for me.
>
> I built it like this:
> tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> --kconfig defconfig dtbs
>
> Tested-by: Anders Roxell <anders.roxell@linaro.org>

Thank you for providing the fix patch.
I confirm that the reported build regression is no longer present in
today=E2=80=99s Linux next-20250611 tag.

- Naresh

>
>
> Cheers,
> Anders
>
> >, to change dtso to dtbo and ran the
> > dtbs_install target sucessfully with that change.
> >
> > So on the next linux-next creation, this should hopefully be gone.
> >
> >
> > Heiko
> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchi=
p.git/commit/?h=3Dv6.17-armsoc/dts64&id=3De14491aaa6ff598bbe9d462e44c01ac65=
754f445
> >
> >
> >
> > >
> > > ## Steps to reproduce
> > >  - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> > > --kconfig defconfig
> > >
> > > --
> > > Linaro LKFT
> > > https://lkft.linaro.org
> > >
> >
> >
> >
> >
