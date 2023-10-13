Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA51401E
	for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qrI6P-0002mG-KG; Fri, 13 Oct 2023 15:21:17 +0200
Message-ID: <f9c9bb95-161b-4565-b8d3-fc41c7fe3b29@leemhuis.info>
Date: Fri, 13 Oct 2023 15:21:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: mt76: mt7915: remove VHT160 capability on
 MT7915
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230726091704.25795-1-nbd@nbd.name>
 <12289744.O9o76ZdvQC@natalenko.name>
 <b5e822ff-4b7c-4617-96c8-5b132df814ab@leemhuis.info>
In-Reply-To: <b5e822ff-4b7c-4617-96c8-5b132df814ab@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697203281;bc099de8;
X-HE-SMSGID: 1qrI6P-0002mG-KG

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 22.09.23 13:22, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> 
> On 21.09.23 07:02, Oleksandr Natalenko wrote:
>> On středa 26. července 2023 11:17:02 CEST Felix Fietkau wrote:
>>> The IEEE80211_VHT_CAP_EXT_NSS_BW value already indicates support for half-NSS
>>> 160 MHz support, so it is wrong to also advertise full 160 MHz support.
> [...]
>> and this broke my mt7915-based AP.
>>
>> However, if I remove `[VT160]` capability from the hostapd config, things go back to normal. It does seem that 160 MHz still works even.
>>
>> Is this expected?
> 
> Thanks for the report.

Removing this from the regression tracking after mentioning the intent
to do so due to the tricky striation in my last report to Linus.

#regzbot inconclusive: tricky situation, no simple way out afaics
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.



