Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FA92F80
	for <regressions@lists.linux.dev>; Wed, 29 Sep 2021 05:56:20 +0000 (UTC)
Received: from ip4d14bdef.dynamic.kabel-deutschland.de ([77.20.189.239] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mVSZf-0006Io-Ie; Wed, 29 Sep 2021 07:56:11 +0200
Message-ID: <3aa4451f-4287-f162-cf60-6a735d7b4276@leemhuis.info>
Date: Wed, 29 Sep 2021 07:56:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-BZ
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <4970a940-211b-25d6-edab-21a815313954@protonmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [regression] Bluetooth: Query LE tx power on startup broke
 Bluetooth on MacBookPro16,1
In-Reply-To: <4970a940-211b-25d6-edab-21a815313954@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1632894980;dadaecbb;
X-HE-SMSGID: 1mVSZf-0006Io-Ie



On 29.09.21 07:09, Orlando Chamberlain wrote:
> Commit 7c395ea521e6 made Bluetooth stop working on the MacBookPro16,1. I
> 
> believe this also affected the iMac20,1. The patch below introduces a quirk
> 
> disabling Read LE Min/Max Tx Power for affected computers, based off the brcm
> chip
>  id 150.

Feel free to ignore this message. I write it to make regzbot track above
issue. Regzbot is the regression tracking bot I'm working on. It's still
in the early stages and this is still one of the first few regression I
make it track to get started and things tested in the field. That also
why I'm sending the mail just to the regressions list (it will do its
fully magic nevertheless). For details see:
https://linux-regtracking.leemhuis.info/post/inital-regzbot-running/
https://linux-regtracking.leemhuis.info/post/regzbot-approach/

#regzbot ^introduced 7c395ea521e6

Ciao, Thorsten


