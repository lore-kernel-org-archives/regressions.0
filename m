Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36A05337D
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716278857; cv=none; b=btKKDVswk4FzpgC3nBV1Ggw+dF53A9CvLIKhoOH3MzCJO7fGYJbNAKUt1YTUeHU9isjG37Ou1l5big9HMyAesZR7zbTfhnpFjBmOgtVYUTXkviIlBzgz6Ai99bHRuRwNHV3/zQZFJJQDC8cq5LKwwwWdQMNhuKluOgKgVudMp1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716278857; c=relaxed/simple;
	bh=hBUirWutusPtAd5yaIQhJwK+OZj1KlZPuozs+O8z/cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEK6ezKTTy0B0CW/LafV5oTKylFvUrMujQfaNshkAyGlkbZpHunuUswzKi838n9UBBAchiW2Mbqw2LfeWAS44XIaZZ9+IFvOgA18Uaeu6UWA+CELX1ulVotuyefNQSfM5AJGn8/LN8IrwCF4P3nqaQf2Wf5p5CGW2/6fVUbzGu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUtj0op2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUtj0op2"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-60585faa69fso2838485a12.1
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716278855; x=1716883655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBUirWutusPtAd5yaIQhJwK+OZj1KlZPuozs+O8z/cw=;
        b=hUtj0op2/+aToK9hP7ljVajnpc1G1ZAdHXh0/lXKK+Q6MqVtO2XuZcLvew+yXOZm+e
         uMBhMjWQXrzO2WfR6ZLwCZdeLerXD9HVmP6WkbX1E2PwFvBXP6pol3PcvKKUAZBEgsBc
         6+OxlCxQpxjefLTnGJY+gqxLpwVjN7b7l0V4ukULNjj8HXJimKUbg3ImM4l8M3TKRyg3
         EVj15AzAaMRKoxwpBgQo0hENvMYLFVBaarzw8gbmInj5pNFSsw4/scEJJWp4RXkyFrmT
         tTQUlVpVTgIVUk/218diGyECXK6aMBG2tzfvaqw1qgRakKhkMepfWk3/7eQJUgWibO9S
         IbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716278855; x=1716883655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBUirWutusPtAd5yaIQhJwK+OZj1KlZPuozs+O8z/cw=;
        b=g8eMRu7tMvTfvE5V494X5JGjPq0A1CdBxdrcJUN+Y/1p1EOqTEMm9u2nzmq8UQRPf0
         /SoFFGdkt8uRWClZYDw21wSYS9QqcZykf6arAZyJv8dgykA2ysA50toTwaBU9Bv4BT7e
         /cKag99LjphjyoQ7NZlYpAL6rPuYAAcXS+XCbPMcZKKI1X/ifJbKS5NsWYYKwEj75rUO
         zuO8yqejFoAKxQIFgP/L/Qg2ejdRquKgJpiBEkP+aOi9T7rH4aAhZoiBD/VIHGCVM4zG
         2CZut6b52Z5R90L9dQniSl+GC3NCTyIeumLxTnyJKD+/SoYCFXIHGnVsqiyK7VhdnOm4
         3zog==
X-Forwarded-Encrypted: i=1; AJvYcCX3vbPATyKFoS6LId2DNskQO2OL5hEG230mD7EWCWr0YEfKqh1KXjTE6zI/Tg5GmtzsIQAzhkd/03rvyHEJC8bZhLKB5JQ4DnWKWL8=
X-Gm-Message-State: AOJu0Yz3JVykRwXv8N2ghHciOU9N6Bq2aT/oNJmZHDYaEQ6Y4/vzIbE5
	BgEnbjSYxlIoJCFqQJ1OL7Gqe3PChXiDCJbPfKbgD9/DB6zZYGX96L2LuLGJNC6SpXujWWu80KC
	984EuD3JVWSrUFTmhr06o+Xe6hj0=
X-Google-Smtp-Source: AGHT+IGmfAeYbPUIkVmO8kZCcRcccTLZauVNvcfzcB7SNd4lIdVN8vxwNDRATuv964jxZEOekKjrWFp08NKB5cRA558=
X-Received: by 2002:a17:90a:4a88:b0:2b2:195a:d7bd with SMTP id
 98e67ed59e1d1-2bd60352ae4mr10916962a91.2.1716278855107; Tue, 21 May 2024
 01:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHe5sWavQcUTg2zTYaryRsMywSBgBgETG=R1jRexg4qDqwCfdw@mail.gmail.com>
 <38de0776-3adf-4223-b8e0-cedb5a5ebf4d@leemhuis.info> <lqdpk7lopqq4jn22mycxgg6ps4yfs7hcca33tqb2oy6jxc2y7p@rhjjbzs6wigu>
 <611f8200-8e0e-40e4-aff4-cc2c55dc6354@amd.com> <CAHe5sWY_YJsyiuwf2TsfRTS9AoGoYh4+UxkkZZ0G9z2pXfbnzg@mail.gmail.com>
 <20240521051525.GL1421138@black.fi.intel.com>
In-Reply-To: <20240521051525.GL1421138@black.fi.intel.com>
From: Gia <giacomo.gio@gmail.com>
Date: Tue, 21 May 2024 10:07:23 +0200
Message-ID: <CAHe5sWY3P7AopLqwaeXSO7n-SFwEZom+MfWpLKGmbuA7L=VdmA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] "xHCI host controller not responding,
 assume dead" on stable kernel > 6.8.7
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Christian Heusel <christian@heusel.eu>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "kernel@micha.zone" <kernel@micha.zone>, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?Q?Benjamin_B=C3=B6hmke?= <benjamin@boehmke.net>, 
	"S, Sanath" <Sanath.S@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Mika,

Here you have the output of sudo journalctl -k without enabling the
kernel option "pcie_aspm=3Doff": https://codeshare.io/7JPgpE. Without
"pcie_aspm=3Doff", "thunderbolt.host_reset=3Dfalse" is not needed, my
thunderbolt dock does work. I also connected a 4k monitor to the
thunderbolt dock thinking it could provide more data.

I'm almost sure I used this option when I set up this system because
it solved some issues with system suspending, but it happened many
months ago.



On Tue, May 21, 2024 at 7:15=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, May 20, 2024 at 05:57:42PM +0200, Gia wrote:
> > Hi Mario,
> >
> > In my case in both cases the value for:
> >
> > $ cat /sys/bus/thunderbolt/devices/domain0/iommu_dma_protection
> >
> > is 0.
> >
> > Output of sudo journalctl -k with kernel option thunderbolt.dyndbg=3D+p=
:
> > https://codeshare.io/qAXLoj
> >
> > Output of sudo dmesg with kernel option thunderbolt.dyndbg=3D+p:
> > https://codeshare.io/zlPgRb
>
> I see you have "pcie_aspm=3Doff" in the kernel command line. That kind of
> affects things. Can you drop that and see if it changes anything? And
> also provide a new full dmesg with "thunderbolt.dyndbg=3D+p" in the
> command line (dropping pcie_aspm_off)?
>
> Also is there any particular reason you have it there?
