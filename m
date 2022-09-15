Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DD64A1A
	for <regressions@lists.linux.dev>; Thu, 15 Sep 2022 17:13:17 +0000 (UTC)
Received: from [185.122.133.20] (helo=[172.16.40.43]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oYrvx-0001jN-NH; Thu, 15 Sep 2022 18:41:49 +0200
Message-ID: <6a566bbe-0f14-e8cc-808e-a3cecd7d6d04@leemhuis.info>
Date: Thu, 15 Sep 2022 17:41:49 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CADy0EvL2XuWTjUdWHUHTpW3ZYaLWn0ftR-nUBioUqh-n-N=dXQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [REGRESSION] introduced in 5.10.140 causes drives to drop from
 LSI SAS controller (Bisected to 6d17a112e9a63ff6a5edffd1676b99e0ffbcd269)
 #forregzbot
In-Reply-To: <CADy0EvL2XuWTjUdWHUHTpW3ZYaLWn0ftR-nUBioUqh-n-N=dXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1663261998;7f825565;
X-HE-SMSGID: 1oYrvx-0001jN-NH

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 15.09.22 03:13, Jason Wittlin-Cohen wrote:
> #regzbot introduced 6d17a112e9a63ff6a5edffd1676b99e0ffbcd269

#regzbot dup-of:
https://lore.kernel.org/r/CADy0EvLGJmZe-x9wzWSB6%2BtDKNuLHd8Km3J5MiWWYQRR2ctS3A@mail.gmail.com/
