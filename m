Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5B535959
	for <regressions@lists.linux.dev>; Tue,  7 Oct 2025 22:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759876240; cv=none; b=GqppJ2N8B099esxbAURGvz44la/p6c+dgJd+dfhcolnbu9nw3rH+GcmDM747D6bpGN/XySXEfoyzAOtlAQcKdpFxQXZPdJ+LE65egELWIVhM8qA9NiMYysat9tjEWHZO43TRr6ScP1AUwvo64HQGZySMnBJ8fcMrld39hgJTju4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759876240; c=relaxed/simple;
	bh=bj4X8gaRzDMPQc3R44ls7nSN6XDjdW4fHZLVjLGLENs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUPNt7TC1F9Ciy6E5SAeTkNZQqskhnUNA9F3V3XRpUNI6CHjNsmEG475SpWrbB8sYgDGpAjW2Gff3VzaoY8Vi1B58vfLPsOztW7y0dnUGLVogGWqQQ4W1pw2gvW86cNGkqLGnNs/GBXnn2/MTHX+yfICFF34bkTpvE+ebreJ8VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPeiZHVe; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPeiZHVe"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8fb58f2b820so4172397241.1
        for <regressions@lists.linux.dev>; Tue, 07 Oct 2025 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759876237; x=1760481037; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj4X8gaRzDMPQc3R44ls7nSN6XDjdW4fHZLVjLGLENs=;
        b=EPeiZHVe67d3KP362WahqeYhC36jYebPSjGDINtv4IoUX7SJFD1PFUEdC0Ln9zM/G5
         qzmyCmESHesUOsSI77zuGGb7uKu6WI4eJlG5b+yvaZgSJxlXB9YTK9p4D1wOjZ1GmQi+
         ONX+bElNRB5+raP0ZUDmwfRI7U4VjOcdUWbG5EKe0Pm4tMTYXb8nPYMBF0Biy4CqK6hm
         LMMqrzn+1qS1AyBnkMDFd0IFwUpVWLpYoMgIJbHEGBq+J6o1/H3LiqcyhgdDFksDYLcn
         JlKDHRzMTELLcWnyCtMaDsTqh6sigfyWbJxQKMoCylN5YxeHRGYLAklOpCecFvfGw+M5
         Ixqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759876237; x=1760481037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bj4X8gaRzDMPQc3R44ls7nSN6XDjdW4fHZLVjLGLENs=;
        b=K7UE9WM3KK12VoSb/JUdfpHtUxvmmZy798ImpD3V6q2FOoto/I8HUhsdvN12ZVuWc3
         7TQmKSklrU72R35yblFK1hHTbtgBghpbx6Z0WGWYcZLhp/utl3nwgrJ9z2Hg+zqM76CE
         Iq5TIpIkU1uy7QQaA8pk2Y1yF3vtCmSVl/bKR2UJ0ytJvwm2VYF5ZCeG9NymBRK3uIeg
         ZXAcPTXnhZK/1ErxY0BdWgazqU0CmkA7Ajz2Ejh4QrVI7xFRJ516Dq97uMIi8mTTD56C
         vmk+VKhqhCnrxJO7nLHI+MarJQTuJFEgdpm6/DrO7Kcma8p+86u9ranDSnn/IbRIffSP
         KVXw==
X-Forwarded-Encrypted: i=1; AJvYcCU5qD+dn47nVUrOux+9Rss/hMLHDZDfAIZahTbFKk18NRpl0ONGroMJcDcubyv3wqD07HX/GUTIksZ5Aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlLhTd0Vqk4Co3URJVus04YnpptlFkFU6CiE/j/3RGrUcuLt0D
	YzkYGnDPMNQ8wPHfLwODCq0+QvFz7BFAG5ORZUfn0g2InrKFO4eqg2bn26dV2MBIjVbbDoAqQFX
	8LeZuJ1PLIKakKRXwSp0kPu1BUuVbxm0=
X-Gm-Gg: ASbGncsoulT564Q7E22CA6usL06wqR3lgBClX2MpH13rVUm1jGo5xBR9sBzupYMDeat
	vw/L8hUV0Xz4g1Yt5RaIIELqoezm4kbFnI9WPtHT76KgkaYhKMbswxxXCATGaA3zR+xdQsk9OQr
	1WfKfoiZWIUOPqfbO69LfFMHv2zPiZJNWlKNg7X2+toZugWhnvuXhiKJbsLUqxHZfICu4Bz/LTA
	EPkh0fAQf4EnPXM2iJbh8tjLBxKUL0=
X-Google-Smtp-Source: AGHT+IGNWhs41vZWOP9iMSxsWEkBKyq8QhSV+L8WXV/JAaG1zxnyWuMVtljMD9GQuLUBjHh5TVhkO2UYAwyEm7f5cfE=
X-Received: by 2002:a05:6102:c8e:b0:5d4:222:9f8a with SMTP id
 ada2fe7eead31-5d5e2322d17mr489450137.19.1759876237624; Tue, 07 Oct 2025
 15:30:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com>
In-Reply-To: <20251007231709.6c16802e.michal.pecio@gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Wed, 8 Oct 2025 00:30:26 +0200
X-Gm-Features: AS18NWBipKlIi_Dy3WcWABdKfWSnOmxZ0TtdmCzEQpBd_-O7SfykRdaXJ-eyaIM
Message-ID: <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gonna try to bisect it, might take a while tho.

Thanks,
Arisa

On Tue, Oct 7, 2025 at 11:17=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Tue, 7 Oct 2025 22:47:52 +0200, Arisa Snowbell wrote:
> > Hello,
> >
> > this is my first time here, so I hope I am doing everything correctly,
> > if not - help would be appreciated.
> >
> > I found regression in the linux-mainline aka linuses branch, more
> > specifically in the recent USB merge (commit
> > c6006b8ca14dcc604567be99fc4863e6e11ab6e3).
> >
> > All my USB-C client -> USB-A host aka computer(probably all USB-A
> > devices but I don't have more to test) - devices are not detected when
> > I boot with this patch, I have to replug the device for it to even
> > show up in dmesg logs.
> > One device is mice and another one is audio DAC that also shows up as
> > hub in the dmesg normally.
> >
> > I reverted the USB merge and everything is fine again.
>
> Hi,
>
> Can you bisect the merged USB development branch?
>
> It looks like 8f5ae30d69d7 (v6.17-rc1) is likely good
> and e40b984b6c4c is the merged commit, should be bad.
>
> Regards,
> Michal
