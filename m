Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08CA155341
	for <regressions@lists.linux.dev>; Fri,  7 Jun 2024 21:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717796609; cv=none; b=BDldXPVe2d9MUA7LivPFM3m5djE8tZ7tbGwsBzmGZVHuDMW/xOEIGbugXQN4UU0FPVPImOLd7qPRCexVwqXzoKhSjxeXyEG0bdGxddMFNp8AiPFrr+SENK/ypaHxilxKg7dBaqs3i7f3ZkPVsuT6i8QFgVh7tgU5JeeYjbhYHXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717796609; c=relaxed/simple;
	bh=9PglZxqkRIHCjk0zIOcsNkMGKkbymWR/1kclCnT22JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jolpE4PtqCBjYrXeH0vUGlG/24O4PQ84L65N2rHknqaiH5xwV70I5ElGqkxQueYNnyZl4JdUgdf3ZYR9S98VyhzKf098yfaCmwGNYW6I5sxc7HMxJ6JmwHS8+lFD05KVU9on89jq9GXER/ODQlQL2/MxkDCCIyGk52Z9tyHcj40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6f5+oxj; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6f5+oxj"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-80b494dc88dso49280241.1
        for <regressions@lists.linux.dev>; Fri, 07 Jun 2024 14:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717796606; x=1718401406; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PglZxqkRIHCjk0zIOcsNkMGKkbymWR/1kclCnT22JI=;
        b=k6f5+oxjCXXMJ8YYn4TYu0+FglXntc5wnrBiRlEIWRpZj8WAE7l5hx9YyZhQ8bN7xR
         OLXP8a2+fwufwmbYXONE4N3MBf1nS6nfNKgiZHnWTbuvUew/Ayo8RdTvXJknI+n1Tm/d
         KSwjImv94E5hSkfz+6nDdPnp3t+WrqNTwEUDJWBk4QeIk1+hShKB0/sqxQfj7Gk6PnUs
         I3AiVkA+/SngbiK8sBxkHcilxF1I8jlewGLea9/nw3pNKhFYECgyNaDNohl2rsSiF+FR
         mkzNnS8YI5mGHe0DQI2VZtB3IvEZASCOb9tO4/j5znXzJ6r3gLEGLdZlZZN5at2jkuoX
         RL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717796606; x=1718401406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PglZxqkRIHCjk0zIOcsNkMGKkbymWR/1kclCnT22JI=;
        b=tDJkQ37cQYVn0tATTLLsaro9vc0v0qU+Sdr9gyG9VNGuC00qYEEAS0M3wK1cbd0Af5
         ne8uJdPZTl7YUz2K2gHqivoxMo90IR9XtkYm4z5j2ZDzN41k/TnvsZ0sUj7qtfsHSvOi
         nRfBsc8MIWZtV8jTSmGpavtX5HdHUakim+sp6WXKlXRhMe0im93+QcmGfMKtbMvbcW7j
         akS6Vyp3JAxeLGG6Xg/DMSYQiH9dQzzryG7O3gnZQwKjcqWzfSF6sNqwMgeQpmfAMjXk
         79hXjNXWWIHwr1vickoDkI8lR4p6Xpxu5TDPrwDIIrotuHlX7Uzq+bMP9NzsarRz9YnV
         mKTw==
X-Forwarded-Encrypted: i=1; AJvYcCWFtNFklA3d5CYjca+ND97kFKyuDv/dmr1foGCgBz/lgcvtDjepwUrezRV5yd25Lf35yWnwGwxkQDir4xw1tPijmmKIAAw38bsE2sE=
X-Gm-Message-State: AOJu0YyFvpIwpr/QD7ddIRGNB747DMnhYfutTiGRqfzjngky5qLIje37
	YC4+as5XNWuiximaixszx6uE/gtUbZeuFGHXCHScTcMjdoETmEXnxYpNBN2DufKj56kfT5hZnQC
	NlF7DwZWp//W43pcJjiOyMoNABpk=
