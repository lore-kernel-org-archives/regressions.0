Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFF72C80
	for <regressions@lists.linux.dev>; Fri,  3 Dec 2021 17:25:01 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mtCIn-0003QH-7t; Fri, 03 Dec 2021 18:24:53 +0100
Message-ID: <e03ddc81-c60b-bd28-b959-0602142f0efc@leemhuis.info>
Date: Fri, 3 Dec 2021 18:24:52 +0100
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org>
 <3eb9c3f8-6bca-da08-47ec-af2a02d6a485@leemhuis.info>
To: regressions@lists.linux.dev
In-Reply-To: <3eb9c3f8-6bca-da08-47ec-af2a02d6a485@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1638552301;85845ddf;
X-HE-SMSGID: 1mtCIn-0003QH-7t

On 02.12.21 16:13, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> Thanks for the report.
> 
> Top-posting for once, to make this easy accessible to everyone.
> 
> FWIW, 5.14 is EOL, so it might not be fixed there. As the problem is in
> newer kernels as well, I suspect that it was a change applies to 5.15 or
> 5.16 that got backported. Maybe one of the developers might have an idea
> which commit causes it. If that's not the case you likely should try a
> bisection to find the culprit. Performing one between v5.14.11..v5.14.14
> is likely the easiest and quickest way to find it.
> 
> To be sure this issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced v5.14.11..v5.14.14
> #regzbot title usb: plugging in USB scanner breaks all USB functionality
> [regression present in 5.15.2 und 5.16-rc3, too]
> #regzbot ignore-activity

#regzbot introduced ff0e50d3564f
#regzbot fixed-by 385b5b09c3546c87cfb730b76abe5f8d73c579a2

Ciao, Thorsten, your Linux kernel regression tracker

P.S.: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.



