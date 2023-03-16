Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1EA323E
	for <regressions@lists.linux.dev>; Thu, 16 Mar 2023 13:21:55 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pcnYD-00050T-QS; Thu, 16 Mar 2023 14:21:49 +0100
Message-ID: <6bba2a93-d503-3c6e-680b-c350ea8d3f88@leemhuis.info>
Date: Thu, 16 Mar 2023 14:21:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Linux PCI <linux-pci@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <e6aaddb9-afec-e77d-be33-570f9f10a9c2@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [regression] Bug 217069 - Wake on Lan is broken on r8169 since
 6.2
In-Reply-To: <e6aaddb9-afec-e77d-be33-570f9f10a9c2@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678972915;152f6551;
X-HE-SMSGID: 1pcnYD-00050T-QS

[Quick inquiry with different recipients]

> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217069 :

To Rafael and the ACPI & PM folks as well as to Bjorn and the PCI folks:

Three users reported that WOL/Wake on Lan broke for them with 6.2; two
of them have Realtek chips, one an Intel NIC. For details see the bug
linked above.

Did something in ACPI/PM/PCI land change for 6.2 that might cause
something like this? Or is such a problem even known already?

Just fishing for ideas here. If nobody has any, one of the reports will
have to bisect this.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

