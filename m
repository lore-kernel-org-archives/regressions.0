Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AD542A79E
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 10:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012402; cv=pass; b=BMIMcMPu/H30lJoOhbe64W4QdN5pF5Kwag5PJbllC9nHi7WQzxTCH7E18Z6HB1VTLGf24lhhBh1auRdWJDvEA+HsEH/IAGQUM1Qa7CvHrDOfjozNujLE1VD/1Lls4gdp7rPIGr2n6wmssI+2PqTYqxRUcJqtQUpJflFqFNhAYI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012402; c=relaxed/simple;
	bh=MhxpC1RiQz80rHHK008fiSrO8qNz1Ph79eRrr52KB6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8kzRXxO1nrI1NzBJuNXFEPdFY8bXybvfd/ZWBtQxTZX5R9Iql9UKQhlQZAitYzUauq+ALI0MOs/DBhuL/S1DYVKlIq2geCZR3uhVI1Zda/S4Fl8R/2NChdcjP+8gFFCCejj4D3b7/3vLzdxrHKPxGfKurT5HJWsKxypUX5fp+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBLPOk8n; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBLPOk8n"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51bfad59921so13697101cf.0
        for <regressions@lists.linux.dev>; Thu, 06 Aug 2026 03:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786012400; cv=none;
        d=google.com; s=arc-20260327;
        b=sLBrrBzDeY6snAlE1u3VlJ2yzVsXMQARHGSXesJ8/rMPnaf1JYjBABcy4X2A2OV8yG
         nZ170g0T4d3/C9JnkvWXJkDylQvlUMA18Lgttd0NMgwfBB/bp8PIquKLLYoF9D7fZgKx
         QFJbe26mtuWDBpcqMXNCQgvj+ewh3jZNBNWsZ7xkaCRbpYUVfIUqMW8drpxALCnlxyQW
         omS8oON9lMd838UK+S5y4s730em3loxNVNJYp6RarFZHVbc6FDiba3jwfiOCw+ekL6dx
         OG+PDcwBdFm+ZnRsFhuGAzx/zTzVcRYsn836GWnSDKSWkpVWD8Vhph5tuWkQ83OPd08c
         3gNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3TbJec+AGct5ToiNCUExgxyz37rxNVU9OlXe/UQfwS0=;
        fh=Uac2Nf76E40AaTz8XFk7gOh18vdkBQM15LFdvjtEPL0=;
        b=czqwFjd+Dp+sszbMw0SfeWlx8AKzikjptYA02FMusgSfepougUzmMUyorrUop3kiEs
         YiP110p1vxIrn5hin/T59A7t854G6eoP3K9Cd7Dqs3rYPGtygtJ1dpF9JKgJDCAFnpnm
         rt8V3jfW+RhVnhw/owDrldGrGU5DoFzvvEFaONtRatdwuo5gFcmr1STNeoMAviR7UR38
         kv0MKQIhsXS6UjTo4oNnud2Snr3ZcQpVW8qhWDoxePl/YC2bPMNo+dFdpCDq8YXn01uZ
         A2+/UvbEbDohYXJlnFa1PqkdYRWRiKkDCp/jv9yC850iUhvhgu5qrQXmGDsCy5arzVyn
         +kFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786012400; x=1786617200; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TbJec+AGct5ToiNCUExgxyz37rxNVU9OlXe/UQfwS0=;
        b=HBLPOk8nE80J9vQtFA3gwGRvYGbFLyccXm+e10i+IZLh13nuva3qFx/DGcMVnte+kf
         yNvUYhXVhyOBwop/MLlAKBr3s8L2qR1ypymGq97VNd0G7g9YF7bZLoFRRxIgXGQPbYrR
         D6mCAJ/jVyOlxijsdOkn2DxgFA7wSj0FJYfjBYUCQEnzO6+hLDULANvEJsjJreCQ5V1M
         8Xg8gWQ+qSpnzE3nm9F/z2UE/hlSpA8REKyxCj3F5XEumvjzmEap+C8GbLzwZb3Ki2YR
         a4bLqJ7TJsiv63HVpUDY+0BvxRprKJ+32c0KJFXpm3hYisAfSnjxzDVXJ6Jda5I5opZn
         c5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012400; x=1786617200;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3TbJec+AGct5ToiNCUExgxyz37rxNVU9OlXe/UQfwS0=;
        b=OqeWWxsumzep8pv+OWce8MixgvjZZJ2H8ZANPZl0r3xUd3PQYvAx50f9ffeAB4AZaW
         hFVegPy7fTlwTr8EAadufQnnb3ybPBW82aOiwOJhItazPKJ+9oEBBCcWYYcSrAUxcg8V
         RKEwYh5ZLjkncKrCYw9pkx26k51/7AyYBvaDQNZPt8DNRWaGSm2lNbIrzLMg8i6Aoe5t
         1Eg/qgtZPvm3CdPbmU+JAcmUb0iMD/Y14euiUIbF86o2MyOvTtlZqON10DUCke3RSHwo
         eeA9/lTkBlx6oysFiZHKFEu/hFozHM2iBIkaIglowjwLPTo0KdxLQLiYwJp88m8dr4WW
         XbRg==
