Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671FC7B
	for <regressions@lists.linux.dev>; Sun, 30 Oct 2022 16:54:41 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1opBa3-0008Re-8k; Sun, 30 Oct 2022 17:54:39 +0100
Message-ID: <0d4c6064-4869-f841-0c46-399264474f94@leemhuis.info>
Date: Sun, 30 Oct 2022 17:54:38 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Regression: starting powertop crashes my machine hard since
 838d9bb62d13 ("perf: Use sample_flags for raw_data") #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
References: <6e7f32f2-5397-e0cf-4271-a9826d318996@leemhuis.info>
In-Reply-To: <6e7f32f2-5397-e0cf-4271-a9826d318996@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667148881;2665cfff;
X-HE-SMSGID: 1opBa3-0008Re-8k

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 25.10.22 20:40, Thorsten Leemhuis wrote:
> Hi! Since 838d9bb62d13 ("perf: Use sample_flags for raw_data") starting
> powertop makes my machine crash hard: keyboard is dead, Sysrq does not
> work, and most of the time there is not even a error message on the
> screen; only once in maybe ~20 cases I got the line "kernel NULL pointer
> dereference, address: 0000000000000010", but nothing else.
>  
> #regzbot introduced 838d9bb62d13

#regzbot fixed-by: 4b66ff46f2e18