X-Google-Smtp-Source: AGHT+IF0lN+gA3iIUmW24VXTla1mFm8stjXUgUAlgn3FwEZdgaJTRsZvJ51HmozBuIfGFcwouZrXfcAkmQuKKcdoxbE=
X-Received: by 2002:a67:f2d4:0:b0:48c:2cf7:8312 with SMTP id
 ada2fe7eead31-48c2cf78874mr2639315137.3.1717796606414; Fri, 07 Jun 2024
 14:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGew7BttU+g40uRnSCN5XmbXs1KX1ZBbz+xyXC_nw5p4dR2dGA@mail.gmail.com>
 <CABBYNZLE9uYiRM-baoBt=RQktq__TguMETgmVWGzfeorARfm4w@mail.gmail.com> <212fca4c-fc1f-4da4-b48e-c6a4b64a2b35@leemhuis.info>
In-Reply-To: <212fca4c-fc1f-4da4-b48e-c6a4b64a2b35@leemhuis.info>
From: =?UTF-8?Q?Timo_Schr=C3=B6der?= <der.timosch@gmail.com>
Date: Fri, 7 Jun 2024 23:43:14 +0200
Message-ID: <CAGew7BseJ18yjTu5AFWr=B3c41gXe4T=B0JqFWvXjQYvcDPfTA@mail.gmail.com>
Subject: Re: Bluetooth Kernel Bug: After connecting either HFP/HSP or A2DP is
 not available (Regression in 6.9.3, 6.8.12)
To: regressions@leemhuis.info
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, linux-bluetooth@vger.kernel.org, 
	luiz.von.dentz@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Fr., 7. Juni 2024 um 08:10 Uhr schrieb Linux regression tracking
(Thorsten Leemhuis) <regressions@leemhuis.info>:
>
> On 06.06.24 23:23, Luiz Augusto von Dentz wrote:
> > On Thu, Jun 6, 2024 at 4:46=E2=80=AFPM Timo Schr=C3=B6der <der.timosch@=
gmail.com> wrote:
> >> on my two notebooks, one with Ubuntu (Mainline Kernel 6.9.3, bluez
> >> 5.7.2) and the other one with Manjaro (6.9.3, bluez 5.7.6) I'm having
> >> problems with my Sony WH-1000XM3 and Shure BT1. Either A2DP or HFP/HSP
> >> is not available after the connection has been established after a
> >> reboot or a reconnection. It's reproducible that with the WH-1000XM3
> >> the A2DP profiles are missing and with the Shure BT1 HFP/HSP profiles
> >> are missing. It also takes longer than usual to connect and I have a
> >> log message in the journal:
> >>
> >> Jun 06 16:28:10 liebig bluetoothd[854]:
> >> profiles/audio/avdtp.c:cancel_request() Discover: Connection timed out
> >> (110)
> >>
> >> When I disable and re-enable bluetooth (while the Headsets are still
> >> on) and trigger a reconnect from the notebooks, A2DP and HFP/HSP
> >> Profiles are available again.
> >>
> >> I also tested it with 6.8.12 and it's the same problem. 6.8.11 and
> >> 6.9.2 don't have the problem.
> >> So I did a bisection. After reverting commit
> >> af1d425b6dc67cd67809f835dd7afb6be4d43e03 "Bluetooth: HCI: Remove
> >> HCI_AMP support" for 6.9.3 it's working again without problems.
> >>
> >> Let me know if you need anything from me.
> >
> > Wait what, that patch has nothing to do with any of these profiles not
> > really sure how that would cause a regression really, are you sure you
> > don't have actual connection timeout happening at the link layer and
> > that by some chance didn't happen when running with HCI_AMP reverted?
> >
> > I'd be surprised that HCI_AMP has any effect in most controllers
> > anyway, only virtual controllers was using that afaik.
>
> Stupid question from a bystander without knowledge in the field (so feel
> free to ignore this): is that patch maybe causing trouble because it has
> some hidden dependency on a earlier change that was not backported to
> 6.9.y?
>
> Timo, to rule that out (and it's good to know in general, too) it would
> be good to known if current mainline (e.g. 6.10-rc) is affected as well.
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.

Hallo Thorsten, I tried with 6.10-rc2 and it's the same problem on my syste=
ms.