X-Forwarded-Encrypted: i=1; AHgh+Rpy6SMOmrMQeZ/Nc+X1blU7X5eAV2Oj6FoU+7VWI5KofOY9CBhPNXailkiWYlAhyyLPfZKhRcpMpdBnCg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzd6xCIB6guBjy/0IY3h01jcXn9nb5BgiO5ngaqiz/1qb+4czB
	SDTTG1WmYooUKGA0KQc++kbh4VnzCqNvttITiCHf1ZSyf/LGxsYvJYU2CfLb3vtErjEuBdjLzp5
	gjn94orTwo9PZgp6Eyvvn8quOR1L/k+FRRiD36CA=
X-Gm-Gg: AR+sD10G+iUzEqtPV0yhr4ND9HlUTJFaqzt5zCYNwCve3sOUy0n4U5E0+QtodcetjAc
	GR22hXelDF7mCn6uxWHDoTy8yuoU7woynXCc3pY7HQNx8hoKncndeLhTIJqAU0GvpdwFHhH8gcr
	Vrc8d2Gq1xOIA+FFZTz6pDmPEDVhItynJoMON4FzZUGf+4G+sUL0AakR7h/YfC4E57i0+oUL8+q
	r/weOAtp8/srJB3iHCubz1MjmEEVAfg7T/ehTessX08VogJWFPnygI8UpoEdzkKeJwOPkeQYogu
	3K+dhIBynR0yEwsCXdRaEwO4tg+ZAScr/bmyXLxSYdDHhzkiqqsTnq6MHkGMxGMosnO1Ox9FcNF
	LzA==
X-Received: by 2002:ac8:7c4b:0:b0:51c:f3:34df with SMTP id d75a77b69052e-52ce61b5dfbmr128479761cf.30.1786012399807;
 Thu, 06 Aug 2026 03:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com>
 <871pcbg3wr.wl-tiwai@suse.de>
In-Reply-To: <871pcbg3wr.wl-tiwai@suse.de>
From: Gert Burger <gertburger@gmail.com>
Date: Thu, 6 Aug 2026 11:33:07 +0100
X-Gm-Features: AUfX_mxt4kDB4mldVeOy65_r-8cVF9zaHbjTtpOatqg1doG2ROIDL_QpomGKz38
Message-ID: <CAEQ1D3ky_7+g6_1J7ymxGUq4DNrPyx8OCsQ8Z42j2-XncMW8ZQ@mail.gmail.com>
Subject: Re: [REGRESSION] snd-usb-audio: SteelSeries Arctis Nova 5 mixer
 controls disabled as sticky
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 07:27, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 05 Aug 2026 17:41:27 +0200,
> Gert Burger wrote:
> >
> >
> > On archlinux, after I upgraded to kernel 7.1.5-arch1-2, the sound volume is
> > significantly lower and seems to lack bass.
> >
> > Reported by someone else here:
> > https://bbs.archlinux.org/viewtopic.php?id=314220
> >
> > Previous kernel was 7.0.14.arch1-1 (working)
> >
> > Attached is also-info.sh for 7.1.5-arch1-2 (broken) and 6.18.41-1-lts (as a
> > workaround I installed an lts kernel, works)
> >
> > Device:
> > Bus 005 Device 003: ID 1038:2232 SteelSeries ApS SteelSeries Arctis Nova 5
> >
> > Dmesg diff:
> > Aug 05 16:22:19 framework kernel: usb 5-1.1: 9:0: sticky mixer values (-19712/
> > 0/256 => 0), disabling
> > Aug 05 16:22:19 framework kernel: usb 5-1.1: 10:0: sticky mixer values (-21248
> > /0/256 => 0), disabling
> >
> > Can I need to provide anything else?
>
> Could you try 7.2 kernel?  I guess it's still broken, but then try to
> pass the option "quirk_flags=1038:2232:mixer_get_cur_broken" to
> snd-usb-audio module and retest?
>

I tested with the `linux-mainline` package, currently on version 7.2rc5-1

# cat /etc/modprobe.d/snd-usb-audio.conf
options snd-usb-audio quirk_flags=1038:2232:mixer_get_cur_broken

That seems to have "fixed" it.

Thanks for the tip!

Cheers
Gert Burger
