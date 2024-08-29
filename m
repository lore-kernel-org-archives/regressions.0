Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC201B3F1C
	for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 15:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946666; cv=none; b=c+BVUj6gsBBUPgem5zE2Uj3IKCORtQvsTEtQ0zgR4FPquJSvhXvjXrVJpRFkOKPKSOX2EZRa5aAicIagGDXFqDnWLEjRhtEoAChKA1SsNQ6HVbnEZwB5Mvmhc/qel0hCAak1uJRB6gjwh0/CIKpn8ylrPiwSl/JuDpPBzn6PeqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946666; c=relaxed/simple;
	bh=zvAY9Ccukr+/HE07/0WO1dFQLdJcPTCRcUNXQG5PwWI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=j2KXGoZkWE2bJkN1Ijz9aGgmTv9FA9tmFfghlNjIvjh8cIdOqKlkhPpbjFDHoTRckDo8tYyPQQzuhrq8JtVi6RC93yrYtGPh1HFQO4ew6vI/+fJc29grmpeMeuuKhyvH+CEmgSu005lzu0M4EmlxWrL21BzokzOEFvEHqHariac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRHQxuNe; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRHQxuNe"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso9493591fa.2
        for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724946662; x=1725551462; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvAY9Ccukr+/HE07/0WO1dFQLdJcPTCRcUNXQG5PwWI=;
        b=SRHQxuNeJAexrhNNCZ8UvaHdOOtRX+Jv1MsvW7i1jYbmGVAxOKijrXMSQ9y75GU7eU
         uTLD/8pTMJzDb5hcBxqB2Vri0AI9LU8yWDJJcmpp5cA3LyIsO6qNd44oRwd70DQJcfH/
         GabJjXB8DQa/cftJT6Iq9ahWzGdQOKdVFGGzxR1V4I0tCIVCcr5Hb5hkrSii8BCMKbPM
         c3ytLR9ScLW1+7vEg7/hG3IyBAwXBWm5vCDWT0jL0jRZqbkRHfG7ULQ3tifzx7SpScRG
         JpBpl8Ezdz44jfD0fnsi1+f5bqRfrksjyByX8/pWJCAe/zudwHydR25LHZZnK3RLuW68
         7PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946662; x=1725551462;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvAY9Ccukr+/HE07/0WO1dFQLdJcPTCRcUNXQG5PwWI=;
        b=i7kQ+1RXyRj4obYYwTZDd5yuyhk8OAfRwhgh8oqkPySMtYBVK7I+lDbPrlE9Try2Ip
         lcGKuq7VeH4Z3FWzVQ14h583QId69KBh8yDNyUhDzjYfuCw5ncljSlEtIcp7fxnxjnJM
         nRAva+vFBq9yiCQYXeB1cy9rjJk18CHGkdTBvxWhD8Blfvs6/yoHFTs6hh+qZu1Tuoos
         k7D71dQ4/rjVu32k7IZ+uMQPSV7V1KGfvMXhYJolx0Rm8ph0sdmUutxkfPdlinFTucV9
         YmUMsJtZKd7VLc5oTM0ZS8YR3xl6QUo7S9LPwDLQduGU8Zj0Cmp+884ceuFfa8JJ6e2A
         uBLg==
X-Forwarded-Encrypted: i=1; AJvYcCVXDdARZWq0eL2LgL+8RvpD+ht7fLcbraLqVLUyOIiyaopiJ/8rXchudy/Mxi/ETvpx2IMzA8ZMCRgJOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPi3AuErTaI8NKFOr8YpBfb5zRSf1BzrbNuVlpf5brtgfhhwb3
	mzJFhZRx6B3omboVWRHtClLvr92RC1WqXylUKHUhJcQWNXdh1ueM
X-Google-Smtp-Source: AGHT+IFha5XsOkvb/Z9HPThCNhx9ub0dAJ1+WGMf83pfULX4kvSBKgNFy4SELU2Yh91wH2n+OKqXyw==
X-Received: by 2002:a05:651c:210d:b0:2ef:29cd:3191 with SMTP id 38308e7fff4ca-2f6108934b4mr25104131fa.35.1724946661825;
        Thu, 29 Aug 2024 08:51:01 -0700 (PDT)
