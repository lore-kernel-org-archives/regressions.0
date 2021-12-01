Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F72C80
	for <regressions@lists.linux.dev>; Wed,  1 Dec 2021 09:07:05 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1msLZs-0008EO-2v; Wed, 01 Dec 2021 10:07:01 +0100
Message-ID: <96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
Date: Wed, 1 Dec 2021 10:06:59 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Compex WLE200NX: regdomain sanitized regression
Content-Language: en-BS
To: Nuno Oliveira <nuno@eq.uc.pt>, Sebastian Bachmann <hello@reox.at>,
 Kalle Valo <kvalo@codeaurora.org>, wgong@codeaurora.org
Cc: ath10k@lists.infradead.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
 <YaIix40KaVlxT+XG@eq.uc.pt>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YaIix40KaVlxT+XG@eq.uc.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1638349625;7c8820e3;
X-HE-SMSGID: 1msLZs-0008EO-2v


Hi, this is your Linux kernel regression tracker speaking.

On 27.11.21 13:21, Nuno Oliveira wrote:
> * Sebastian Bachmann <hello@reox.at> [2021-11-27 08:17]:
>
>> I recently upgraded my Debian based AP from buster to bullseye, just
>> to find out that hostapd does not work any more, because all 5GHz
>> channels are marked as No-IR. This regression was already discussed on
>> this ML here:
>> https://www.mail-archive.com/ath10k@lists.infradead.org/msg12018.html
>> and there is also an entry in Debian's bug tracker for the same issue:
>> https://bugs.debian.org/959821
>>
>> I have a slightly different card (branded Compex WLE200NX):
>> 04:00.0 Network controller: Qualcomm Atheros AR928X Wireless Network
>> Adapter (PCI-Express) (rev 01)
>>        Subsystem: Qualcomm Atheros AR928X Wireless Network Adapter
>> (PCI-Express)
>>        Kernel driver in use: ath9k
>>        Kernel modules: ath9k
>>
>> But as you can see, also the EEPROM gets sanitized:
>> [   15.461755] ath9k 0000:04:00.0: enabling device (0000 -> 0002)
>> [   15.911600] ath: EEPROM regdomain sanitized
>> [   15.911612] ath: EEPROM regdomain: 0x64
>> [   15.911615] ath: EEPROM indicates we should expect a direct regpair
>> map
>> [   15.911625] ath: Country alpha2 being used: 00
>> [   15.911628] ath: Regpair used: 0x64
>>
>> I read in the other thread, that this is a regression, but the actual
>> commit causing it was never reverted.
>> I tried to search for newer messages explaining the issue, however as
>> far as I can tell, the thread ends in June 2020 with no solution
>> available.
>>
>> Therefore, I kindly want to ask if there is any workaround available
>> to re-enable 5GHz channels in AP mode for my card? (expect sticking to
>> a pre-5.6 kernel or manually patching and recompiling ath)
> 
> After June 2020 there were other users also affected by this change (see
> e.g.,
> https://lists.infradead.org/pipermail/ath10k/2021-August/012802.html).
> Users were complaining that this change was too restrictive since it
> meant that the intersection of restrictions for regdomains 0x00, 0x64,
> US, and their local domain, together with a cumulative mode of applying
> these constraints meant that, in practice, they would not be able to use
> their world domain cards anymore as APs in the 5GHz band, for certain
> regdomains where they were located.
> 
> And several people pinpointed the exact source changes responsible for
> this. In my case, I ended up applying the attached patch, that just
> loads the parameters for the regdomain that I'm interested in
> (CTRY_PORTUGAL). I'm not in the US; and I care for their regulatory
> restrictions as much as they are interested in mine.
> 
> So I think that you might be able to use the attached changes, with the
> specific CTRY_xxx parameter suitable for your case. And then recompile
> the respective Debian kernel package, which takes a lot of CPU if you
> just recompile the whole package. Let me know if you need instructions.
> 
> A more robust option would be to go the OpenWRT way, and use their
> patches to make this country selection a parameter for the kernel
> module. This way, you would just reload the kernel module to change to a
> new regdomain, subject to the restrictions of your hardware / firmware.
> I have not looked into that. Please let me know if you isolate these
> patches.
> 
> In any case it seems difficult to escape a kernel recompile, due to this
> small, entirely legitimate, yet remarkable decision by the driver
> maintainers.

This is a regression due to 2dc016599cfa ("ath: add support for special
0x0 regulatory domain") that seems to affect quite a few users, but
afaics was never properly addressed. I fully understand that this might
be a special case where Linus' "no regressions" rule can't be simply
applied.

But isn't there some way to provide users with a solution that doesn't
force users to compile a module or a kernel? Like a module-parameter
that only works if the the regulatory domain code in the EEPROM is empty
(as apparently used by OpenWRT?). Yes, module parameters are normally a
bad idea, but this case it might be a situation where it's the best
solution.

Ciao, Thorsten
