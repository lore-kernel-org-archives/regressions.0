Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9E2561
	for <regressions@lists.linux.dev>; Sat, 21 Jan 2023 14:04:23 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pJETj-0004S4-Hk; Sat, 21 Jan 2023 15:04:19 +0100
Message-ID: <4d435512-5209-01c9-8e23-4dec0271cec5@leemhuis.info>
Date: Sat, 21 Jan 2023 15:04:19 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Is there a known boot failure with 6.2-rc and the Intel SDV EFI
 systems?
Content-Language: en-US, de-DE
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-efi@vger.kernel.org
References: <f2503170d12dc567c00998d4e72ba806f7677730.camel@HansenPartnership.com>
 <0eabbe98-db6e-b5db-ca5b-3f212bf2f734@leemhuis.info>
 <e75c7d4be4cda26dc1e40a88e8de5cfa12810d3f.camel@HansenPartnership.com>
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <e75c7d4be4cda26dc1e40a88e8de5cfa12810d3f.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674309863;95dbbc72;
X-HE-SMSGID: 1pJETj-0004S4-Hk



On 21.01.23 14:23, James Bottomley wrote:
> On Sat, 2023-01-21 at 14:20 +0100, Linux kernel regression tracking
> (#adding) wrote:
>> [TLDR: I'm adding this report to the list of tracked Linux kernel
>> regressions; the text you find below is based on a few templates
>> paragraphs you might have encountered already in similar form.
>> See link in footer if these mails annoy you.]
> 
> This isn't an EFI regression.  It actually bisects to an oops in one of
> my modified TPM drivers which is being initialized early because of
> IMA.  The problem is the EFI console isn't showing it, so I just get no
> output after loading the initrd but, as far as I can tell, this is a
> longstanding problem.

Thx for the update, in that case:

#regzbot resolve: turns out it apparently is a longstanding problem and
not a regression

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity
