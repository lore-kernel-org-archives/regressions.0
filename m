Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B43C37
	for <regressions@lists.linux.dev>; Fri, 29 Sep 2023 14:06:38 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qmE8a-0003Oq-N4; Fri, 29 Sep 2023 16:06:36 +0200
Message-ID: <89cb7e1c-8b87-4072-af90-e920a9d69b88@leemhuis.info>
Date: Fri, 29 Sep 2023 16:06:36 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Read from RTC broken upon resume from suspend on HP Pro x360
 435 G9 w/ AMD Ryzen 7 5825U
Content-Language: en-US, de-DE
To: Linux Regressions <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, x86@kernel.org
References: <591e089a-6ccd-c5f3-4cd4-a332e2eae724@gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <591e089a-6ccd-c5f3-4cd4-a332e2eae724@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695996398;4af6d0f4;
X-HE-SMSGID: 1qmE8a-0003Oq-N4

On 03.07.23 15:25, Bagas Sanjaya wrote:
> Anyway, I'm adding it to regzbot:
> 
> #regzbot introduced: d2a632a8a11756 https://bugzilla.kernel.org/show_bug.cgi?id=217626
> #regzbot title: reducing RTC_UIP polling period causes broken RTC on resume from suspend

#regzbot resolve: apparently resolved by a BIOS update
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
