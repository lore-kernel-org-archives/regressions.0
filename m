Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8246E4438F
	for <regressions@lists.linux.dev>; Mon,  4 Mar 2024 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709563973; cv=none; b=Ree96wmbB19vgibCcBsDQfzSjfbH3SwojatBHdyCg9ngOJKbozQ3WkFI7yII6tU6Z3KKbeq2ZpkiPepu4FEeacxa+pkU93WTl/2zevYEerG/EpJqdcknJ1YjmSC2WzTkFN+x+Mv2xFjdkITO/U0I9V3IA/EbC89L2SVodY48A4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709563973; c=relaxed/simple;
	bh=Cg5f56MUn/U9d8krNnHQ7nC/yZazLvM060yo6XazL7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDrxk/Q4pomiE04Ej328hFlSFMprjHhvTFXEjV6tTRVaKZ0sRRSAYYKi8tOEhoY4mmqVA/u5ewLdMWBU0V+7BL/80knn71VMizPkdSRpRAFoj/ztTtEua8eF0hzVupxsAADJFhvjmrZwDQwvGsCfcO6zq+5A4JQSl1Diq43Vs4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+bhm389; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+bhm389"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5131e21b966so569663e87.0
        for <regressions@lists.linux.dev>; Mon, 04 Mar 2024 06:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709563969; x=1710168769; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg5f56MUn/U9d8krNnHQ7nC/yZazLvM060yo6XazL7g=;
        b=N+bhm389tbSgdhnVdqPzs+OoN7uMEPxi+CjIzDnj8oZ6WY9PoALlc6+khaCGDrYXVx
         1KKtbUSJhQs93KMC+Rl9PqpEATii4g6eN2untqHGwQ+N1eqWA0+5WD0gYANrWV4y1mOe
         WKRJv3kNl5LvuECUc5F9i2bMWzAC1IHQfx3dmGSVXQUDuIqgcc/xEBCjslFoNdI7K0Yv
         waTyfTVkSjKcjZmYU2MLcKo8oKdFVT4FQXDweaBzyiSlIz2Zdid+l/gBdsV0RuZLT1pk
         0i0Ipe21geVhluKELC6dnsvTWsLGI9P5HNZpDdYN5z+O8xcxCVxe6gvO0dtTowBtDHkH
         SdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709563969; x=1710168769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cg5f56MUn/U9d8krNnHQ7nC/yZazLvM060yo6XazL7g=;
        b=mH5EOvcy1vd0YGj5f/TSj+rLc5ul0RZE0RE8NgwO/b0pHF1czTdQPQz8DyNhHbScW6
         FC1rTStHV+/1ngabXFsByfkhNY03tZu2+tbIXHp3Bsvr5n1TJCE9B7Kc+aykR/x1SDD5
         hP9s1fm/AduP0rTlq/sJeC30Dp2ht+jZaRT9SOlzel2eqH2GyJY19ug3z6WFN3E76auY
         YcRqA4sqc/9LVM8IqjQ9vIz0cduTSc4z1bkpIJJa70qTDfDSwzoFNGQp9NzJJkA06WTF
         hYSCtYh/aOCdIhEcs+f5SKwFP/I07ajMgBUzWqhpPORWNgnS5G7B0SGU28LxkqdcLh1G
         rXVw==
X-Gm-Message-State: AOJu0YwRz/+fsT9EOTWAWrJKi/dT4acHBE0JwKBWhUt+078O+vVn1icg
	QwnKYPp/wEVfnRT3wgF7sJBIpIslyRP20gUw+MIravhTxdimmv9dnQhJ0Y4rK9GsnFtuswtVL3a
	BK9EycWL15Pp74sp1RK1aLT7Mm00oBjNB4+fQQw==
X-Google-Smtp-Source: AGHT+IGOKLwEABeR7EoqAUWPoOXV9gdyQK9RM+KuQYUijWYmKP22jCN43kZq1onWB1aSeZ+BSNilDFNyWpomZX/EzX8=
X-Received: by 2002:ac2:52b4:0:b0:512:a95a:98c6 with SMTP id
 r20-20020ac252b4000000b00512a95a98c6mr4847833lfm.5.1709563969272; Mon, 04 Mar
 2024 06:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info> <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com> <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
 <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com> <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
 <3bb95fcd-65cf-45dd-8d81-1a41b1ae0288@leemhuis.info>
In-Reply-To: <3bb95fcd-65cf-45dd-8d81-1a41b1ae0288@leemhuis.info>
From: Mikhail Khvoinitsky <mhspacee@gmail.com>
Date: Mon, 4 Mar 2024 16:52:37 +0200
Message-ID: <CAMMabwNo_yT4S3LaMV16Rmj6MiWL=TRYtB9wspfs_LWVgM=U8Q@mail.gmail.com>
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
To: Linux regressions mailing list <regressions@lists.linux.dev>, Jiri Kosina <jikos@jikos.cz>
Cc: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>, 
	Linux Input Mailing List <linux-input@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Linux Stable Mailing List <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for ignoring this thread. I've submitted the fix [1] quite a
while ago but it is now in hid tree targeting 6.9. Maybe we can
redirect it into 6.8? Jiri, what do you think?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=
=3Dfor-6.9/lenovo&id=3D2814646f76f8518326964f12ff20aaee70ba154d

On Mon, 4 Mar 2024 at 16:34, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 24.02.24 17:15, Rapha=C3=ABl Halimi wrote:
> > Le 24/02/2024 =C3=A0 14:51, Rapha=C3=ABl Halimi a =C3=A9crit :
> >> It can't be the third one (43527a0) since I clearly remember that I
> >> experienced the regression before it was applied to the Debian kernel.
> >>
> >> So I'll try applying only the first one (46a0a2c), and report.
> >
> > I can confirm that the module compiled with 46a0a2c alone does produces
> > spurious middle-clicks.
> >
> > Maybe "ThinkPad Compact Keyboard with TrackPoint" should also be
> > excluded, like "ThinkPad TrackPoint Keyboard II" was in commit 43527a0 =
?
> >
> > But then, would 46a0a2c still be relevant ?
>
> Hmmm, another week without any developer looking at this. That's not how
> it should be. Guess I have to bring this to Linus attention sooner or
> later then. But before doing so, please confirm that 6.8-rc8 is still
> affected and reverting the culprit on top of it fixes the problem (the
> tricks you used are not bad as such, but they can have side effects --
> which might also be the reason why no developer has looked into this).
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
