Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9557E
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 06:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNLCszrG"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5c1acc1fa98so429708a12.0
        for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 22:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700028812; x=1700633612; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIPV+gDq2yOCjdPc3jrCxYdVWVXe1Hxr5GLMCAXMCvI=;
        b=MNLCszrGKhmU8fKJrF5hx9rFxbyD/5jbQxYgJnBjxpPFyhH8KN/8qyU+UBl5fpGITJ
         K6M/KjfpEylMCamOSNWZFv54v5LxH0XlULwI/CrhV37VHRFpT3CUmTzR8ipSbdTyFX02
         DochPTO5T6ijj9Q5qt5BRMalgWuK+glm1CEatBjVYwoUpy9k/O2hOiw2ENJzCrOJir4e
         koPY/Bt5P9SSx7R60xMczLpm9YxuEeWBrdxpKM8E8kHf14oucQhtu7yPudCHyER0/uqd
         BpGpfUl6mldbJb3eNDZsZqcUqq734cVTgPlnE2QLwcNgAmNrKDZDbPnaVV/QnZaQ9b6f
         vZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700028812; x=1700633612;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIPV+gDq2yOCjdPc3jrCxYdVWVXe1Hxr5GLMCAXMCvI=;
        b=G4S/VOrBuZETS4P2o6IyUFHct615BrwHPhlDoG/OgsqmMAX4z39II/JolW+/mxTzyb
         g81IWibpE6UvFf7tMH6fXCbWbqrGCCraQTJxH7xeuv1ppNn2uOpU1c+ZBJ7VEX4Z9RZ7
         vuZbalVaClfnyA4MVDLghIm7xq05Q+KfeLXIsjCFuNxy2eWTdSiDF4rlYl3sPe0+/NJI
         XB3tUTyHQ9RlXMzF+iap4r9BmbAS8BfhBr9d80UmRrNLmexT8jmr1q3dhTk2L6rU3l1u
         cBoewqrygxnbkyVZaw10SXKTGbkolTx2caFbqzlIqtpJgQQK2bXpE/2wn66OqVT9Sxhq
         u1CA==
X-Gm-Message-State: AOJu0YwpvyWkUoBTb+sbI70+ikAMpd6KXR/BwTTTKWyfAAYoosigZeo0
	U1AH20WMzpMSOcbXocHy2jzt4aQOfDbxh6fk
X-Google-Smtp-Source: AGHT+IHNRxh6ip9wuilteMswJq0OHDd/alKbzQRFE5QrXCJMqgoditaW9gS47pvvjb9JP1aiDp/2OQ==
X-Received: by 2002:a17:90b:38c7:b0:27d:433e:e69c with SMTP id nn7-20020a17090b38c700b0027d433ee69cmr6648625pjb.18.1700028812378;
        Tue, 14 Nov 2023 22:13:32 -0800 (PST)
Received: from smtpclient.apple ([2601:600:967f:6b00:1ce2:9961:5f20:7dc5])
        by smtp.gmail.com with ESMTPSA id 2-20020a17090a0d4200b002801ca4fad2sm8983020pju.10.2023.11.14.22.13.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Nov 2023 22:13:32 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: sr-iov related bonding regression (two regressions in one report)
From: Anil Choudhary <anilchabba@gmail.com>
In-Reply-To: <0f97acf9-012d-4bb2-a766-0c2737e32b2c@leemhuis.info>
Date: Tue, 14 Nov 2023 22:13:20 -0800
Cc: Jay Vosburgh <jay.vosburgh@canonical.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Andy Gospodarek <andy@greyhouse.net>,
 Ivan Vecera <ivecera@redhat.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EFC5ADF4-1EE4-4900-B250-AC35656DC68B@gmail.com>
References: <986716ed-f898-4a02-a8f6-94f85b355a05@gmail.com>
 <32716.1700009673@famine>
 <0f97acf9-012d-4bb2-a766-0c2737e32b2c@leemhuis.info>
To: Linux regressions mailing list <regressions@lists.linux.dev>
X-Mailer: Apple Mail (2.3731.700.6)

Its not hardware issue when I do rmmod iavf ping started working .
So issue is certainly in this kernel and with sriov only
Iavf id Nic driver for VF(sriovnic)


Thanks,
Anil

> On Nov 14, 2023, at 9:50 PM, Linux regression tracking (Thorsten =
Leemhuis) <regressions@leemhuis.info> wrote:
>=20
> On 15.11.23 01:54, Jay Vosburgh wrote:
>> Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>=20
>>> I come across LACP bonding regression on Bugzilla [1].
>=20
> Side note: Stephen forwards some (all?) network regressions to the =
right
> people:
> https://lore.kernel.org/all/20231113083746.5e02f8b0@hermes.local/
>=20
> Would be best to check for that, no need to forward things twice, that
> just results in a mess.
>=20
>>> The reporter
>>> (Cc'ed) has two regressions. The first is actual LACP bonding
>>> regression (but terse):
>>>=20
>>>> Till linkx kernel 6.5.7 it is working fine, but after upgrading to =
6.6.1 ping stop working with LACP bonding.
>>>> When we disable SR-IOV from bios , everything working fine
>=20
> Makes me wonder if things have been working with or without the OOT
> module on 6.5.7, as strictly speaking it's only considered a kernel
> regression if thing worked with a vanilla kernel (e.g. without OOT
> modules) beforehand and broke when switching to a newer vanilla =
kernel.
> If that's the case it would be okay to add to regzbot.
>=20
>>> And the second is out-of-tree module FTBFS:
>> [... skip OOT stuff ...]
>>=20
>>> Should I add the first regression to regzbot (since the second one
>>> is obviously out-of-tree problem), or should I asked detailed =
regression
>>> info to the reporter?
>>=20
>> 	My vote is to get additional information.  Given the nature of
>> the workaround ("When we disable SR-IOV from bios , everything =
working
>> fine"), it's plausible that the underlying cause is something
>> platform-specific.
>=20
> Maybe, but when it comes to the "no regressions" rule that likely =
makes
> no difference from Linus perspective.
>=20
> But I guess unless the intel folks or someone else has an idea what
> might be wrong here we likely need a bisection (with vanilla kernels =
of
> course) to get anywhere.
>=20
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' =
hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.

