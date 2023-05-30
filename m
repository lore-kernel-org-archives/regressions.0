Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C768F134C8
	for <regressions@lists.linux.dev>; Tue, 30 May 2023 12:54:56 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q3ysD-0007IU-2j; Tue, 30 May 2023 14:54:49 +0200
Message-ID: <3a5a127d-875e-97a0-af56-741b3690de62@leemhuis.info>
Date: Tue, 30 May 2023 14:54:48 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <cf4f50bf-99ca-f94f-f0cf-63081d531b4c@gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: regzbot dashboard stalled (no regressions reported generated for
 v6.4-rc4)
In-Reply-To: <cf4f50bf-99ca-f94f-f0cf-63081d531b4c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1685451296;592a46e0;
X-HE-SMSGID: 1q3ysD-0007IU-2j

On 30.05.23 14:41, Bagas Sanjaya wrote:
> 
> Regressions list on regzbot dashboard [1] seems stalled. It was
> last compiled on last Sunday (2023-05-28 06:18:57 (UTC)). Is regzbot
> not running, and why?

Thx for letting me know, it ran into a bug that made it error out. And I
didn't notice yet myself, as other things kept me busy yesterday and
today. Will take a look soon!

Ciao, Thorsten