Received: from smtpclient.apple (89-73-96-21.dynamic.chello.pl. [89.73.96.21])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f61518225bsm1970721fa.107.2024.08.29.08.51.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2024 08:51:01 -0700 (PDT)
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
In-Reply-To: <CAJD7tkbF2Cx4uRCJAN=EKDLkVC=CApiLAsYt4ZN9YcVUJZp_5g@mail.gmail.com>
Date: Thu, 29 Aug 2024 17:50:50 +0200
Cc: Pedro Falcato <pedro.falcato@gmail.com>,
 Nhat Pham <nphamcs@gmail.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Linux-MM <linux-mm@kvack.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EE83D424-A546-410D-B5ED-6E9631746ACF@gmail.com>
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info>
 <ZsiLElTykamcYZ6J@casper.infradead.org>
 <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com>
 <CAKEwX=N-10A=C_Cp_m8yxfeTigvmZp1v7TrphcrHuRkHJ8837g@mail.gmail.com>
 <A512FD59-63DF-48D3-BCB3-83DF8505E7E0@gmail.com>
 <oophwj3aj2fnfi57ebzjuc536iltilmcpoucyms6nfk2alwvtr@pdj4cn4rvpdn>
 <3D1B8F1F-2C41-4CCD-A5D7-41CF412F99DE@gmail.com>
 <CAJD7tkbF2Cx4uRCJAN=EKDLkVC=CApiLAsYt4ZN9YcVUJZp_5g@mail.gmail.com>
To: Yosry Ahmed <yosryahmed@google.com>
X-Mailer: Apple Mail (2.3776.700.51)



> Wiadomo=C5=9B=C4=87 napisana przez Yosry Ahmed <yosryahmed@google.com> =
w dniu 27.08.2024, o godz. 20:48:
>=20
> On Sun, Aug 25, 2024 at 9:24=E2=80=AFAM Piotr Oniszczuk
> <piotr.oniszczuk@gmail.com> wrote:
>>=20
>>=20
>>=20
>>> Wiadomo=C5=9B=C4=87 napisana przez Pedro Falcato =
<pedro.falcato@gmail.com> w dniu 25.08.2024, o godz. 17:05:
>>>=20
>>> Also, could you try a memtest86 on your machine, to shake out =
potential hardware problems?
>>=20
>>=20
>> I found less time consuming way to trigger issue: 12c24t cross =
compile of llvm with =E2=80=9Eonly 16G=E2=80=9D of ram - as this =
triggers many heavy swappings (top swap usage gets 8-9G out of 16G swap =
part)
>>=20
>> With such setup - on 6.9.12 - i=E2=80=99m getting not available =
system (due cpu soft lockup) just in 1..3h
>> (usually first or second compile iteration; i wrote simple scrip =
compiling in loop + counting interations)
>=20
> Are we sure that the soft lockup problem is related to the originally
> reported problem? It seems like in v6.10 you hit a BUG in zswap
> (corruption?), and in v6.9 you hit a soft lockup with a zswap lock
> showing up in the splat. Not sure how they are relevant.

If so then i=E2=80=99m interpreting this as:

a\ 2 different bugs=20

or=20

b\ 6.10 issue is result of 6.9 bug

In such case i think we may:

1. fix 6.9 first (=3Dget it stable for let say 30h continuous compil.)
2. apply fix to 6.10 then test stability on 6.10=20

>=20
> Is the soft lockup reproducible in v6.10 as well?
>=20
> Since you have a narrow window (6.8.2 to 6.9) and a reproducer for the
> soft lockup problem, can you try bisecting?
>=20
> Thanks!



May you pls help me with reducing amount of work here?=20

1. by narrowing # of bisect iternations?
On my side each iteration is like
-build arch pkg
-install on builder
-compile till first hang (2..3h probably for bad) or 20h (for good)
this means days and i=E2=80=99m a bit short with time as all this is my =
hobby (so competes with all rest of my life...)

or

2. Ideally will be to have list of revert 6.9 commit candidates =
(starting from most probable falling commit)
i=E2=80=99ll revert and test

i=E2=80=99ll really appreciate help here=E2=80=A6.

