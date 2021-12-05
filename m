Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B731F2CA0
	for <regressions@lists.linux.dev>; Sun,  5 Dec 2021 18:09:38 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mtvx9-0008AD-Si; Sun, 05 Dec 2021 19:09:35 +0100
Message-ID: <77858143-5bbf-4c85-3bcf-e8cfddb8b66a@leemhuis.info>
Date: Sun, 5 Dec 2021 19:09:35 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Regression: plugging in USB scanner breaks all USB functionality
 #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org>
 <3eb9c3f8-6bca-da08-47ec-af2a02d6a485@leemhuis.info>
 <e03ddc81-c60b-bd28-b959-0602142f0efc@leemhuis.info>
 <Yas83rCCAQcabahe@kroah.com>
 <73b325e3-d5d9-f768-9033-3aa0d3683e47@leemhuis.info>
 <YatGfEzzniH/Srn4@kroah.com>
 <7d5df080-0564-f265-f0b3-eb3dbca41599@leemhuis.info>
In-Reply-To: <7d5df080-0564-f265-f0b3-eb3dbca41599@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1638727778;21b2fe62;
X-HE-SMSGID: 1mtvx9-0008AD-Si


On 04.12.21 12:06, Thorsten Leemhuis wrote:
>
> Great, thx for letting me known, then I will let regzbot know:
> 
> #regbzot fixed-by: 09f736aa9547

Trying this again, this time with more love and without shuffling some
characters:

#regzbot fixed-by: 09f736aa9547

Ciao, Thorsten, your Linux kernel regression tracker.

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.
