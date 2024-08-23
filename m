Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00191192585
	for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425634; cv=none; b=pUdbMVBbqBPlY7JRE9qIoS8BN5hcda5iluw0K5/YR0rYYxSG0ESqqspXuJeeZP0+SWqkA4S9B2WHcgv+WHccqzS0DT2bwtMHy9O5k2ok3a5vwcnm1Nvs8sCRPmypSW7teET9fGrtS9BXRw5PpBy517q/EkFFx6JY7D47izPdhdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425634; c=relaxed/simple;
	bh=Trk7kRqz9cwbWgyymtr7L+zIg0BtyDTU0ddlg39/M8Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LmtYWNjzuRbI3dxpgI+0h5QgC2bg8NDLgv0CamVOl/NIh1DOhIzKXTSUjwo7FTNIqDlHw5dYEaHjWkDYktqMRnbLZUkHXepi1TuOPGmZhY0CjxaZ5eeTyJqvq+QAbvqMiocnXrH81eOuZfbn+Fb0QZ9KuEip38lmcfbjokOkXsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8NuscBU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8NuscBU"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a86910caf9cso333536766b.1
        for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724425631; x=1725030431; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN/u/MQcY1xAjLL8Hjod4ME8opqYEyKjoXDkSbZQ89U=;
        b=S8NuscBUu+UfdQikR0xxOMPiAFK9WdvxHAtD/ea5YTVNvdme/PkMDT55Z+Rm9o11NO
         CGM8nn3Qylw0cEo5txFGWsJh+87bSz6tjW4o89G8UecWToBWyCGW0zesMn1BaY5kSJvK
         VGnTLkRnAuTtqeHUNRNXZ4m6MYzJidcHuxNLTHLUDaw2Unol9DUzU4Xq5NlkkIly+tN4
         SvAHQExQjLmza+QI1jjRXGYWAWtWzo+7sTzwRQq1QZbBdGNC9RoH5f21zmO7IZwlrZwY
         zue0EJ+lPXVqHB/hQ7Cd07G7P7TSE72BnLDFNt0fg0tDE1H/VmF9sgIZR93BXnLIuBDN
         m4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724425631; x=1725030431;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hN/u/MQcY1xAjLL8Hjod4ME8opqYEyKjoXDkSbZQ89U=;
        b=b0oQMv7kBQGsP2xow2gwaFZ5xwshIqxKRBUaV4XO9Scq24anbRLmXJJujHiIXSd9yn
         6r1EcfGB1+RvGvtHD2wDnCz44/KvGkKkwAFf/Dexxvu8VmvXQH6C1B53MJDfpXOrj/SP
         0fRvVq1kNgz8CeYqFe1HipROfjN7leT4VYVxbQDr2bFWCgKdjSdNkcfAEyYJg5ayZ++v
         MyT1j+knMGc1w3jdVj/xrQMmC3nXNxoDGZ2ykVw23b0tWxaJoQKlA+KZ+pDjEuBks8/c
         nLdUBFbNyTgtVsWVIsFr8204dtsZ0IHWuShTT7iDCG3w6Ugk/PTZJcp8D5WTVqdOVpg9
         wLwQ==
X-Gm-Message-State: AOJu0Yw5O5uKna/VR01vt+Wsj2JQfGoCLXxHOGOsbzq8xl4uYAbVJtSd
	vkFH5M/F6FJsXsNK+S6FcZWuJ0bLMRnqUX95Dwv7kX5Bsu2QlZvT
X-Google-Smtp-Source: AGHT+IFyl+aF9R5RuSf+qHazg+rk9eimRMeCf57k838qIezH0l6uUevQOGnLjaOijBOPiJBcMEhZXQ==
X-Received: by 2002:a17:907:724a:b0:a86:94cd:97f0 with SMTP id a640c23a62f3a-a86a2fae4f0mr277662266b.19.1724425631009;
        Fri, 23 Aug 2024 08:07:11 -0700 (PDT)
Received: from smtpclient.apple (89-73-96-21.dynamic.chello.pl. [89.73.96.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2e48e2sm269559166b.89.2024.08.23.08.07.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2024 08:07:10 -0700 (PDT)
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
In-Reply-To: <ZsiLElTykamcYZ6J@casper.infradead.org>
Date: Fri, 23 Aug 2024 17:06:58 +0200
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Yosry Ahmed <yosryahmed@google.com>,
 Nhat Pham <nphamcs@gmail.com>,
 Linux-MM <linux-mm@kvack.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com>
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info>
 <ZsiLElTykamcYZ6J@casper.infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Mailer: Apple Mail (2.3776.700.51)



> Wiadomo=C5=9B=C4=87 napisana przez Matthew Wilcox =
<willy@infradead.org> w dniu 23.08.2024, o godz. 15:13:
>=20
> I wouldn't be surprised if this were dodgy ram.


Well - that was my initial hypothesis.

in fact i had few of them. Ranked (and ordered) like this:
1. downstream kernel patches
2. hw (ram) issue
3. kernel bug

So full history was:
-build myself archlinux 6.10.2 kernel; upgrade builder OS (only kernel; =
nothing else)
-run normal devel process and (to my surprise) discover interrupted =
CI/CD builds by kernel oops
-downgrade to 6.8.2 and done 4 full builds (full takes 8..9h of constant =
12c/24/t compile). all good. =20
-prepare vanilla 6.10.6 (to exclude potential downstream (ArchLinux) =
root causes)
-run normal devel process and still discover oops
-make sure hw is ok by week of test with 6.8.2 (recompiling for 3 =
architectures on 4 OS (3 in kvm). This was almost 5 full days of 12c/24 =
compiling. All good
-because last steep was all good - decide to go to you :-)

sure - this is possible that 6.8.2 had luck with my ram and 6.10.6 had =
no luck=E2=80=A6.but i personally don=E2=80=99t believe this is a =
case=E2=80=A6.    =20

btw: we can go with elimination strategy.
So what i need to change/disable to be closer to finding root cause?
swap?
now it is swapfile on system nvme

