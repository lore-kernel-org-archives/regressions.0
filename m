Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7E1C2301
	for <regressions@lists.linux.dev>; Fri, 16 Aug 2024 18:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723834593; cv=none; b=brqqwmXhgxG8pehmdwbvIR73cazyq4F2Ht9+4B9S5HH4fFBYyOClNcBsZf5+c/HPoPO4fHDfSc9GsNsS83miRpa/qgAxWYUFT/5QW01MI5KwLihqWCWmFhO776RnIoFdvB4VxsJez8uckd6jZThHH7nUJNZf+t6yUlPC0O8xSjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723834593; c=relaxed/simple;
	bh=omeU3vs4ZP4ku2x0A0zIzLPgOs2iEqHgbhD7/9yH5E4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=smERx6NwwzC108mZe7k7VKZ5QJDhpG2EzoM9b22OdjEUcLpHAhx1vbF50EFQSAAWRpanSwoxIfww3ahOetMBNua+FsAD3190jJPlhijpfvJ7w0NjvMWBH+It4RIYbM25/PY/Jwjh0B44COOjrclOD4m0GggmJOpgtHOi9xawy7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FXGx3qQk; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FXGx3qQk"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e1161ee54f7so2495111276.2
        for <regressions@lists.linux.dev>; Fri, 16 Aug 2024 11:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1723834591; x=1724439391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+RwyLKvh3UIcOVfcaxSgjkMZTMy6zOQrBzrBolUKbQ=;
        b=FXGx3qQk2K3Xw1NkrEZ9wZOJjRCrIJCbP62Q+h8WoFEX+5OZpt2x9EY3/Se5qM7fm0
         4/0LD8vYKrdQdcOzinTfHR0slBWEKOptIqQpUn9/VCO4KmVJP2I3kUSxTZq3l7qvHcVZ
         woMMmF09inLlq6WzYoWOniBr/VAI2R4v+RtBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723834591; x=1724439391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+RwyLKvh3UIcOVfcaxSgjkMZTMy6zOQrBzrBolUKbQ=;
        b=lepDvYp3LvmnHz9GGprXQbYYm7rpNSdcW/BvoRBPqnThf53jTHIGzxUVg+b0QAuMrc
         xkv+oe8JWYdwjxjk9gq6shInFpFMTW2qXlTpG0ZjT0/LCpgeYi+SixXDOENFBnvJ6Yjh
         GqE7KcC2llF2FH4Ll42b1KpRH9PCOnuFUQv6gYtwI8bPPv67Th+7gr6Ywxmn0vyxtOVv
         uxytdpXWzL3NLV7WdR6jvTooVIWKXCAr8eUxFbHF5N8vqLngY6jNmyI/i5oxqhKlCNJZ
         XYzgcsHJj/zYVwnJabvyaWvLFfltrlmWR1iPbocxiOMOMLUIgELQs9P5dEo+u8sa3odt
         6byg==
X-Forwarded-Encrypted: i=1; AJvYcCU2sk16wWa8qzgoD6THQh8/5MaFnb7WCdj7l7ZaaF79CTxbQN9JgHFlCfrUkjhanjpBmb5DEdG0uu+UvxmcnYGFJr1tyGPSJIOqkzw=
X-Gm-Message-State: AOJu0Yx3W3CYcFfRQDK1e/JL9uO5ebOZJY9oEXS4YC2B8SR9PdjHU59N
	6eQbJCqAcRhxDjtXvZ99oRm20Zwztom7CPdy1Gy9i9RDgFcpjH993AalTVjF3/M8VJ/5azvyuPb
	FAdmlDJIKqF+LRSYYuoEfZKECSX2aXJYRWT8m
X-Google-Smtp-Source: AGHT+IEJ86OUuUV6ntheKjcJx7UnZj41T2D1bjC3vczY0XJSYxj6wSoCZ/gigl4V7uSZxjWkRVAEVYMjOlVRqfJGhXw=
X-Received: by 2002:a05:6902:1546:b0:e0b:ab65:19c8 with SMTP id
 3f1490d57ef6-e11810032c4mr4637525276.48.1723834590550; Fri, 16 Aug 2024
 11:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABQX2QM09V=+G=9T6Ax8Ad3F85hU0Cg4WqD82hTN=yhktXNDaQ@mail.gmail.com>
 <40cf01ab-73ad-4243-b851-a02c377bdbde@mailbox.org>
In-Reply-To: <40cf01ab-73ad-4243-b851-a02c377bdbde@mailbox.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 16 Aug 2024 14:56:19 -0400
Message-ID: <CABQX2QM1A9yWCuOHV6kgi3YbPvPHz-zazkOXM6Up9RWrZ-CgPQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
To: Andreas Piesk <a.piesk@mailbox.org>
Cc: bcm-kernel-feedback-list@broadcom.com, christian@heusel.eu, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com, rdkehn@gmail.com, 
	regressions@lists.linux.dev, spender@grsecurity.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 4:30=E2=80=AFPM Andreas Piesk <a.piesk@mailbox.org>=
 wrote:
>
> Hello,
>
> the bug was first reported on VMware Workstation by rdkehn.
>
> On my setup (archlinux text mode only VM on ESXi 8.0U3 latest) the kernel=
 does NOT crash, the screen just goes dark after switching the console from
>
> [    2.745694] Console: switching to colour dummy device 80x25
>
> to
>
> [    2.771998] Console: switching to colour frame buffer device 160x50
>
> You see the VMware remote console resizing, then going black and from thi=
s point no more output.
>
> I have attached boot_journal and vmware.log from my setup. VM uses EFI bo=
ot and SVGA with defaults as display adapter, I attached the vmx file too.

Thanks! I see. I have a patch out that fixes it, but in general I
think those vm's with 16mb for graphics are very risky and I'd suggest
bumping them to at least 32mb. The vram portion can stay at 16mb, but
the graphicsMemoryKB can be safely set to fourth or even half of
memsize (in your config 256mb or even 512mb), which will make the vm's
a lot safer and allow actual ui usage because with console being
pinned we just don't have a lot of wiggle room otherwise and we just
can't migrate pinned framebuffers.
The patch that "regressed" this makes dumb buffers surface that
actually respect pinning, but as long as you don't have gpu host side
things will be ok. Otherwise we can't make a config with 16mb of
available graphics memory and graphics acceleration work.

z
