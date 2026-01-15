Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DFC273D81
	for <regressions@lists.linux.dev>; Thu, 15 Jan 2026 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462397; cv=none; b=KVgrNUVkW8alSSvyEX8ADYkdjFWP7yApKDAZkbU5r7NbRap4zPyQGrV9oiZrPycLlcE0UO4q6SC3B0q1Zd7/dyQV9qnLGjZ357WIM/DbZImjAxkdMli6PfMxEhvtll32uD1GjLFN/43e58ey/mHHpK3DNC/sIVMhX7fmLi2mrBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462397; c=relaxed/simple;
	bh=zZ9nZeKleRhO1OpqtxMMsikzalzUBACMmA41lHCi1Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dg5kyQ9PeblUsLRZ6Z2NBrblZaX/0pVd7ffGdNLI1SgTZhVodVxRjwGgR5hbRPLAcrcessNuk4HplGItiWvvEbPM1KVk1gPAwKCgGTU+J5JkihPJs9snMaOU1XuYrhuUTKwZoufbVNTH28yYRMigpdT88J+JTJTbM+vL0K1cDJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KzTKLcLf; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KzTKLcLf"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b685d2b79so589622e87.3
        for <regressions@lists.linux.dev>; Wed, 14 Jan 2026 23:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768462393; x=1769067193; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=foTicU0G5xwJc7vFiv3smWvaGv8Ym4yg/e6HWX0Af+I=;
        b=KzTKLcLffVhZKDmO986S9gn+b5oA1EBaVsFXyvFsvlsNgZ9h14ItvPMsTjflrTjakS
         xv93QkSgbaecrxNQKwkNl5Yo7KyQjV9y8pwdK94yqD9aqHAY+h2WSBKPRE0MStGcwQjk
         iZ7Mkq1WvZ/m8ufFo85f9MwTSA98/T/E72LEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462393; x=1769067193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foTicU0G5xwJc7vFiv3smWvaGv8Ym4yg/e6HWX0Af+I=;
        b=UmV75BtBUuv/8BixmL6L9OLRZ48OV35RPrU5qhXIVA3Sexc+Pc9Onp5JybKYHn00N/
         kAz69he16EoeurT1t4tut3pBgOKSsDueJ17AamvYfWxjr1KRkXl3MI/dW4pNfi0nBEBP
         PGweDR/TGprLGLrNGzHvJfKZTile5Qtowzuf2NHTSH6XU/OG/JQH+g0M4tjEBy78hv3x
         P6j38U3rUfj5JqO5K0Y1xwiqbOMeUHXer8iBLBm5cR3X2FO+6KvqkIDoR95+t96VvffY
         TS2bKUNVIQNU2w7wbhwmI/lcHJtrMF4Rc1Bg6Krla+FOrn/13wxjQDGYbBoQz6Zl1QsP
         xSRg==
X-Forwarded-Encrypted: i=1; AJvYcCVqcPaKbqQuReh8/YeizzEu+Ln8JotQMFKzrZ6WhRxOODC4VV+zDUvZPkmDfjVa6+10feSeGBnyHHaXjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKFfgvqoqb0OHYUhO1vGXF6NxHP5Iq+gbDolsR5iqPdXygwbnq
	7rzn5B5kjJSSviMBdE7Bb4SaU9FG0L1i39KTT0vrQKpYZxn2ZJwhQzGE5DzgnrLhAKVrbs7Bi1C
	nPOJj+A==
X-Gm-Gg: AY/fxX6CjwVhQsDFlvekVlhwmdi63tq/6GFWVKss8TDmRFrJNYigw5GQEpatP66UhWq
	PQHyGuE06gc+pvOvxud1/YwQ10zsA15gsAxyOwxSb9U9Li+D/y808FqBOS28EaZbPQ4KW+ft9HF
	Hcrdy4cXoF09NXbWsS00MhfzDX05pMDyy5lGjXrdxwvaUtRnd5+AfHp7KhGNJjU3TwPwdIVzv8k
	I23QzvoU3uxrZokGaEXnM96bU7soG4+TtExJAzpWoW0BJ8NHGoZq9X+ApfXOXAnuKTNw9hX2ERF
	C8HFdYJcCctB8CVI5Q5lWqQSkuM+LB27Lq0niAbTm98ODm6bQOvOl2XWmdo3bsEEeo4GOBv/SZ0
	GaNdHx0/AvDRuhDkVLn1u6b79z/UONg2I9YpnpysXfw5bnGr221WPFlBOkJnZEyTPH/oGsuOqkz
	YkNA/lv1OgU1dKWqy1LUOFqcdkl6sn1T34yYHaxtmg3Uruwt84
X-Received: by 2002:a05:6512:10ca:b0:59b:70ff:200b with SMTP id 2adb3069b0e04-59ba0fa7606mr1574669e87.53.1768462392973;
        Wed, 14 Jan 2026 23:33:12 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba10412fasm1447060e87.58.2026.01.14.23.33.11
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 23:33:11 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b685d2b79so589599e87.3
        for <regressions@lists.linux.dev>; Wed, 14 Jan 2026 23:33:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIqy1iTu6v3IDS89Yh2l5EAaasnCFQNONHLxhPKN33LVygphgjImCMwj0wTTkgolji9DQnegU/Hq9+uw==@lists.linux.dev
X-Received: by 2002:a05:6512:3a8b:b0:59b:9acd:5e7b with SMTP id
 2adb3069b0e04-59ba0f76889mr1697650e87.12.1768462391007; Wed, 14 Jan 2026
 23:33:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aS8YBLEPwF0-NtJO@eldamar.lan> <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de> <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de> <aVfPmZ8rUm3Vf7pT@eldamar.lan>
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de> <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
 <dc4c95e6-d19d-414a-a7ae-401dacbaebfd@ralfj.de>
In-Reply-To: <dc4c95e6-d19d-414a-a7ae-401dacbaebfd@ralfj.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 15 Jan 2026 08:32:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
X-Gm-Features: AZwV_QiNASIHUOqkWA-quujMc5WRU5pvD3mkmZGB7mRSknAOSGs3Ql0x7z_N39s
Message-ID: <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: Ralf Jung <post@ralfj.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1121718@bugs.debian.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Some updates.

- We have delayed removing the nodrop parameter, so the mitigation
will work for some more months.
- Zoom has confirmed that they have managed to repro the issue and
they plan to fit is for version 7.0.0 of their application.

Regards

On Mon, 5 Jan 2026 at 20:27, Ralf Jung <post@ralfj.de> wrote:
>
> Hi Ricardo,
>
> > Now about the error flag. I have given a fast look at your usb trace
> > and have only seen 4 frames with "error bits" [1]. Can you add more
> > tracing?
> > Do something like:
> > rmmod uvcvideo
> > modprobe uvcvideo trace=0xffffffff
> >
> > Then start zoom, trigger the error and share the content of your
> > dmesg. It should contain an explanation of why the driver thinks that
> > the frames are invalid.
>
> I have attached the log from when I started zoom until I closed it. All I can
> see there is "Marking buffer as bad (error bit set)" but I assume all of the
> other things there will mean a lot more to you. :)
>
> Kind regards,
> Ralf



-- 
Ricardo Ribalda
