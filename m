Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263618E03F
	for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 17:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724433885; cv=none; b=VgMtOCMtr83l64jrkIJlkuCkWGzvL+RaPghxlawNVmE7cWI3Wy3UOdIZi6vh0rcDhMNvpfNw+2XxoSIpjkUmNgGO69velNezt4yJ+uVW+EloHHxYaYvwsua532hzKuYpyDSeOxwURxBxDaO0ofeaVdGxhom/1naGPUsK1n/9JVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724433885; c=relaxed/simple;
	bh=II/l/BYUB8+ym0Bf6l9XPtXLxQdNIdTv3o6q40RMEhw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cdT3RORRPgN4cV2s83BZX7PY8m9x3zu6bt9kJ1qoM/P0y4ZHDtMRYkN9kQaNNB0TNZ4IUPMKKIXCymkxgaPrU+c/BvlK4GAs7EYVHlFydEgHuoMtjQNr5ElQDsfUYOl6i2DK8NNlliRqgkQSSH+PtRmq7Rx1Hg/kcHPXOEIaSrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMYzZ9XG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMYzZ9XG"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-533de5a88f8so1566060e87.3
        for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724433880; x=1725038680; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA90O16jMgd8CWh2MnYobE93W15NHZgeiwtdthdRGp4=;
        b=GMYzZ9XGe5IzgTAyJb6aHk6AXu0u1on4qy5g4HQ/YjSZMaYYTKCLf+CpeQuzMsjuof
         mgzswuipxpjfFsskGuvSXmwwL/hr3RVf/zrcpROdKuqdue4rGHUvuTDa70OWsHtCmWSq
         KV+xvg7ruGY5D5pS4YWNi+smDsYoPA/Fy6GYripCav8elawGAM4s9HDwJUCJIu6w6kNS
         AA/2eHS/JOP2f551p32dNC7twmc/Rgyf+nUvewmAncByM8cM56xUxuODBGW7hP8M2TiQ
         3KlSPwqEiXe8xgkrwKib79NyeLNZC0tyHMnOmUUTbANW/oUncighcRkzGYvFYif3sVKA
         Nf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433880; x=1725038680;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wA90O16jMgd8CWh2MnYobE93W15NHZgeiwtdthdRGp4=;
        b=vsr9+Xyi6ZhHggr6wpECuLdxEiNUFzk31XbFPod0V4/3DJaV0Ihb2uV5eWMEULv5Vl
         dsA5Bpfu0OZkNRZzBuEH7LvL/FrEJKJE2suzUXyo25jrs+6uIKMUyg2U16DAYeCawWov
         1uCulam3dPXNhWsi+mLVrmFC+WyvlhmyFZty4YUR95V4A9ONkyFDTvQnTZcfYDrLKkOG
         WghozpYsYXI/JXR08ZzJhljVbi2P1IDc6GQ0WlRRpLqKqc4iWAvxi5myt3SSgUnVBhbb
         sjRmwpAzcu8K4mwCK5Ky4B+JikrQo/Tjji2VdNHAAA+jdjuAzUi6O9+YO1WX/tGbDtTZ
         1JYA==
X-Forwarded-Encrypted: i=1; AJvYcCV75sFfahnDAIDVhvUOQ4dgw54HFsbDkcED3XuA4pW4HteffTLn5ahfXgFxflqCNIEZmm+6zr1H2a2afw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTt9pjwq5gwDv1aqu5OAHjR4MHWlxdSirzG5f3vrzsHm8RqZa+
	f/NFZ7THWD9iUoUazv603pvvsXIJq9MXyn0PSTeYYvsEpfuuT0kW
X-Google-Smtp-Source: AGHT+IFZHmqXsjrxBKhdu8OBEsZNOg0v/ZZ7Ci9CMduEvA+77wHDailfpz0DSdPAgrJBCpingvQDRw==
X-Received: by 2002:a05:6512:3089:b0:52d:b150:b9b3 with SMTP id 2adb3069b0e04-53438785d61mr1902615e87.32.1724433879707;
        Fri, 23 Aug 2024 10:24:39 -0700 (PDT)
Received: from smtpclient.apple ([188.146.32.62])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea88f82sm600036e87.257.2024.08.23.10.24.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2024 10:24:39 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAKEwX=N-10A=C_Cp_m8yxfeTigvmZp1v7TrphcrHuRkHJ8837g@mail.gmail.com>
Date: Fri, 23 Aug 2024 19:24:27 +0200
Cc: Matthew Wilcox <willy@infradead.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Yosry Ahmed <yosryahmed@google.com>,
 Linux-MM <linux-mm@kvack.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9793DBCA-13F4-4B47-AD57-12A62F7DD8DD@gmail.com>
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info>
 <ZsiLElTykamcYZ6J@casper.infradead.org>
 <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com>
 <CAKEwX=N-10A=C_Cp_m8yxfeTigvmZp1v7TrphcrHuRkHJ8837g@mail.gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51)



> Wiadomo=C5=9B=C4=87 napisana przez Nhat Pham <nphamcs@gmail.com> w =
dniu 23.08.2024, o godz. 18:16:
>=20
> Have you tried with 6.9 yet? IIRC, there are two major changes to
> zswap architecture in recent versions.

No. But now building vanilla 6.9.12. Will install and see=E2=80=A6
(This will take some time as catching issue needs days of compilation)

>=20
> 1. In 6.9, we range-partition zswap's rbtrees to reduce lock =
contention.
>=20
> 2. In 6.10, we replace zswap's rbtrees with xarrays.
>=20
> If 6.9 is fine, then the latter is the suspect, and vice versa. Of
> course, the minor changes are still suspect - but you get the idea :)
>=20
>>=20
>> btw: we can go with elimination strategy.
>> So what i need to change/disable to be closer to finding root cause?
>=20
> Could you let me know more about the setup? A couple things come to my =
mind:
>=20
> 1. zswap configs (allocator - is it zsmalloc? compressor?)

Well - I=E2=80=99m not using zswap.

[root@minimyth2-aarch64-next piotro]# swapon -s
Filename				Type		Size		=
Used		Priority
/dev/nvme0n1p3                          partition	16776188	=
294164		-2

>=20
> 2. Is mTHP enabled? mTHP swapout was merged in 6.10, and there seems

I don=E2=80=99t have used config at the moment, but =
/sys/kernel/mm/transparent_hugepage in I see:

=E2=94=82/hugepages-1024kB
=E2=94=82/hugepages-128kB
=E2=94=82/hugepages-16kB
=E2=94=82/hugepages-2048kB
=E2=94=82/hugepages-256kB
=E2=94=82/hugepages-32kB
=E2=94=82/hugepages-512kB
=E2=94=82/hugepages-64kB


> to be some conflicts with zswap, but Yosry will know more about this
> than me...
>=20
> 3. Is there any proprietary driver etc.?
>=20

Only 2, both ryzen9 monitoring related:
https://github.com/leogx9r/ryzen_smu/commits/master
https://github.com/ocerman/zenpower/commits/master



