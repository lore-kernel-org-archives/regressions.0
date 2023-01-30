Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5403B20E3
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 11:23:57 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pMSGO-0004sR-L9; Mon, 30 Jan 2023 12:23:52 +0100
Message-ID: <7df25a70-2ec8-88ae-14ae-8ff000217924@leemhuis.info>
Date: Mon, 30 Jan 2023 12:23:52 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
Content-Language: en-US, de-DE
To: Jason Montleon <jmontleo@redhat.com>, gregkh@linuxfoundation.org
Cc: casaxa@gmail.com, cezary.rojewski@intel.com, lma@semihalf.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 regressions@lists.linux.dev, stable@vger.kernel.org
References: <CAJD_bPJ1VYTSQvogui4S9xWn9jQzQq8JRXOzXmus+qoRyrybOA@mail.gmail.com>
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAJD_bPJ1VYTSQvogui4S9xWn9jQzQq8JRXOzXmus+qoRyrybOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675077837;dbf2fc2e;
X-HE-SMSGID: 1pMSGO-0004sR-L9

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 28.01.23 18:09, Jason Montleon wrote:
> I did a bisect which implicated
> f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338 as the first bad commit.
> 
> Reverting this commit on 6.1.8 gives me working sound again.
> 
> I'm not clear why this is breaking 6.1.x since it appears to be in
> 6.0.18 (7494e2e6c55e), which was the last working package in Fedora
> for the 6.0 line. Maybe something else didn't make it into 6.1?

In that case let me update the tracking data:

#regzbot introduced: f2bd1c5ae2cb0cf95
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

