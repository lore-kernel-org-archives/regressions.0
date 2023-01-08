Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311461859
	for <regressions@lists.linux.dev>; Sun,  8 Jan 2023 20:58:55 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pEckl-0001i9-92; Sun, 08 Jan 2023 21:58:51 +0100
Message-ID: <ac023262-c6cb-01ad-aeee-2dbf379f4c37@leemhuis.info>
Date: Sun, 8 Jan 2023 21:58:50 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Commit b320d6c4 broke mt76
Content-Language: en-US, de-DE
To: "Alexander E. Patrakov" <patrakov@gmail.com>,
 Benjamin Berg <benjamin.berg@intel.com>
Cc: Johannes Berg <johannes.berg@intel.com>, Felix Fietkau <nbd@nbd.name>,
 linux-wireless@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAN_LGv2FLLKxsbruJ0u_Gh3+_nTGaVGd4154DXQ7Tz+BnFt3EQ@mail.gmail.com>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAN_LGv2FLLKxsbruJ0u_Gh3+_nTGaVGd4154DXQ7Tz+BnFt3EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673211535;5f3b4acf;
X-HE-SMSGID: 1pEckl-0001i9-92

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 08.01.23 20:46, Alexander E. Patrakov wrote:
> Hello Benjamin,
> 
> I have this hardware, which is supported by the mt76x2e driver:
> 
> 04:00.0 Network controller [0280]: MEDIATEK Corp. MT7612E 802.11acbgn
> PCI Express Wireless Network Adapter [14c3:7612]
> 
> Since Linux 6.1, the mt76 driver panics the kernel due to null
> dereference shortly after authenticating to the AP, as follows:

Thx for your report.

> [...]
>
> On Reddit, there is a similar thread with a USB adapter:
> https://www.reddit.com/r/archlinux/comments/zufy3n/linuxzen_611zen11_crashes_while_trying_to_use_usb/
> 
> I have checked with the nearly latest git revisions of both the kernel
> (9b43a525db125799df81e6fbef712a2ae50bfc5d) and the mt76 driver from
> https://github.com/openwrt/mt76 (679254c). The issue still exists.
> 
> I have bisected this, and the first bad commit is yours:
> 
> b320d6c456ff2aa43491654407d448bcfa58ac9f is the first bad commit
> commit b320d6c456ff2aa43491654407d448bcfa58ac9f
> Author: Benjamin Berg <benjamin.berg@intel.com>
> Date:   Fri Sep 2 16:12:40 2022 +0200

Not my area of expertise, but I guess it's fixed by this patch:

https://lore.kernel.org/all/20221230200747.19040-1-nbd@nbd.name/

Earlier reports:

https://lore.kernel.org/linux-wireless/CAFktD2fRnSbNgWRRoGbQzG5_Mw7=zFJKTVBHS_3D+mNUYcv9hQ@mail.gmail.com/
https://bugzilla.kernel.org/show_bug.cgi?id=216839
https://bugzilla.kernel.org/show_bug.cgi?id=216844

Hopefully everyone is back from vacation tomorrow so that we can finally
get this fixed in mainline soon.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
