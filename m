Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D13B18E02
	for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qrIlq-0008V6-Ec; Fri, 13 Oct 2023 16:04:06 +0200
Message-ID: <26447379-118c-451a-8ba4-6a9bc3a45ad2@leemhuis.info>
Date: Fri, 13 Oct 2023 16:04:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Resume broken on T14s Gen1 (AMD) due to "Input:
 psmouse - add delay when deactivating for SMBus mode"
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ca0109fa-c64b-43c1-a651-75b294d750a1@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ca0109fa-c64b-43c1-a651-75b294d750a1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697205848;8cb43c98;
X-HE-SMSGID: 1qrIlq-0008V6-Ec

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 27.09.23 10:54, Thorsten Leemhuis wrote:
> Hi Jeffery! Your change 92e24e0e57f72e ("Input: psmouse - add delay when
> deactivating for SMBus mode") [merged for v6.6-rc1] broke resume on my
> T14s Gen1 (AMD): the system didn't really resume again at all (the
> display almost always didn't re-initialize) and there was nothing in the
> logs. I found your commit to be the culprit using a bisection and
> confirmed that reverting it on top of Linux 6.6-rc3 makes thing work
> again for me.
> 
> #regzbot introduced 92e24e0e57f72e
> #regzbot title Input: psmouse - Resume broken on T14s Gen1 (AMD) due to
> a new delay when deactivating for SMBus mode

#regzbot monitor:
https://lore.kernel.org/all/20231004005729.3943515-1-jefferymiller@google.com/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
