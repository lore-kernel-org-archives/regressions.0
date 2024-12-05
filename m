Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E71D61BC;
	Thu,  5 Dec 2024 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394960; cv=none; b=M1ChUJQ06AYBBN2a8bE0tM2BcPIp0Jbx69gZFtzKSdHQRR2ltvDtp6ELJT/0CLXXht39MQdRRn3b38jlmYFxMTnrnHc2+XvjL2l55SdaPh+YATq5Vy4Kq1tzi84nG1Okc6PQ97ixXIGKi3F9KfE3MIaB4SSzna25ITF07u0x2Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394960; c=relaxed/simple;
	bh=7IXKdskA+LLIPp8jR5IiT8OqfYI64uIJlxwsBYx/fLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QT7FPK21TW+fXB0quP6qkFC5uf8/cQWHCA82KxgQy4y90yEXlTIfFue3PtINW9KCqG5XjccxdDzsIiYQvY2IUSUEWvezSEO4JnSOZ3NIE4euSZYN2cgASMCtpVarontMBczJpK2uOzJSUW2GC/TT3VNpcNlqTxc6Xd1hSX/tkq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+91KHrp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+91KHrp"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso8614351fa.0;
        Thu, 05 Dec 2024 02:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733394955; x=1733999755; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGBlXjWXX6UA1pnUb6eFZF67zXS/U/rRQY47JDY/d7M=;
        b=V+91KHrpeV3GVqdd4n4YjBv6HgcE2MK8D4y3TzZgU2qVZHkm8pDgu2LCJDsVqicAsZ
         2syJpZoX9G/7oGM64ZOquVgwr1uSJy2k8WrT0vA/BRwoGK0tCmjIQx7y+XucOYDdSj/T
         iB7p4TDVwzi7X0ihLnNch5ptId/KeAbVPiAmCGVSpUL2VmZB+/R3Zg7e7ekAMNrewzyB
         qiGBtwTI/+vmo6uoHyncOMPd30j3KVFsZ4D1qvR74HLrF0bW60DaayPrBT3Sp3lXpCem
         AiDXwGCzrMTuU5ytA5XGHqPFyYkirUoy/kILOO+U7E8cpoYYniEe2eTNr+e3l884z2t9
         wWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733394955; x=1733999755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGBlXjWXX6UA1pnUb6eFZF67zXS/U/rRQY47JDY/d7M=;
        b=CfpbbsCL8y7KLPetda5nXkMhW07o7zZafu/LS6Gk46OJ+WhxOtj9h/NvbXY5WjOrw2
         /LiXGc4+fNTTJf+VqaE9mXliL+t4kJrHZlIlgWCWeKqsnuU6aQmw52u+k+ZV4YcRcrXB
         w76Ayj2CXAsg37OqobvkcT896lM3nnAVDzvgE4Mj07zrmNiwzxQn24R6J0MhhlraOn8A
         /6mldrG7/fl0+FmUPGnegH4l97r44z6zxWuZf3YTtGn1qFN7D6yFlXIVgmFrhVnsLS5a
         /7d4fr4mMNEf/j+XJsSwZ/IvGGPLKgnpWFyx2Og3viUPnePZcmv8LZO27ttV2+APNSnZ
         YxuA==
X-Forwarded-Encrypted: i=1; AJvYcCUDQZL8Nyjw3BgAmWBlJk67gTnv79U/V0jGGrYvwCa/bqkeRbhQx1OkSvzZnzfgZ/cKYNHGcBNwWDz/yGEfOzE=@lists.linux.dev, AJvYcCWLpczzmvKGHjvLNdef+dHSZ1CzTaDehmu5JJohT95SxGthqlNTPlpdB2G8y7x9MAeWxSkgJ13+Jqw7SM4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxEAjEvlkE1s+KJJ2RTWBAaQ+t+7z2aUxifh53+mH7gzjY3AYQ
	oKsNw27BEMj50ych9UFs1iyYCHB91QRjRIfNjDUbu57Pbjb73Z+xRXPFGcboSQSW4X281gBLS1Y
	AzslSaioTYKmc9pDDgGRvNaGMTmk=
X-Gm-Gg: ASbGncvozMwxi3rxMxw+PwxctIN33VWHN+dCJjEpjrtGVPp/I2k0XJb6Y9GK21Hn868
	15A8/1wel5CVQP5j9LL0hIsHiBXErakE=
X-Google-Smtp-Source: AGHT+IF9hnQNVk6ZpYzIQHDzAkhYHiH62b9JV3oF6rG0cJLloFhfMCIv2naxMshN7F04Gzkb9fWAIsCQyME/4ARi2mw=
X-Received: by 2002:a2e:a554:0:b0:2ff:c99f:dcea with SMTP id
 38308e7fff4ca-30009caa60bmr70105361fa.34.1733394955215; Thu, 05 Dec 2024
 02:35:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241115171712.427535-1-laura.nao@collabora.com>
 <20241204155305.444280-1-laura.nao@collabora.com> <Z1GBXHM1M4-Ws9Br@krava>
In-Reply-To: <Z1GBXHM1M4-Ws9Br@krava>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 5 Dec 2024 11:35:43 +0100
Message-ID: <CAFULd4YMoOmKUb+_rqdMv=Nu=8UNSdxe9EtN+R4kHB4Ag7cGpA@mail.gmail.com>
Subject: Re: [REGRESSION] module BTF validation failure (Error -22) on next
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>, alan.maguire@oracle.com, bpf@vger.kernel.org, 
	chrome-platform@lists.linux.dev, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 11:33=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Wed, Dec 04, 2024 at 04:53:05PM +0100, Laura Nao wrote:
> > On 11/15/24 18:17, Laura Nao wrote:
> > > I managed to reproduce the issue locally and I've uploaded the vmlinu=
x[1]
> > > (stripped of DWARF data) and vmlinux.raw[2] files, as well as one of =
the
> > > modules[3] and its btf data[4] extracted with:
> > >
> > > bpftool -B vmlinux btf dump file cros_kbd_led_backlight.ko > cros_kbd=
_led_backlight.ko.raw
> > >
> > > Looking again at the logs[5], I've noticed the following is reported:
> > >
> > > [    0.415885] BPF:          type_id=3D115803 offset=3D177920 size=3D=
1152
> > > [    0.416029] BPF:
> > > [    0.416083] BPF: Invalid offset
> > > [    0.416165] BPF:
> > >
> > > There are two different definitions of rcu_data in '.data..percpu', o=
ne
> > > is a struct and the other is an integer:
> > >
> > > type_id=3D115801 offset=3D177920 size=3D1152 (VAR 'rcu_data')
> > > type_id=3D115803 offset=3D177920 size=3D1152 (VAR 'rcu_data')
> > >
> > > [115801] VAR 'rcu_data' type_id=3D115572, linkage=3Dstatic
> > > [115803] VAR 'rcu_data' type_id=3D1, linkage=3Dstatic
> > >
> > > [115572] STRUCT 'rcu_data' size=3D1152 vlen=3D69
> > > [1] INT 'long unsigned int' size=3D8 bits_offset=3D0 nr_bits=3D64 enc=
oding=3D(none)
> > >
> > > I assume that's not expected, correct?
> > >
> > > I'll dig a bit deeper and report back if I can find anything else.
> >
> > I ran a bisection, and it appears the culprit commit is:
> > https://lore.kernel.org/all/20241021080856.48746-2-ubizjak@gmail.com/
>
> which tree are you using, I can't see this in linu-next ?

The offending commit is now part of linus tree:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D001217defda86d0d6a5a9e6cf77a6b813857e7e3

Uros.
