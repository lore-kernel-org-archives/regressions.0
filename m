Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4FA219FD
	for <regressions@lists.linux.dev>; Mon, 20 May 2024 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716196788; cv=none; b=li2xbdkPxyoO84upa6/kjTLB8hJ9sQqRuWd11pLwkhKpsTjGC4sk+njKQr+CyZatcwU3cSdC5Frp1pxx6Y/WkvDTRAkEVR003Bjrn2iVMJdsYwzs1zts7I+9qARKeBJF8unQl6B1Lo6FaYyhhlhhio2tV/t8oPuulou1nN7fyTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716196788; c=relaxed/simple;
	bh=WNf6P72bcYi1f7Q/YxEur95rQekBz1J8C+FdIR6DQV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4eT+NO3IG0TE5S3bp70Q0vFk3coo275igz+z7GFmMYRbywtOZlUDbQNfKuF6068n+aOr9C0Pp5eykQ4sGjgLXx2yLuAR8jZZNPvXnPg0DsNrBJMQQfpBUuZ0z10cnUmKNmWo39RCNWwrjKCiLwTNbqk3CxTvJIGPZXwW1i8ftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxEAcEap; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxEAcEap"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f05b669b6cso65822075ad.3
        for <regressions@lists.linux.dev>; Mon, 20 May 2024 02:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716196786; x=1716801586; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNf6P72bcYi1f7Q/YxEur95rQekBz1J8C+FdIR6DQV4=;
        b=GxEAcEapz0/UZSQFlNSSX5WRaQTo1kCoTdf6q+LBDGi9zehIOv5Qga4EtuAvODT9it
         uVD3wUagXOA3rFOsJJoz2J8QbAiZEMB6dq7nRXfUu22tpMjWwMPnkNNDpmhQ5rYhk3Ol
         buXFU9FMHL64928ZSK8pXJDaOTef707bxIl0YT3Wn3j1wNnWIYFIf3SrQr8IlU0e42eG
         juzZ+jk07wZrBaS3fpCpqgiVws+4+wdFqLvst8J2mLn6hVrrOexMp5NvVr5JE5dBuzx3
         kJi4LGinsslbpXQV2Ekm+BpZ+HdxhhpK617Ipcn3xGoGoaYr/7+XBrUa0yJXWNzCJC5R
         F71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716196786; x=1716801586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNf6P72bcYi1f7Q/YxEur95rQekBz1J8C+FdIR6DQV4=;
        b=w3JsvCEPVP6XS9aAkjAbgeQT7caRPjK/rOFc+/T/BYIuZkyW/5ZId+trQN9LXEBa5u
         INuGF/kkTnC8JvsGSiJ+q0xLhEz1VjaCbjm/YjO1i+Qbm780YNoDhobwL+5V82PM/m73
         e+9fEIEW0aGfPdHLnxXGUSZfWA/TELvsqcAim4F/5DIY+4zPhtIdwtEaZuTAMmw4SgQj
         pR+GFHbGwLoOBirhtu9MB6V3Uap+T9eEeIDlBlPOOCFu9BI5maNXAdCIhWY/WAbwjGU6
         fpBT7wj1NvCnEkGBZ7KisyCjPrvgbY0FV4IWEPAA2cmqZeKNjjWUKEqx1mNAWENUQQvg
         H6jg==
X-Gm-Message-State: AOJu0Yy8DsJa085WP/doGTB5z5upab3WaFXiW3LVWgU0f8BvUyOLlFXr
	0rQmoOiWNj/c6ku9gS0e+nF5SO8lEoYf7aVAKmktaGGO2dUKnQqlEoxdEveP4Ylu0xSPeJXvvMI
	9B3Jh2T1eP5eHD1bx3Eha+qRS+iNgfrOOWj4=
X-Google-Smtp-Source: AGHT+IHA5ALO4rDjGdGMuE0iLP0CBzKlLf/Vl3GUmnak99XjEEyqobY19GgnDDHEooirsYv6X0jKdzTSMgl0uYQLXNY=
X-Received: by 2002:a17:90a:a083:b0:2b6:24cf:5c32 with SMTP id
 98e67ed59e1d1-2b6cd0e7f04mr21993872a91.49.1716196785903; Mon, 20 May 2024
 02:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHe5sWavQcUTg2zTYaryRsMywSBgBgETG=R1jRexg4qDqwCfdw@mail.gmail.com>
 <38de0776-3adf-4223-b8e0-cedb5a5ebf4d@leemhuis.info>
In-Reply-To: <38de0776-3adf-4223-b8e0-cedb5a5ebf4d@leemhuis.info>
From: Gia <giacomo.gio@gmail.com>
Date: Mon, 20 May 2024 11:19:34 +0200
Message-ID: <CAHe5sWYnbJAjGp66Q4H0W_yk9uYTcERmW=sPvJSWTsqbFZFCVg@mail.gmail.com>
Subject: Re: [REGRESSION] Thunderbolt Host Reset Change Causes eGPU
 Disconnection from 6.8.7=>6.8.8
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-kernel@vger.kernel.org, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, kernel@micha.zone, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

I'll try to provide a kernel log ASAP, it's not that easy because when
I run into this issue my keyboard isn't working. The kernel parameter
that Mario suggested, thunderbolt.host_reset=3Dfalse, fixes the issue!

I can add that without the suggested kernel parameter the issue
persists with the latest Archlinux kernel 6.9.1.

I also found another report of the issue on Archlinux forum:
https://bbs.archlinux.org/viewtopic.php?id=3D295824


On Mon, May 6, 2024 at 2:53=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing Mario, who asked for the two suspected commits to be backported]
>
> On 06.05.24 14:24, Gia wrote:
> > Hello, from 6.8.7=3D>6.8.8 I run into a similar problem with my Caldigi=
t
> > TS3 Plus Thunderbolt 3 dock.
> >
> > After the update I see this message on boot "xHCI host controller not
> > responding, assume dead" and the dock is not working anymore. Kernel
> > 6.8.7 works great.
>
> Thx for the report. Could you make the kernel log (journalctl -k/dmesg)
> accessible somewhere?
>
> And have you looked into the other stuff that Mario suggested in the
> other thread? See the following mail and the reply to it for details:
>
> https://lore.kernel.org/all/1eb96465-0a81-4187-b8e7-607d85617d5f@gmail.co=
m/T/#u
>
> Ciao, Thorsten
>
> P.S.: To be sure the issue doesn't fall through the cracks unnoticed,
> I'm adding it to regzbot, the Linux kernel regression tracking bot:
>
> #regzbot ^introduced v6.8.7..v6.8.8
> #regzbot title thunderbolt: TB3 dock problems, xHCI host controller not
> responding, assume dead
