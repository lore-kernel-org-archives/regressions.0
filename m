Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7F7168
	for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 10:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F7EC36AE9;
	Mon, 20 Dec 2021 10:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639996677;
	bh=OG/pjkc8oN1cWoAQpbnT6qaQmUJrH72K7ol9hdo5iHw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZaHHmgvPAohPhmcCjHYZ5whKsX40zJuqjzy3y09YUp2dmOtysLHB9ZGduJo5/92Tq
	 qk3sDjglRgRWMUMMvxm8Az5Sldg/yHlUAreQyM7vVZEaM17Hgua0rS6yEgzt0mEh8P
	 gATJS14bdxNfoNmGGr3+OgvJ9xgwaRnTkphAOy5/tyQMZhBvsIBnIbTE/Hu+5gN0Oq
	 pC+4DFkFkxGTOkEBrY0B+SJYU+QRnc+NLxQ68dnnNbdZdAl1jtDpz8ZK6Ag866rPDg
	 54oxdHAW4b4dbYUvDCsa7OtSJ4b9kXP9B5bF7LyNcu/+I/ltTj2X2viGnsm37XijkD
	 QS/fmr5jScBOg==
From: Kalle Valo <kvalo@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Nuno Oliveira <nuno@eq.uc.pt>,  Sebastian Bachmann <hello@reox.at>,  wgong@codeaurora.org,  ath10k@lists.infradead.org,  "regressions\@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Compex WLE200NX: regdomain sanitized regression
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
	<YaIix40KaVlxT+XG@eq.uc.pt>
	<96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info>
Date: Mon, 20 Dec 2021 12:37:53 +0200
In-Reply-To: <96b3682d-71b3-ada0-6fc7-686e51609968@leemhuis.info> (Thorsten
	Leemhuis's message of "Wed, 1 Dec 2021 10:06:59 +0100")
Message-ID: <87v8zja7em.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> Hi, this is your Linux kernel regression tracker speaking.
>
> On 27.11.21 13:21, Nuno Oliveira wrote:
>> * Sebastian Bachmann <hello@reox.at> [2021-11-27 08:17]:
>>
>>> I recently upgraded my Debian based AP from buster to bullseye, just
>>> to find out that hostapd does not work any more, because all 5GHz
>>> channels are marked as No-IR. This regression was already discussed on
>>> this ML here:
>>> https://www.mail-archive.com/ath10k@lists.infradead.org/msg12018.html
>>> and there is also an entry in Debian's bug tracker for the same issue:
>>> https://bugs.debian.org/959821
>>>
>>> I have a slightly different card (branded Compex WLE200NX):
>>> 04:00.0 Network controller: Qualcomm Atheros AR928X Wireless Network
>>> Adapter (PCI-Express) (rev 01)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: Qualcomm Atheros AR928X=
 Wireless Network Adapter
>>> (PCI-Express)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: ath9k
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel modules: ath9k
>>>
>>> But as you can see, also the EEPROM gets sanitized:
>>> [=C2=A0=C2=A0 15.461755] ath9k 0000:04:00.0: enabling device (0000 -> 0=
002)
>>> [=C2=A0=C2=A0 15.911600] ath: EEPROM regdomain sanitized
>>> [=C2=A0=C2=A0 15.911612] ath: EEPROM regdomain: 0x64
>>> [=C2=A0=C2=A0 15.911615] ath: EEPROM indicates we should expect a direc=
t regpair
>>> map
>>> [=C2=A0=C2=A0 15.911625] ath: Country alpha2 being used: 00
>>> [=C2=A0=C2=A0 15.911628] ath: Regpair used: 0x64
>>>
>>> I read in the other thread, that this is a regression, but the actual
>>> commit causing it was never reverted.
>>> I tried to search for newer messages explaining the issue, however as
>>> far as I can tell, the thread ends in June 2020 with no solution
>>> available.
>>>
>>> Therefore, I kindly want to ask if there is any workaround available
>>> to re-enable 5GHz channels in AP mode for my card? (expect sticking to
>>> a pre-5.6 kernel or manually patching and recompiling ath)
>>=20
>> After June 2020 there were other users also affected by this change (see
>> e.g.,
>> https://lists.infradead.org/pipermail/ath10k/2021-August/012802.html).
>> Users were complaining that this change was too restrictive since it
>> meant that the intersection of restrictions for regdomains 0x00, 0x64,
>> US, and their local domain, together with a cumulative mode of applying
>> these constraints meant that, in practice, they would not be able to use
>> their world domain cards anymore as APs in the 5GHz band, for certain
>> regdomains where they were located.
>>=20
>> And several people pinpointed the exact source changes responsible for
>> this. In my case, I ended up applying the attached patch, that just
>> loads the parameters for the regdomain that I'm interested in
>> (CTRY_PORTUGAL). I'm not in the US; and I care for their regulatory
>> restrictions as much as they are interested in mine.
>>=20
>> So I think that you might be able to use the attached changes, with the
>> specific CTRY_xxx parameter suitable for your case. And then recompile
>> the respective Debian kernel package, which takes a lot of CPU if you
>> just recompile the whole package. Let me know if you need instructions.
>>=20
>> A more robust option would be to go the OpenWRT way, and use their
>> patches to make this country selection a parameter for the kernel
>> module. This way, you would just reload the kernel module to change to a
>> new regdomain, subject to the restrictions of your hardware / firmware.
>> I have not looked into that. Please let me know if you isolate these
>> patches.
>>=20
>> In any case it seems difficult to escape a kernel recompile, due to this
>> small, entirely legitimate, yet remarkable decision by the driver
>> maintainers.
>
> This is a regression due to 2dc016599cfa ("ath: add support for special
> 0x0 regulatory domain") that seems to affect quite a few users, but
> afaics was never properly addressed. I fully understand that this might
> be a special case where Linus' "no regressions" rule can't be simply
> applied.

Yes, this is a tricky problem and I am taking a second look at this.
Regulatory rules are complicated and we do not want to break them in any
circumstance.

I see two ways to workaround this:

1) calibrate your board with a correct country code (which is impossible
   for an average user)

2) use 2.4 GHz band

> But isn't there some way to provide users with a solution that doesn't
> force users to compile a module or a kernel? Like a module-parameter
> that only works if the the regulatory domain code in the EEPROM is empty
> (as apparently used by OpenWRT?). Yes, module parameters are normally a
> bad idea, but this case it might be a situation where it's the best
> solution.

I don't think setting the country code via a module parameter would be
acceptable for the authorities, more info here:

https://wireless.wiki.kernel.org/en/developers/regulatory

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
