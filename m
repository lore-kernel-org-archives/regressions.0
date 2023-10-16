Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1EC18AF3
	for <regressions@lists.linux.dev>; Mon, 16 Oct 2023 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qsJ32-0006bZ-4j; Mon, 16 Oct 2023 10:34:00 +0200
Message-ID: <f937d16c-b4e6-4450-8744-9f4ccada5944@leemhuis.info>
Date: Mon, 16 Oct 2023 10:33:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (Bisected) Accessing opened Bitlocker partition leads to memory
 fault and kernel panic on Imac8,1
Content-Language: en-US, de-DE
To: Linux Regressions <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Device Mapper <dm-devel@redhat.com>
References: <f1b8d8f5-2079-537e-9d0f-d58da166fe50@gmail.com>
 <ZR9dEiXhQv-wBVA2@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZR9dEiXhQv-wBVA2@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697445242;9788a87c;
X-HE-SMSGID: 1qsJ32-0006bZ-4j

On 06.10.23 03:04, Bagas Sanjaya wrote:
> On Thu, Oct 05, 2023 at 08:15:43PM +0300, Tatu Heikkilä wrote:
>> Hello,
>> I think you and the lists are right recipients, forgive me if not, I've
>> never reported kernel bugs before. Naively this seems a crypto issue and
>> Herbert Xu from crypto maintainers made the buggy commit, but it edits
>> drivers/md/dm_crypt.c maintained by dm-devel people per MAINTAINERS, so I'm
>> going by that.
>> [...]

#regzbot fix: 152d0bcdf1efcb
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
