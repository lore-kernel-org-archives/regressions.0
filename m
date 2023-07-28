Received: from abi149hd125.arn1.oracleemaildelivery.com (abi149hd125.arn1.oracleemaildelivery.com [129.149.84.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0779DEDC
	for <regressions@lists.linux.dev>; Fri, 28 Jul 2023 19:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=WvVvdhVMzarAPgKSDz+57haMY2V5DGCr8AR4QPbT3O8=;
 b=rukcSh68Gpps9upIqEQ+y8jUK2Frk5bbMPYpsWWB6hVV0+QszLKHOFxoNru4LcpPgXpG6Y3XB1JM
   Ur0J7r4wi8zMZpgbtaM+7r9DFNR3hG9xwp0SikiW99DfJo+SNHyn+nWyUulY6uc4NA05ndeUYw8Q
   qGMty3/Z0GdDxhoTxBAGS4RkWY9l7PifP6iKJ/fXNryUYefS/7x9IX/l9RggUkFmjDUBiNLtdJH0
   WKib2lM0kKZiJrtrM44G92f2/wGGi4dvZCYW7xr1khj4Lb2kZfUXqfwn6wLzwPsw9A7msLuuPCwF
   5fDQcAb10oRow7xHK01yT0bDs4t0Lg13GyICCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=WvVvdhVMzarAPgKSDz+57haMY2V5DGCr8AR4QPbT3O8=;
 b=SYtVKkXGqHHS59unG/tWwhvB675j1bHk3qDavnHzZYqt7klKnHk93h6UPZWnqW/NadhHew0jsV0G
   59deC+Z7HvlIq7t7BkjTuNR773lp9wAQFR3m7E6ZGVOS33MhOwe2Syj8GrWip4omm42y69VFZy+K
   C2FRI1/zDc6vqCKS/ZE1ywI2CGjOzcRYB8NAgTBztBmAGBj99M4wCw8OBiJKADqaXm8l7ns9m+lj
   0bGexf3o/OyCVxCaJyLIu3oRxfVm5YPUh0tsLafqDFmWJcIIk3s4//B4vnw7pEdBw/4c59PYNf/f
   KDVY0xXMYfVZTiVtFrbDb0X2wix6fVn7P3BpiA==
Received: by omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230629 64bit (built Jun 29
 2023))
 with ESMTPS id <0RYI00KX9UH3XRB0@omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Fri, 28 Jul 2023 19:36:39 +0000 (GMT)
Message-id: <a1b7de54-53ec-0899-eaf6-e1c3d3d15f56@augustwikerfors.se>
Date: Fri, 28 Jul 2023 21:36:36 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
Subject: Re: [PATCH v2] ACPI: resource: Add a quirk for Lenovo Yoga 7 14ARB7
Content-language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, regressions@lists.linux.dev
References: <20230728191408.18141-1-mario.limonciello@amd.com>
From: August Wikerfors <git@augustwikerfors.se>
In-reply-to: <20230728191408.18141-1-mario.limonciello@amd.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAFMx/BI9+2fEpnCAiiG34Fma+jsCm2JEnzmZKHoPTgqTmh1iK3C2jNizYSEZhxg
 ICQN8F9QebZzzi7+Kc5ZzFZlY3aynMC72svf3k4uktttvDOvVgIVgWZMRtMKYsli
 0shxx2OV4kCBYmi5LaHmkVhWRPFtxIKrpFUAJsMgb2QrHKClqpaenAxoHe1+lQXV
 2a/TG+RP0VBXyV8x20oGA5q736slRs820G7bY3g01w+H51SZwS5qWhU9II8qS8OX
 5NDEQPxD/r8nlfevuoxinrS5G46ZDEeNN12Qb2hAQ1LjJKkC8u1eUW50G2eOCvoq
 GKGoHX6nkJTmJkfvrJVugv1FIGijckFGJDKwSSRrQ76yz6ArJR8C6s2zYAdbtunK
 7HOip/+h2LIK497UMV3aLMNt1zEJaSko2CpCcGMqzmE8HZgqDMTXJhFgmQf5Gttf 7uuS6ts=

On 2023-07-28 21:14, Mario Limonciello wrote:
> Lenovo Yoga 7 needs to have keyboard interrupt signaling polarity
> is incorrect in the MADT and the value from the DSDT should be used.
> 
> Reported-by: August Wikerfors <git@augustwikerfors.se>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217718
> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Tested-by: August Wikerfors <git@augustwikerfors.se>

Thanks!
