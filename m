Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0362C80
	for <regressions@lists.linux.dev>; Thu, 23 Dec 2021 13:59:16 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1n0Ocj-0001YY-AE; Thu, 23 Dec 2021 14:59:13 +0100
Message-ID: <d679a535-828f-0a4e-5b37-1adc0ea63061@leemhuis.info>
Date: Thu, 23 Dec 2021 14:59:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [regression] kvm: Kernel OOPS in vmx.c when starting a kvm VM
 since v5.15.7 #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <f1ea22d3-cff8-406a-ad6a-cb8e0124a9b4@leemhuis.info>
 <54749944-d33d-8364-ad17-6297abf883f5@redhat.com>
 <e9c71d97-e35e-a8cb-5296-fc2398b532fa@leemhuis.info>
In-Reply-To: <e9c71d97-e35e-a8cb-5296-fc2398b532fa@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1640267956;e87f3391;
X-HE-SMSGID: 1n0Ocj-0001YY-AE



On 23.12.21 11:17, Thorsten Leemhuis wrote:
> 
> Hi, this is your Linux kernel regression tracker speaking.
> 
> On 19.12.21 14:49, Paolo Bonzini wrote:
>> On 12/19/21 06:01, Thorsten Leemhuis wrote:
>>> Hi, this is your Linux kernel regression tracker speaking.
>>>
>>> TWIMC, I stumbled on a bug report from George Shearer about a KVM
>>> problem I couldn't find any further discussions about, that's why I'm
>>> forwarding it manually here.
>>>
>>> https://bugzilla.kernel.org/show_bug.cgi?id=215351
>>>
>>> George, BTW: if reverting the change you suspect doesn't help, please
>>> consider doing a bisection to find the culprit.
>>
>> This should be fixed by commit e90e51d5f01d.  I'll send it to
>> stable@vger.kernel.org.
> 
> For the record and regzbot:
> 
> #regzbot fixed-by: 890c75c14b3d5d

Where is my brown paper bag to hide? Trying this again, this time with
the leading 6...

#regzbot fixed-by: 6890c75c14b3d5d

> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.15.y&id=6890c75c14b3d5dc8a1a355428457388cd830b82
> 
> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).
> 
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
