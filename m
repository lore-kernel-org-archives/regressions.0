Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0A2C9E
	for <regressions@lists.linux.dev>; Wed,  9 Nov 2022 15:55:40 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1osnQQ-0004uJ-4T; Wed, 09 Nov 2022 16:55:38 +0100
Message-ID: <2889908a-6bef-fd34-5a57-ceea4138a0a9@leemhuis.info>
Date: Wed, 9 Nov 2022 16:55:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Regression after recent changes to drivers/thermal/thermal_of.c
 #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Linux PM list <linux-pm@vger.kernel.org>
References: <CACRpkdbB5hgkrPZVb-+9tuKErvwjTKNaBQ1LvH1==fR7bndjSQ@mail.gmail.com>
 <9e747f87-1854-dbd7-ef3a-1effc2b90e3b@leemhuis.info>
In-Reply-To: <9e747f87-1854-dbd7-ef3a-1effc2b90e3b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1668009340;92cec1cd;
X-HE-SMSGID: 1osnQQ-0004uJ-4T

On 26.10.22 11:29, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]

> #regzbot ^introduced 8c596324232d22e19f
> #regzbot title dt-bindings: thermal: thermal zone without trip points broke
> #regzbot ignore-activity

#regzbot fixed-by: cd73adcdba
