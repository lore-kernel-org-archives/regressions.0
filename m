Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6655F2C80
	for <regressions@lists.linux.dev>; Mon, 29 Nov 2021 12:14:36 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mrfYI-0000sw-5u; Mon, 29 Nov 2021 13:14:34 +0100
Message-ID: <62e67a35-e634-2840-d190-9570e5985a51@leemhuis.info>
Date: Mon, 29 Nov 2021 13:14:31 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Bug/Regression - Ralink RT2800 kernel deference issue since
 kernel 5.14 #justforregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <c07b4142fb725ed87a2cef530bae9ee7@lost-in-the-void.net>
 <60b9dbe3-852b-9e63-2857-0264d7093930@leemhuis.info>
In-Reply-To: <60b9dbe3-852b-9e63-2857-0264d7093930@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1638188076;af40f337;
X-HE-SMSGID: 1mrfYI-0000sw-5u


On 21.11.21 14:38, Thorsten Leemhuis wrote:

> TWIMC: To be sure this issue doesn't fall through the cracks unnoticed,
> I'm adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced v5.13..v5.14
> #regzbot title Ralink RT2800 kernel deference issue since kernel 5.14
> #regzbot ignore-activity

#regzbot introduced: 03c3911d2d67
#regzbot fixed-by: 18688c80ad8a8dd50523dc9276e929932cac86d4
