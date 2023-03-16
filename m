Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A072574
	for <regressions@lists.linux.dev>; Thu, 16 Mar 2023 09:40:42 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pck6C-0006hK-2D; Thu, 16 Mar 2023 10:40:40 +0100
Message-ID: <b5186e47-d448-9706-d0b6-45c49d03f4a2@leemhuis.info>
Date: Thu, 16 Mar 2023 10:40:39 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [REGRESSION] External mic not working on Lenovo Ideapad U310,
 ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model
Content-Language: en-US, de-DE
To: tangmeng <tangmeng@uniontech.com>, Takashi Iwai <tiwai@suse.de>,
 Jetro Jormalainen <jje-lxkl@jetro.fi>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230308215009.4d3e58a6@mopti> <87o7ou9jfi.wl-tiwai@suse.de>
 <927A9CC7D19E5BD6+6758c124-1a86-a981-d3cf-fa0da9ab589e@uniontech.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <927A9CC7D19E5BD6+6758c124-1a86-a981-d3cf-fa0da9ab589e@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678959642;d356dde0;
X-HE-SMSGID: 1pck6C-0006hK-2D

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 16.03.23 03:01, tangmeng wrote:
> 
> On 2023/3/15 22:29, Takashi Iwai wrote:
> 
>>
>> Sounds like multiple models using the same PCI SSID.
>> Could you share the alsa-info.sh output?
>> Meng, also could you give alsa-info.sh output of Lenovo 20149, too?
>>
>>
> Sorry, because the environment used before belongs to the customer's
> environment, the environment has been returned to the customer after the
> verification is completed.
> Output information is no longer available.

#regzbot inconclusive: unsolved, but reporter has no access to device
anymore
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


