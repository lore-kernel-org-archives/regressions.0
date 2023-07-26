Received: from abi149hd125.arn1.oracleemaildelivery.com (abi149hd125.arn1.oracleemaildelivery.com [129.149.84.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A624E1BEE4
	for <regressions@lists.linux.dev>; Wed, 26 Jul 2023 22:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=P5XOpKDXF2I6R3nLKrm49oZh2FlsW7OS7CKRX6CPNiQ=;
 b=moHN+0yB5775OaTCkulEdw/A3GeYahNG1NiLULevqihOeasZ+stZJh3Hf41RcNGWRQyY8ywfk8Hi
   YvNLXf+XTPLEbrtn70UZphcmvq07+nG/7UzWbPHyk87N/Z4HPVJDHJrJRIlC3SA/wTRuLz8bo4T9
   tGKBR2nI2yQ467s+B9GvXQP9B2qe9STSIrke07PnZxjyy7nOU76C4SKjwpRTGS+p1RlpDGl8lRdk
   DDZzib4PDJluL/W48vOYez1cm2vUvjNUMpnjOBoB8uhe2gAQJcN6mdLU7CzNE0yNjzcDb4uYUPYX
   pfT5iVVi5p4o8KJHEnjh6G95j2VUgZ56hbQZXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=P5XOpKDXF2I6R3nLKrm49oZh2FlsW7OS7CKRX6CPNiQ=;
 b=XfYf2OgHATJ5LFxRpvQhyMP7wWriesITIvVNzqmqP8EF8muwEpA0sV6lI6a1RUYmlmyHWlrDerED
   vlhwBcq5yXvFuzWeLUdH/KDCrn3qe7f4MKQVKZgmyrV9tVgPRkeHUzZx13ty9pnwRPq/8snig6kV
   vPTXDace4Wf17+0RCmAD1MY+lp9LyO8zm4eXtHswyR3kiyIv0kbPNPrPG8wBLhuPACHowmAF1/NK
   43a/CgmVP/q3mwOdDKov8iF1PteHllX1UTCVCZizWNEasibweohDCLuB5T0yRAmimzwDluz3rmEF
   JDQec5kS9DC9e6LKddPa8pOU/xew7SFne2PX0Q==
Received: by omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230629 64bit (built Jun 29
 2023))
 with ESMTPS id <0RYF00GIIEA606A0@omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Wed, 26 Jul 2023 22:54:06 +0000 (GMT)
Message-id: <596b9c4a-fb83-a8ab-3a44-6052d83fa546@augustwikerfors.se>
Date: Thu, 27 Jul 2023 00:54:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
From: August Wikerfors <git@augustwikerfors.se>
Subject: [REGRESSION] IRQ override revert breaks keyboard on Lenovo Yoga 7
 14ARB7
To: Mario Limonciello <mario.limonciello@amd.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Content-language: en-US
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAGnM6W8OrXL2D+FP6EMe5jLrw6d5HFTLzCAq4llZKfL8+RGXIV+2M5ejmHh35jV
 XcXIenFX1c2j/twuJhfPogW02hiG3OymSz8S9rYSctj64ZFr0OAwEbRJMpzfpg36
 DiBex5Iu1t/6mxI7SaoUDbIB/dMitn1+LSQdi8mrDDSYCMQoK0HWAYCtHcxrV8hL
 XImyfNmnB6X7/iYXIrCqrd+ErzHzH7xsCY0/jE/Xydg4iA0IHshzFbDOGO5op2ku
 r0lYmyuGI54HV/dYnMTAD08MRrs+CIiYcF7vHbdTtNzqfeZyZQjHZJwZzavUpaSP
 B/71vaZDtUWhVoL46JqAOcbgbl8bB/4QP04hLc9+NFGdr5wOCxaMs2RK1dfGsc+Z
 R2CDJ/2mTZ35oQtQmkJZ/117dlYWjVXBwBzm15r5D3w4uKO5RKELTPg74Xf8/Vo4 /mkQ1Z0=

Hi,

Since v6.5-rc1 the keyboard on this laptop no longer works. This problem
also existed before v6.0-rc1 commit 9946e39fe8d0 ("ACPI: resource: skip
IRQ override on AMD Zen platforms"), so I suspected the cause to be
a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
which reverted that commit. Reverting a9c4a912b7dc confirmed this theory.

#regzbot introduced: a9c4a912b7dc

My specs are:
Laptop model: Lenovo Yoga 7 14ARB7
BIOS: K5CN40WWT66 (latest beta from [1])
CPU: AMD Ryzen 5 6600U
Kernel config: [2]
Distribution: Arch Linux

The issue has been confirmed by at least one other user with this
laptop: [3]

[1] https://forums.lenovo.com/t5/Lenovo-Yoga-Series-Laptops/Yoga-7-14ARB7-keyboard-lag-when-on-certain-websites-or-when-Vantage-is-opened/m-p/5174991?page=28#5974742
[2] https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/raw/d4a56a1e994201b6c607199922aa22e4337b56c9/config
[3] https://github.com/tomsom/yoga-linux/issues/47

Regards,
August Wikerfors
