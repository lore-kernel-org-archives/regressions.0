Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F82B1103
	for <regressions@lists.linux.dev>; Tue, 17 May 2022 05:39:28 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nqpvZ-0003Ap-Mm; Tue, 17 May 2022 07:39:25 +0200
Message-ID: <0ab3e9bc-e156-e064-cf00-8464e09c6d56@leemhuis.info>
Date: Tue, 17 May 2022 07:39:23 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Bug 215742 - The NVME storage quirked as SIMPLE SUSPEND makes
 system resume failed after suspend (Regression) #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <edba451c-1798-c60e-5d84-0a9f6a5d134d@leemhuis.info>
In-Reply-To: <edba451c-1798-c60e-5d84-0a9f6a5d134d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1652765968;96adc3f7;
X-HE-SMSGID: 1nqpvZ-0003Ap-Mm

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 01.04.22 09:55, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org that afaics nobody
> acted upon since it was reported about a week ago, that's why I decided
> to forward it to the lists and all people that seemed to be relevant
> here. Mario, could you maybe take a look at this? Or is that something
> for the NVM or ACPI people? Or was this discussed somewhere else
> already? Or even fixed?
> 
> To quote from https://bugzilla.kernel.org/show_bug.cgi?id=215742 :

#regzbot fixed-by: d52848620de00c ("ACPI: PM: Block ASUS B1400CEAE from
suspend to idle by default")

Ciao, Thorsten

