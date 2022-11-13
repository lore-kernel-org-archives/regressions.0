Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B046B2
	for <regressions@lists.linux.dev>; Sun, 13 Nov 2022 17:43:07 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ouH0Z-0000Z2-DB; Sun, 13 Nov 2022 18:43:03 +0100
Message-ID: <456466ec-b347-2c08-1b14-f6b7726229d5@leemhuis.info>
Date: Sun, 13 Nov 2022 18:43:02 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [BUG] rtc-efi: Error in efi.get_time() spams dmesg with error
 message #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <Y2o1hdZK9GGDVJsS@monolith.localdoman>
 <9b1d1006-2b58-6eda-7e43-861074e9ccfa@leemhuis.info>
In-Reply-To: <9b1d1006-2b58-6eda-7e43-861074e9ccfa@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1668361387;75c77259;
X-HE-SMSGID: 1ouH0Z-0000Z2-DB

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 09.11.22 16:50, Thorsten Leemhuis wrote:
> On 08.11.22 11:55, Alexandru Elisei wrote:
> 
>> Commit d3549a938b73 ("efi/arm64: libstub: avoid SetVirtualAddressMap() when
>> possible") exposed a firmware error on an Ampere Altra machine that was
>> causing the machine to panic. Then commit 23715a26c8d8 ("arm64: efi:
>> Recover from synchronous exceptions occurring in firmware") made the EFI
>> exception non-fatal, and disabled runtime services when the exception
>> happens. The interaction between those two patches are being discussed in a
>> separate thread [1], but that should be orthogonal to this.
>>
>> Now efi.get_time() fails and each time an error message is printed to
>> dmesg, which happens several times a second and clutters dmesg
>> unnecessarily, to the point it becomes unusable.
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 23715a26c8d8
> #regzbot title arm64: efi: efi.get_time() fails and clutters dmesg
> #regzbot ignore-activity

#regzbot fixed-by: 550b33cfd445296
