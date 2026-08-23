Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE4C391849
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787501451; cv=none; b=mmCrL8ZOuFFxbQNpHuMmFqXCLRyMcjeCJ7rwMloAqSLuiPOs/NwgHa7lkSTUnR1Bdpeo+Er0BrXE4sRA7s3Z7c0UAf7IwVQDM+iWAlfLw89E3M1mkJh7VRuNu+NXnxMQJojbeBSOSw+7sfiVjHWUgPc4mNr1/+I5VQgncnw5dfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787501451; c=relaxed/simple;
	bh=lbWmABHhb9TMAF2Ok/ofP++jFSdI06DXNKBawGkc4oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dRAGGS3kYxOgMHcLORoo7M47gIox0937SpdHXNvp5SSKKMepZfAiLNzlECGJ2m1J6iUAsydcf9mM/YGO5Cblr+R8yVk18LlY9DUX1k0SYk9A7ex9Z37vxPwVZNi9YP9PxxKOFSENeFEFugDAsxan0sHFeLCOg+D8HQvjIxUeWD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSCaPsEJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSCaPsEJ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c52d920b8so376725166b.2
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787501445; x=1788106245; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TyORu0icZu5goeOAIcax6J1V8GVbm7LatmMPeHFdvPo=;
        b=nSCaPsEJ7xMLCuYrzrjs0YSJ9WsDKbFz/MeeYePdpb6vpewKS8wdxGcR0jzxWPWzRu
         O6JuAaQdhvQIRrE07+wtVgnd7EzWO2YKq6O7D2QXACVsuxATZNmtXwna3ede9SWjFs+9
         2lw7EKKg4htAsDyVykUPbKXQn1B6qL/x93KjsYlR+lLV6YkPE0oJejZEAZknv04n+MJd
         R7g+kOu2stwGs0rsTnraVHPx/+La7Bw6z2XIjN7vQITzKEbSpP3SCPkwSyA3TWm6+YE4
         YbeP9S6L3HfrAjBo5J4ecv4eFBmjWSCxBnNZq3M2UWM6qV8b4nybJYRF+ZvpgyUiL9t3
         LLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787501445; x=1788106245;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyORu0icZu5goeOAIcax6J1V8GVbm7LatmMPeHFdvPo=;
        b=HD9R+AHmDvZ0dKweWwl6316zOXsHgd6joeirphEszf/xYrRETdFr78FtD9JoYOUCLK
         i6gsIBnX+fYY5CINWjBqtSZxkMSRgn280IW4pzWpQo//Lvaw40UKzHOTBpC8mL3vZ4GT
         7TR3BDvILo8qupxFBViD8akf4AZX+agzrp76HWERyT6afSyXpxhB3+wrzOWvD1fCIZD0
         R6R8kZzF3/79zFW2fUS4NrZGQvKOzYiBP0JeAzpf4uo2jDjh/ingpFwLlCQQyuUTtUvQ
         6rdsvs9ayooHntNOWh3f59m2lLVX29dy/1IHr8/jtTzG8nYlgGvFnIw9AamGxvICfLYY
         GR2A==
X-Forwarded-Encrypted: i=1; AHgh+RpL0BOZbXB7m8XXTvN7MRIins5xHVOO4MfiiCrvCry2VL0+1Zy9LeQuBolnOJGgW9qLHJE6ZgdF3Vn9yQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kphhr8lmjZkEsJB+FDPPB1khqo3qyXX0jC0ArNUcRowV2CdPtG
	z+8qHSIPpFQEHX+7uT4lxTy3tVt20Vd4Y5aDMs9KNGhz3/iz4p9GI/cm
X-Gm-Gg: AR+sD10p4bUw8sjIq3dFGk+HG4Yo8nqRZAzZ8HH6yNmscIVO1N18cw5y73PpYX6ZV3x
	r+WCTH2nNkjCCpaH/lKSAuh6ujGF+lZMecSD/nWnEaHKv3ig+eQrl8q9foVRhJszM3vyKlp6xZs
	rmB+bGDkHDD0kO3PSK1Jzt9dkk2THIJlp0/JF0rVZgmUiaZ8et4ogja8wtm0xO0/GDEpNxwb7GR
	kMerbWFTOMmeZhqY0zZ69ALRK7OuGzjhGEBz+M4keonAGYxsBSSenPOWe3nAuqjXEZOsRp9vYa1
	QCOr2WVT3GFAdeH0LqTO6kaA9lfAXiiiYbFc1Zc+za02WFUonOjm8cVOOVQhToaXG62Drb0k1oX
	S/JoZ9DzBu/zpiI1IFNSkcoxwsPgJUzbIcIslGewp3ACIGyk9LiNnn2DMgMZNJ0tdVv3UxzxNJR
	5sSjCGrRX8lb0BeO7hYMuGf/9A/u6sQfFSi6pogikASWcVk4ZFFBiu/BuMO+qkmnS/Z8k=
X-Received: by 2002:a17:906:ba97:b0:c12:9b98:209e with SMTP id a640c23a62f3a-c246a692891mr2208059466b.23.1787501444843;
        Sun, 23 Aug 2026 09:10:44 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm921183566b.46.2026.08.23.09.10.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 23 Aug 2026 09:10:44 -0700 (PDT)
Date: Sun, 23 Aug 2026 18:10:41 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello
 <mario.limonciello@amd.com>, Forest <forestix@gaga.casa>, Slavik Dev
 <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <20260823181041.4eb74365.michal.pecio@gmail.com>
In-Reply-To: <CAPyJwA-eNSbVGV0uhy0-2w2_Gs0dWdOeJLRpBSLVO_a01-ZPxg@mail.gmail.com>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
	<CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
	<CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
	<07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
	<CAPyJwA-eNSbVGV0uhy0-2w2_Gs0dWdOeJLRpBSLVO_a01-ZPxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 13:44:53 +0200, Mathieu Fluhr wrote:
> Yes, looking at the reports, this looks definitely related.
> What is happening when the emulator starts is that it also starts adbd
> if not running on the Linux side, to communicate with the emulator
> later on.
> 
> [...]
>
> Ok, here you lost me a little: Looking to all the links provided, yes,
> this looks very similar to what I am experiencing. But (and correct me
> if I am wrong)
> 1. reverting the "bad commit" is not really an option, since it was
> originally authored for a specific purpose (other than annoying AMD
> owners :)

It does seem so, even if the specific issue report isn't known.

It also isn't clear (at least to me) whether the intended behavior of
the patch is causing this, or if the patch simply has some bug which
causes unintended side effects that can and should be fixed.

> 2. the patch that Mario proposed is very recent, and would address the
> issue not on the USB but on the PCI level?
> 
> Thanks again for the swift answer here and all the informative links!
> I must admit that I researched a lot debugging this issue, but I never
> thought about looking to the USB side of the problem, focusing more on
> the CPU side.

The issue is obviously a severe HW malfunction (you mentioned MCEs, the
Ryzen CPUs simply totally locked up), triggered by poking certain xHCI
controllers on the I/O die of these CPUs in some wrong way.

The minimum known trigger is this loop from bugzilla comment 8:

	while sleep .1 ; do true </dev/bus/usb/010/001 ; done

Opinions seem to vary on whether CPU load must be present or absent.

The minimum known workaround is disabling xHCI PCI function suspend,
see bugzilla comment 16. This knowledge has spread on distribution
forums and many users stopped caring about this bug, but clearly new
people are still running into it.

It seems USB devices and even the root hub can be suspended safely, as
long as the PCI function remains on full power. The influence of CPU
C-states was previously unknown. May be specific to Threadripper.

Regards,
Michal
