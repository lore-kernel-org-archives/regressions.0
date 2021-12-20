Received: from nectar.eq.uc.pt (nectar.eq.uc.pt [193.137.214.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC4929CA
	for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 19:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eq.uc.pt;
	s=20171223; h=Message-ID:Subject:Cc:To:From:Date:Sender;
	bh=VoJTWUayDMgarkxeP4MlPOUC4TgKQC/9Id50q3siqog=; b=dA7aTOEB3IDIfZeuzCJFD5ccwH
	L1UUT+VoMBSeN30MmtQjlG4v5VBpKlnkSZxW3V3Ytx77Qwnlp6KWJKPG7vxYWiLq38+Zt6nm2GDU2
	i5S6veGJK/DddLNPnTSRN/e6o5yhQrqprbpgPZdLOsuLEvERyNlHSEaVZqeDPRYaO1m5Kvg8lqjcj
	tBHsvas7k8LaHirS6ijQyiN4TAOyzrjW0BGMX/NR6A3yBbTzh4vzZNZ4mycoSBw3XvysJUv281SHJ
	ZPOR91sj4SShG9CYTx9QweRWiWyBvHK3IGeQZ/2peWRLmDP31wS8QYriC3ko9hXPAbdLNmy4yUjbZ
	Y1MLb3bg==;
Received: from neo.eq.uc.pt ([193.137.214.155] helo=neo)
	by nectar.eq.uc.pt with esmtp (Exim 4.95)
	(envelope-from <nuno@eq.uc.pt>)
	id 1mzNRx-002IBC-5B;
	Mon, 20 Dec 2021 18:31:56 +0000
Received: from nuno by neo with local (Exim 4.95)
	(envelope-from <nuno@eq.uc.pt>)
	id 1mzNRx-007imO-2D;
	Mon, 20 Dec 2021 18:31:53 +0000
Date: Mon, 20 Dec 2021 18:31:53 +0000
From: Nuno Oliveira <nuno@eq.uc.pt>
To: Kalle Valo <kvalo@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Sebastian Bachmann <hello@reox.at>, wgong@codeaurora.org,
	ath10k@lists.infradead.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Compex WLE200NX: regdomain sanitized regression
Message-ID: <YcDMGdpvINCX9VlX@eq.uc.pt>
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
 <YaIix40KaVlxT+XG@eq.uc.pt>
 <96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
 <87v8zja7em.fsf@codeaurora.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v8zja7em.fsf@codeaurora.org>

Hi Kalle,

Thanks for looking again into this.

* Kalle Valo <kvalo@kernel.org> [2021-12-20 10:38]:
>Thorsten Leemhuis <regressions@leemhuis.info> writes:
>
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> On 27.11.21 13:21, Nuno Oliveira wrote:
>>> * Sebastian Bachmann <hello@reox.at> [2021-11-27 08:17]:
>>>
>>>> I recently upgraded my Debian based AP from buster to bullseye, just
>>>> to find out that hostapd does not work any more, because all 5GHz
>>>> channels are marked as No-IR. This regression was already discussed on
>>>> this ML here:
>>>> https://www.mail-archive.com/ath10k@lists.infradead.org/msg12018.html
>>>> and there is also an entry in Debian's bug tracker for the same issue:
>>>> https://bugs.debian.org/959821
>>>>
>>>> I have a slightly different card (branded Compex WLE200NX):
>>>> 04:00.0 Network controller: Qualcomm Atheros AR928X Wireless Network
>>>> Adapter (PCI-Express) (rev 01)
>>>>        Subsystem: Qualcomm Atheros AR928X Wireless Network Adapter
>>>> (PCI-Express)
>>>>        Kernel driver in use: ath9k
>>>>        Kernel modules: ath9k
>>>>
>>>> But as you can see, also the EEPROM gets sanitized:
>>>> [   15.461755] ath9k 0000:04:00.0: enabling device (0000 -> 0002)
>>>> [   15.911600] ath: EEPROM regdomain sanitized
>>>> [   15.911612] ath: EEPROM regdomain: 0x64
>>>> [   15.911615] ath: EEPROM indicates we should expect a direct regpair
>>>> map
>>>> [   15.911625] ath: Country alpha2 being used: 00
>>>> [   15.911628] ath: Regpair used: 0x64
>>>>
>>>> I read in the other thread, that this is a regression, but the actual
>>>> commit causing it was never reverted.
>>>> I tried to search for newer messages explaining the issue, however as
>>>> far as I can tell, the thread ends in June 2020 with no solution
>>>> available.
>>>>
>>>> Therefore, I kindly want to ask if there is any workaround available
>>>> to re-enable 5GHz channels in AP mode for my card? (expect sticking to
>>>> a pre-5.6 kernel or manually patching and recompiling ath)
>>>
>>> After June 2020 there were other users also affected by this change (see
>>> e.g.,
>>> https://lists.infradead.org/pipermail/ath10k/2021-August/012802.html).
>>> Users were complaining that this change was too restrictive since it
>>> meant that the intersection of restrictions for regdomains 0x00, 0x64,
>>> US, and their local domain, together with a cumulative mode of applying
>>> these constraints meant that, in practice, they would not be able to use
>>> their world domain cards anymore as APs in the 5GHz band, for certain
>>> regdomains where they were located.
>>>
>>> And several people pinpointed the exact source changes responsible for
>>> this. In my case, I ended up applying the attached patch, that just
>>> loads the parameters for the regdomain that I'm interested in
>>> (CTRY_PORTUGAL). I'm not in the US; and I care for their regulatory
>>> restrictions as much as they are interested in mine.
>>>
>>> So I think that you might be able to use the attached changes, with the
>>> specific CTRY_xxx parameter suitable for your case. And then recompile
>>> the respective Debian kernel package, which takes a lot of CPU if you
>>> just recompile the whole package. Let me know if you need instructions.
>>>
>>> A more robust option would be to go the OpenWRT way, and use their
>>> patches to make this country selection a parameter for the kernel
>>> module. This way, you would just reload the kernel module to change to a
>>> new regdomain, subject to the restrictions of your hardware / firmware.
>>> I have not looked into that. Please let me know if you isolate these
>>> patches.
>>>
>>> In any case it seems difficult to escape a kernel recompile, due to this
>>> small, entirely legitimate, yet remarkable decision by the driver
>>> maintainers.
>>
>> This is a regression due to 2dc016599cfa ("ath: add support for special
>> 0x0 regulatory domain") that seems to affect quite a few users, but
>> afaics was never properly addressed. I fully understand that this might
>> be a special case where Linus' "no regressions" rule can't be simply
>> applied.
>
>Yes, this is a tricky problem and I am taking a second look at this.
>Regulatory rules are complicated and we do not want to break them in any
>circumstance.
>
>I see two ways to workaround this:
>
>1) calibrate your board with a correct country code (which is impossible
>   for an average user)
>
>2) use 2.4 GHz band
>
>> But isn't there some way to provide users with a solution that doesn't
>> force users to compile a module or a kernel? Like a module-parameter
>> that only works if the the regulatory domain code in the EEPROM is empty
>> (as apparently used by OpenWRT?). Yes, module parameters are normally a
>> bad idea, but this case it might be a situation where it's the best
>> solution.
>
>I don't think setting the country code via a module parameter would be
>acceptable for the authorities, more info here:
>
>https://wireless.wiki.kernel.org/en/developers/regulatory

The issue involves finding a reasonable compromise between relative 
inconveniences, given the perspectives of both developers and users. As 
implemented currently, the restriction seems to affect both ath9k and 
ath10k (and probably ath11k -- I have not tried it, and frankly with the 
current status, I'm not eager to do it), but only when users try to run 
a 5 GHz AP. This is still reasonable (and legal) use, although not 
without many restrictions. Other drivers (e.g., iwlwifi) are much more 
restrictive relative to this, but at least they genuinely have made it 
completely clear from the beginning.

A common point of the previous messages was that, after these last 
changes, the boards with the 0x00 domain in the EEPROM were successively 
initialized with the 0x64 and later with UNITED_STATES domains by the 
driver. In practice this prevented their use as an AP when, later in 
userspace, the user tried to declare a 3rd local regdomain. My 
suggestion here would be to avoid this double interpretation of what 
default initialization would be appropriate. Either keep the old 
behavior (UNITED_STATES) which limited but did not originally prevented 
the AP usage, or replace it completely with the updated interpretation 
of what's applicable to this case (0x64); but please don't do both by 
default, or we will be in the current situation. Other users have asked 
for this before, and this sort of clarification seems to be the minimum 
to consider at this point, if anything is to be considered.

If this limiting double initialization is already achievable entirely 
through user configuration of default distribution kernels, please 
excuse my lack of knowledge. In this case, just documenting this better 
could also help other users.

Besides this consistent "safe" initialization, for users with special 
cases there's always the options of either providing alternative CRDAs 
or patching and recompiling the driver. This is a matter of relative 
inconveniences; as long as they remain feasible, it's always a weighting 
issue.

Thanks for your good work. Regards,

Nuno.
