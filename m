Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FE7281368
	for <regressions@lists.linux.dev>; Tue, 16 Dec 2025 01:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849381; cv=none; b=OdQhUV+0UtwF8lhqxOUJrkE8eO59WnIOSe/gq4P6zqjZh2YrlRZyT0nRV2pzXv8V8AMS4jqLTVsdXN3dO3e1JFlhVXScByuEgKYtY46nhI0wrzY/FKPF7vNfNUUr8K/T5JsZ44xe1GZ4LozAjnF0tyqMJJ/k9strICB0YKVSkqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849381; c=relaxed/simple;
	bh=ZyiAfBS1SHi1ogYvB6RKd2TbkiFPHcyLTNoNsrXdb6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCdColczH7ASep25P4ceqB3H/SRCzGcZGmWJT5aph3x0WEjr6XwMryTWoBuNEM0dntWuwDLk9LIBnBAL+3N3k4N4H7TwphLRddpfCla+oax2TjvUa5vE/UIFlmzI7aWNySAHy5xwmcaADCCHd+U43YrihcMj14rkfggHZU7AMkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcuRE69F; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcuRE69F"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso17683415e9.0
        for <regressions@lists.linux.dev>; Mon, 15 Dec 2025 17:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765849377; x=1766454177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyiAfBS1SHi1ogYvB6RKd2TbkiFPHcyLTNoNsrXdb6o=;
        b=BcuRE69FuqWH6If/F9W3FW6XyhpPpWhanIqHtvP3jZdEi8GRoS7cBSK/qGw4nJiaaM
         EC7pUj7YC8btFpjlriAMqg03f2nl2ZZKASfwoaFTApCPurjSN4Mor0MAQNjWd5cTDABW
         d3ZUjqgGIxaRN1ItgkwZioBB+nVjQk2Hv+sohhyWB2EQvsQZf+hp2i4vwxZrX/TsWb/I
         cjGmrnCW2o8P5afuc7olfQNjIOxeXpWqZ/qlbHXtsGL0PyAsttOO/HgNdE/VXIiOVEev
         aGnWGjwdVEPFbCkyee5CDp1E/g8wryeQp2HyuwpxuMjPci1/jwzF9HDjddg+gFUjJuzk
         zNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765849377; x=1766454177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZyiAfBS1SHi1ogYvB6RKd2TbkiFPHcyLTNoNsrXdb6o=;
        b=MK1rIv9VQwN+UfXR4Vs54kyBFSPR5EytKYToX5U7cwUv0aZ6xrxGoYRZW3oL40Neac
         70AmBcLHK/Fht1VbBmcEf4p7voE1r4uwtnFbRykQeLtlPF4xdFFohF5WWIaMdo8q5BjH
         GS40cJyitgWtGOUfjoXJcxoBTP6gX34tgNVJo2G70PYhVisMeODRBIVtBUuwRdJQPJzk
         82Snafu+UwanO5KbeL1W9H5a+ikNyptAAAwvQqGfNJD6a3me1C4IuYu0zmUgMT+v/H0E
         y8hNcxoe5XJoRWF1rQ/6K8uxuhktFn3vDDoOwm/JtJwYWLImPkYaCeuj0/6CsrLf1BHn
         WW4w==
X-Forwarded-Encrypted: i=1; AJvYcCV5V3x7IrDyzJndPV5Mkl63sTw37rcYzwmNyaMKQj/WvCca9f6knsHoMkNJced4Ddm/zoWM/fj5Pm/uBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdHx2I4C11Ks943LXKJOMo9XFWIxY2Tk5Lpg18QYNXOHnHW/Vb
	cV9qPbH2WSTtZSnyPxmlR3sIk3tyrW51AC7UIhbMr+rXPLBhp+72QBjUkTEYiiZK0WhmwLQmJ9d
	G3gIH76QcyxsHTSRlpyPNdBu/e8xLIrQ=
X-Gm-Gg: AY/fxX7vpZs2llNaybtiUbX/RYHbExRjFrgSjUNwt9umGFoEMF17JgNAG4wuS5BxuI7
	9k/isx6q5HcJO5wd4uF8/iyCpZXJEojftDiyVk7tLdZNlwm22EuUyU0X7owouGkAJGvq9dtLibG
	q48nvPhmm6J7SzHB06y4+JzpUlPv3sGvvZ5sH8tUd3K1UD/1I/8B4tUHsam1DY3fixng/X2GQH1
	Nlo1qULeX5HLzuaZvNeleA74H/bjpv853rZNDMpwJagTWcTe1qaH4NjP+S4VDO5GU80wPdVdIPu
	c8sR6qcuMTvapGVoMUDUNjAlmPDY
X-Google-Smtp-Source: AGHT+IHXZEfg1p3HRgI0++xedDQyyt6TVJAX8tLf80JYu34CJbWOG8x06pVXb0fDbpBBSUhZfKL0ivJQkRM5N2F1zdU=
X-Received: by 2002:a05:6000:381:b0:430:f3bd:720a with SMTP id
 ffacd0b85a97d-430f3bd763amr10307348f8f.27.1765849377540; Mon, 15 Dec 2025
 17:42:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <176584314280.2550.10885082269394184097@77bfb67944a2>
 <20251216122514.7ee70d5f@canb.auug.org.au> <3cd2c37e-458f-409c-86e9-cd3c636fb071@linux.dev>
 <CAADnVQKB1Ubr8ntTAb0Q6D1ek+2tLk1yJucLOXouaF_vMqP3GA@mail.gmail.com>
In-Reply-To: <CAADnVQKB1Ubr8ntTAb0Q6D1ek+2tLk1yJucLOXouaF_vMqP3GA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 15 Dec 2025 17:42:45 -0800
X-Gm-Features: AQt7F2qZ64Mmn0-BWatGXdXbAgAM-TAJMN_WlLu09kQhu9Y_Np5ib-yXqYgCTp8
Message-ID: <CAADnVQLE1R=DDjj88u+xuws8+JLKo6J2HiLj=jpO8MLpbp98SA@mail.gmail.com>
Subject: Re: [REGRESSION] next/pending-fixes: (build) error: unknown warning
 option '-Wno-suggest-attribute=format'; did...
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, KernelCI bot <bot@kernelci.org>, 
	kernelci@lists.linux.dev, kernelci-results@groups.io, 
	Linux Regressions <regressions@lists.linux.dev>, gus@collabora.com, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 5:37=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
>
> I removed the offending patch from bpf tree.

All,

heads up. gmail doesn't like me :(
I see Steven's and Ihor's replies in lore, but nothing in my mailbox.

And Steven's reply was a couple hours ago.
Nothing in my spam either, and I was cc-ed directly!
So it's not mailing list delivery throttling.
Ouch.

If it looks like I'm ignoring your emails, it's not me. It's gmail fault.
