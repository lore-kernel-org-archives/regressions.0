Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25B743ABD
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 20:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYbs7mYy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cc37fb1310so1100705ad.1
        for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 12:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700081344; x=1700686144; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/b24oZBDOyviv88keLNJvELffPgYkOMIvr7ryRw2UM=;
        b=HYbs7mYyXpj1Tb9LlpMDucWmbd22HMkNmvTTUyl5hWCfNkOevlD9lB3Nauaj3ZLYG+
         MP7mmoE2YsQ+eq8sWopovrko9HCeya+nFbik3ciDjdUYMJ+b+yv7kCa0ilWjl/c+Ia2M
         /iS+/Gef63uPZK6u7muC5Q1nCM/ajUH7OY5M7ixhceMPm0iNg5Xmr/fXm1ZbW0kuNyAP
         qOBeH40ghddTKf8azt1GcW26FSGbgPWKEEzg+4caZeTwVk/i+VLkpcqI/NHHn3pCXfCQ
         4OsLtW3HfOOsg86V4ryBRpkrwSczHj75dOLZCb2etuTX2TlYKZXTGHiECK2dyg/N9Vu+
         8pEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700081344; x=1700686144;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/b24oZBDOyviv88keLNJvELffPgYkOMIvr7ryRw2UM=;
        b=c0miPHZZgpEXz9IDH7CIH7HqjPjaQXA9u/DWFMGju2VTbQTc2pCst16k2VGoVZZZWj
         h3j8NihfdlZk2qt7yUHSPVkc4Uewpuza8i9qw/lkAFs11flzyr++1fdnup7hn0VyNlev
         OF/kvif0xM0rNiL8nWieKW/e8i0Ivwqwu+GlTnUS1MeH9dKyb/0CIMlN8GC7RTKGtCib
         81xKunTOdXfbkabLH/L+NNbvF6qcqChxdKU+d7exlnBk+FISbG0jTzM2ZUfriDSJTtdQ
         xePleaYqU/u8bxolZlWmBgngSz5FlXxTMgYwTEALr1sJnSPDJTveZFtfcWBaTchHmT6i
         drNw==
X-Gm-Message-State: AOJu0YxJ9HCM0x4lDrd2uJanqF1cMnoi6LkQHfNR8bypTMVKpvGRuh3/
	9GjHno1LFMlNlTEETLsIEn7Zjz6c/Uowyuq7
X-Google-Smtp-Source: AGHT+IFcg6wRPt2wGlOlDs7bsLg5pKynCaCBOiBofUa2G4WFh1uKKgFi0RVSnyPH4Z6hYwgeTh3C2A==
X-Received: by 2002:a17:902:ec84:b0:1c8:9d32:339e with SMTP id x4-20020a170902ec8400b001c89d32339emr7774092plg.50.1700081343562;
        Wed, 15 Nov 2023 12:49:03 -0800 (PST)
Received: from smtpclient.apple ([2601:600:967f:6b00:30f7:e7fd:e49d:14a0])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902684800b001cc46240491sm7991640pln.136.2023.11.15.12.49.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Nov 2023 12:49:03 -0800 (PST)
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
In-Reply-To: <CC024511-980A-4508-8ABF-659A04367C2B@gmail.com>
Date: Wed, 15 Nov 2023 12:48:51 -0800
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
Message-Id: <7AC9E8F6-B229-47AA-84CE-1149F45D7E0F@gmail.com>
References: <986716ed-f898-4a02-a8f6-94f85b355a05@gmail.com>
 <32716.1700009673@famine>
 <0f97acf9-012d-4bb2-a766-0c2737e32b2c@leemhuis.info>
 <CC024511-980A-4508-8ABF-659A04367C2B@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
X-Mailer: Apple Mail (2.3731.700.6)

We are getting errorError subscribing to SWID 0x0000.
 from following code
root@us-ash-r1-c2-m1:~/linux# grep -rn -e "subscribing to " .
grep: =
./debian/linux-image/lib/modules/6.6.1-vdx/kernel/drivers/net/ethernet/int=
el/ice/ice.ko: binary file matches
./samples/connector/ucon.c:149: ulog("subscribing to %u.%u\n", =
CN_TEST_IDX, CN_TEST_VAL);
./Documentation/driver-api/media/v4l2-event.rst:117:add      called when =
a new listener gets added (subscribing to the same
./Documentation/driver-api/media/v4l2-event.rst:130:Unsubscribing to an =
event is via:
./Documentation/maintainer/feature-and-driver-maintainers.rst:44:mailing =
list. Either by subscribing to the whole list or using more
grep: ./drivers/net/ethernet/intel/ice/ice_lag.o: binary file matches
grep: ./drivers/net/ethernet/intel/ice/ice.o: binary file matches
grep: ./drivers/net/ethernet/intel/ice/ice.ko: binary file matches
./drivers/net/ethernet/intel/ice/ice_lag.c:1007:                =
dev_err(ice_pf_to_dev(local_lag->pf), "Error subscribing to SWID =
0x%04X\n",
root@us-ash-r1-c2-m1:~/linux#


Thanks,
Anil



> On Nov 14, 2023, at 10:19 PM, Anil Choudhary <anilchabba@gmail.com> =
wrote:
>=20
> <PastedGraphic-1.png>
>=20
>=20
> Following error error scribing to said is also new
>=20
>> On Nov 14, 2023, at 9:50 PM, Linux regression tracking (Thorsten =
Leemhuis) <regressions@leemhuis.info> wrote:
>>=20
>> On 15.11.23 01:54, Jay Vosburgh wrote:
>>> Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>>=20
>>>> I come across LACP bonding regression on Bugzilla [1].
>>=20
>> Side note: Stephen forwards some (all?) network regressions to the =
right
>> people:
>> https://lore.kernel.org/all/20231113083746.5e02f8b0@hermes.local/
>>=20
>> Would be best to check for that, no need to forward things twice, =
that
>> just results in a mess.
>>=20
>>>> The reporter
>>>> (Cc'ed) has two regressions. The first is actual LACP bonding
>>>> regression (but terse):
>>>>=20
>>>>> Till linkx kernel 6.5.7 it is working fine, but after upgrading to =
6.6.1 ping stop working with LACP bonding.
>>>>> When we disable SR-IOV from bios , everything working fine
>>=20
>> Makes me wonder if things have been working with or without the OOT
>> module on 6.5.7, as strictly speaking it's only considered a kernel
>> regression if thing worked with a vanilla kernel (e.g. without OOT
>> modules) beforehand and broke when switching to a newer vanilla =
kernel.
>> If that's the case it would be okay to add to regzbot.
>>=20
>>>> And the second is out-of-tree module FTBFS:
>>> [... skip OOT stuff ...]
>>>=20
>>>> Should I add the first regression to regzbot (since the second one
>>>> is obviously out-of-tree problem), or should I asked detailed =
regression
>>>> info to the reporter?
>>>=20
>>> 	My vote is to get additional information.  Given the nature of
>>> the workaround ("When we disable SR-IOV from bios , everything =
working
>>> fine"), it's plausible that the underlying cause is something
>>> platform-specific.
>>=20
>> Maybe, but when it comes to the "no regressions" rule that likely =
makes
>> no difference from Linus perspective.
>>=20
>> But I guess unless the intel folks or someone else has an idea what
>> might be wrong here we likely need a bisection (with vanilla kernels =
of
>> course) to get anywhere.
>>=20
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' =
hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>=20

